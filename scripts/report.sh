#/bin/bash
#Exam system project
#*******************

#Team Members
#************
#1) Mohamed Gnedy
#2) Mai Mohamed
       E='echo -e';e='echo -en';trap "R;exit" 2
	#shuf -i1-5 -n5 > temparr
	#readarray arr < temparr
	#rm temparr
	#rslt=0
	#fullMark=${#arr[@]}
	#index=0
	#qnum=1
     ESC=$( $e "\033")
    TPUT(){ $e "\033[${1};${2}H";}
   CLEAR(){ $e "\033c";}
   CIVIS(){ $e "\033[?25l";}
    DRAW(){ $e "\033%@\033(0";}
   WRITE(){ $e "\033(B";}
    MARK(){ $e "\033[7m";}
  UNMARK(){ $e "\033[27m";}
    BLUE(){ $e "\033c\033[H\033[J\033[37;44m\033[J";};BLUE
       C(){ CLEAR;BLUE;}
  MHEAD(){ MARK;TPUT 1 1
       $E " REOPRT                                                                         ";UNMARK
            DRAW
            for each in $(seq 1 15);do
             $E "x                                                                              x"
            done;WRITE;}
            
    HEAD(){ MARK;TPUT 1 1
       $E "  No.   Questions                                                                Ans1        Ans2       Ans3      Ans4     No.Correct Ans    No.Wrong Ans ";UNMARK
            DRAW
            for each in $(seq 1 54);do
             $E "x                                                                              x                x               x               x          x           x          "              
            done;WRITE;}
            
    EHEAD(){ MARK;TPUT 1 1
       $E "   Exam ID                      USER Name                            Grade       ";UNMARK
            DRAW
            for each in $(seq 1 18);do
             $E "x                     x                             x                       x "
            done;WRITE;}        
  
            i=0; CLEAR; CIVIS;NULL=/dev/null
    MAINFOOT(){ MARK;TPUT 17 1
            printf "ENTER=SELECT, UP/DN=NEXT OPTION                                                 ";UNMARK;}
    FOOT(){ MARK;TPUT 100 1
            printf "ENTER=REPORT MENU                                                                                       ";UNMARK;}
    EFOOT(){ MARK;
            printf "                                                                                       ";UNMARK;}
   ARROW(){ read -s -n3 key 2>/dev/null >&2
            if [[ $key = $ESC[A ]];then echo up;fi
            if [[ $key = $ESC[B ]];then echo dn;fi;}
POSITION(){ if [[ $cur = up ]];then ((i--));fi
            if [[ $cur = dn ]];then ((i++));fi
            if [[ i -lt 1   ]];then i=$LM;fi
            if [[ i -gt $LM ]];then i=1;fi;}
 REFRESH(){ after=$((i+1)); before=$((i-1))
            if [[ $before -lt 1  ]];then before=$LM;fi
            if [[ $after -gt $LM ]];then after=1;fi
            if [[ $j -lt $i      ]];then UNMARK;M$before;else UNMARK;M$after;fi
            if [[ $after -eq 1   ]] || [[ $before -eq $LM ]];then
            UNMARK; M$before; M$after;fi;j=$i;UNMARK;M$before;M$after;}



      M0(){ TPUT 6  15;}
      M1(){ TPUT 7  15; $e "Report for easy questions";}
      M2(){ TPUT 8  15; $e "Report for medium questions";}
      M3(){ TPUT 9  15; $e "Report for hard questions";}
      M4(){ TPUT 10 15; $e "Report for users exams";}
      M5(){ TPUT 11 20; $e "Back to MainMenu   ";}
     LM=5    #Last Menu number
    MENU(){ for each in $(seq 0 $LM);do M${each};done;}
    MINIT(){ BLUE;MHEAD;MAINFOOT;MENU;}
    EINIT(){ BLUE;EHEAD;}
    INIT(){ BLUE;HEAD;FOOT;}
      SC(){ REFRESH;MARK;$S;cur=`ARROW`;}
      ES(){ MARK;$e "\nENTER = Report Menu ";$b;read;CLEAR;MINIT;}



qsReport(){
#EINIT;
d=1;
 if [ -e tempfile.txt ]
then
rm -f tempfile.txt
else
touch tempfile.txt
fi

while [ $d -lt 51 ]
do
      $e $d") " >> tempfile.txt
      q=`mysql -D examsystem -unewuser -e "select  question  from examsystem.$1 where eqid = '$d'"; 2> $NULL`
      q=`echo $q | cut -d" " -f2-`
      $e $q "\n" >> tempfile.txt
      ccount=`mysql -D examsystem -unewuser -e "select ccount from examsystem.$1 where eqid = '$d'"; 2> $NULL`
      ccount=`echo $ccount | cut -d" " -f2-`
     # $e `echo "   "$ccount "     |"`
      fcount=`mysql -D examsystem -unewuser -e "select fcount from examsystem.$1 where eqid = '$d'"; 2> $NULL`
      fcount=`echo $fcount | cut -d" " -f2-`

      # $e `echo "   "$fcount "     |\n"`
      ans1=`mysql -D examsystem -unewuser -e "select  ans1 from $1 where eqid = '$d'"; 2> $NULL`
      ans1=`echo $ans1 | cut -d" " -f2-`
      $e ".    c) "$ans1 "\n"  >> tempfile.txt
     # printf '%s\n' "$var"
      ans2=`mysql -D examsystem -unewuser -e "select  ans2 from $1 where eqid = '$d'"; 2> $NULL`
      ans2=`echo $ans2 | cut -d" " -f2-`
      $e  ".    b) "$ans2 "\n"  >> tempfile.txt
      ans3=`mysql -D examsystem -unewuser -e "select  ans3 from $1 where eqid = '$d'"; 2> $NULL`
      ans3=`echo $ans3 | cut -d" " -f2-`
      $e  ".    c) "$ans3 "\n"  >> tempfile.txt
      ans4=`mysql -D examsystem -unewuser -e "select  ans4 from $1 where eqid = '$d'"; 2> $NULL`
      ans4=`echo $ans4 | cut -d" " -f2-`;
      $e ".    d) "$ans4 "\n"  >> tempfile.txt
        cans=`mysql -D examsystem -unewuser -e "select  cans from $1 where eqid = '$d'"; 2> $NULL`
      cans=`echo $cans | cut -d" " -f2-`;
        $e ". The correct answer is : " $cans "\n"   >> tempfile.txt
 $e ". Total number of correct answers : " $ccount "\n"   >> tempfile.txt
        $e ". Total number of wrong answers : " $fcount "\n"   >> tempfile.txt
      $e "-----------------------------------------------------------------------------------------------------------\n"  >> tempfile.txt
      d=$(($d+1));
done
less tempfile.txt;
rm -f tempfile.txt;
}





examsreport(){
EINIT;
h=1;
MID=`mysql -D examsystem -unewuser -e "select  max(eid)  from exams "; 2> $NULL`
MID=`echo $MID | cut -d" " -f2-`
#$e `echo $MID`
if [[ $MID != "NULL" && $MID -ge 1 ]]
then
#$e " inside if"
   while [ $h -le $MID ]
   do
#$e "inside while"
      k=$(($h+1));
      TPUT $k  10; 
      $e $h  
      TPUT $k  30;   
username=`mysql -D examsystem -unewuser -e "select username from users inner join exams on uid = userid where userid = (select userid from examsystem.exams where eid = '$h') limit 1";2> $NULL`
      username=`echo $username | cut -d" " -f2-`
	


        
  #    userid=`mysql -D examsystem -unewuser -e "select  userid  from exams where eid = '$h'" ; 2> $NULL`
#      userid=`echo $userid | cut -d" " -f2-`
	$e  $username
      TPUT $k  60;
      grade=`mysql -D examsystem -unewuser -e "select  grade  from exams where eid = '$h'" ; 2> $NULL`
      grade=`echo $grade | cut -d" " -f2-`
	$e $grade
      h=$(($h+1));
   done
else
  TPUT  2 30 ;
  $e `echo "No Exams" ` 
fi
h=1;
}

MINIT;


while [[ "$O" != " "  && ! -z "$0" ]]; do case $i in
      0) S=M0;
	    #SC;
      # if [[ $cur = "" ]];
      # then C;fi
	;;
      1) S=M1;SC;if [[ $cur = "" ]];
	    then C;
      tableName="easyqs" 
      qsReport $tableName;
	 TPUT 20 1 ;
	CLEAR;
        ES; 
	CLEAR;
	MINIT;
  fi;;
      2) S=M2;SC;if [[ $cur = "" ]];
	    then C;
      tableName="mediumqs";
      qsReport $tableName;
	 TPUT 20 1 ;
        ES;
	 CLEAR;
        MINIT;

  fi;;
 
      3) S=M3;SC;if [[ $cur = "" ]];
	    then C;
      tableName="hardqs";
      qsReport $tableName;
	 TPUT 20 1 ;
        ES;
	 CLEAR;
        MINIT;
 

  fi;;
 
      4) S=M4;SC;if [[ $cur = "" ]];
	    then C;
      examsreport;
	TPUT 20 1 ;
	ES; 
	 CLEAR;
        MINIT;
	
  fi;;
 
      5)  S=M5;SC;if [[ $cur = "" ]];then C;exit 0;fi;;  
esac;POSITION;done
CLEAR



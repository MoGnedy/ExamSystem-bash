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
	numOfQs=0;
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
    HEAD(){ MARK;TPUT 1 1
       $E "Exam                                                                  ";UNMARK
            DRAW
            for each in $(seq 1 15);do
             $E "x                                                                    x"
            done;WRITE;}
            i=0; CLEAR; CIVIS;NULL=/dev/null
    FOOT(){ MARK;TPUT 17 1
            printf "ENTER=SELECT, UP/DN=NEXT OPTION                                       ";UNMARK;}
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






      M0(){ TPUT 6  15;$e "Choose exams's number of qestions ?";}
      M1(){ TPUT 7  18; $e "15 Qestions";}
      M2(){ TPUT 8  18; $e "30 Qestions";}
      M3(){ TPUT 9 18; $e "45 Qestions ";}
      M4(){ TPUT 10  20; $e "ABOUT  ";}
      M5(){ TPUT 11 20; $e "EXIT   ";}
      LM=3    #Last Menu number
    MENU(){ for each in $(seq 0 $LM);do M${each};done;}
    INIT(){ BLUE;HEAD;FOOT;MENU;}
      SC(){ REFRESH;MARK;$S;cur=`ARROW`;}
	startExam(){ MARK;$e "\nENTER = Start Exam ";$b;read;};
      ES(){ MARK;$e "\nENTER = main menu ";$b;read;INIT;};


INIT;


while [[ "$O" != " "  && ! -z "$0" ]]; do case $i in
      0) S=M0;
	#SC;
	# if [[ $cur = "" ]];
	# then C;fi
	;;
      1) S=M1;SC;if [[ $cur = "" ]];
	     then
         C;
	startExam;
export id;
        export username
	numOfQs=5;
	export numOfQs;
	./scripts/startexam.sh;
	exit 0;
        fi;;

      2) S=M2;SC;if [[ $cur = "" ]];
	then
	 C;
	startExam;
	numOfQs=10;
	#export startExam;
        export id;
        export username;
        export numOfQs;
        ./scripts/startexam.sh;
	

	exit 0;
	
	fi;;
	
      3) S=M3;SC;if [[ $cur = "" ]];
	     then
	        C;
           	 startExam;
	export id;
        export username;

	numOfQs=15;
        export numOfQs;
        ./scripts/startexam.sh;
	exit 0;
    	fi;;
      
	
	4) S=M4;SC;if [[ $cur = "" ]];then C;$e "o5:$($e by Gnedy) \n ";ES;fi;;

	5) S=M5;SC;if [[ $cur = "" ]];then C;exit 0;fi;;
esac;POSITION;done
CLEAR

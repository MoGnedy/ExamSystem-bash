#/bin/bash
#Exam system project
#*******************

#Team Members
#************
#1) Mohamed Gnedy
#2) Mai Mohamed

       E='echo -e';e='echo -en';trap "R;exit" 2
	rslt=0
	#fullMark=${#qsArray[@]}
	counter=1;
	index=0
	qnum=1
	tableName=""
	grade=""
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
       $E "Exam                                                                            ";UNMARK
            DRAW
            for each in $(seq 1 15);do
             $E "x                                                                              x"
            done;WRITE;}
            i=0; CLEAR; CIVIS;NULL=/dev/null
    FOOT(){ MARK;TPUT 17 1
            printf "ENTER=SELECT, UP/DN=NEXT OPTION                                                 ";UNMARK;}
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






      M0(){ TPUT 2 2; $e "Q-"$qnum")" $q;}
      M1(){ TPUT 4 2; $e "a)" $ans1;}
      M2(){ TPUT 5 2; $e "b)" $ans2;}
      M3(){ TPUT 6 2; $e "c)" $ans3;}
      M4(){ TPUT 7 2; $e "d)" $ans4;}
      M5(){ TPUT 8 20; $e "ABOUT  ";}
      M6(){ TPUT 9 20; $e "EXIT   ";}
     LM=4    #Last Menu number
    MENU(){ for each in $(seq 0 $LM);do M${each};done;}
    INIT(){ BLUE;HEAD;FOOT;NEXTQ;MENU;}
      SC(){ REFRESH;MARK;$S;cur=`ARROW`;}
      ES(){ MARK;$e "\nENTER = main menu ";$b;read;INIT;};

  randomQs(){
        shuf -i1-50 -n$numOfQs > temparr;
        readarray qsArray < temparr;
        rm temparr;
fullMark=${#qsArray[@]}; }


userGrade(){
tempGrade=$(($(($rslt/$fullMark))*100))
if [ tempGrade -ge 90 ]
then 
grade="Exellent"
elif [ tempGrade -ge 75 ]
then
grade="V.Good"
elif [ tempGrade -ge 60 ]
then
grade="Good"
elif [ tempGrade -ge 50 ]
then
grade="pass"
else 
grade="Fail"
fi

}









NEXTQ(){
if [[ $counter -eq 1 ]]
then
tableName="easyqs"
randomQs;
elif [[ $counter -eq $(($fullMark + 1)) ]]
then
tableName="mediumqs"
randomQs
index=0;
elif [[ $counter -eq $(($(($fullMark * 2)) + 1)) ]]
then
tableName="hardqs"
randomQs
index=0;
fi
#echo "\nindex = " $index;
#echo " random array = "${qsArray[*]};
#echo "TableName =" $tableName;
#echo " user id = " $id " user name = " $username " rslt = " $rslt "your answer = "  $yourAnswer "correct answer =" $answer
q=`mysql -D examsystem -unewuser -e "select  question from $tableName where eqid = '${qsArray[$index]}'";   2> $NULL`
q=`echo $q | cut -d" " -f2-`
#echo $i `mysql -D examsystem -unewuser -e "select  question from hardqs where eqid = '$x'"; 2>/dev/null`
ans1=`mysql -D examsystem -unewuser -e "select  ans1 from $tableName where eqid = '${qsArray[$index]}'"; 2> $NULL`
ans1=`echo $ans1 | cut -d" " -f2-`
ans2=`mysql -D examsystem -unewuser -e "select  ans2 from $tableName where eqid = '${qsArray[$index]}'"; 2> $NULL`
ans2=`echo $ans2 | cut -d" " -f2-`
ans3=`mysql -D examsystem -unewuser -e "select  ans3 from $tableName where eqid = '${qsArray[$index]}'"; 2> $NULL`
ans3=`echo $ans3 | cut -d" " -f2-`
ans4=`mysql -D examsystem -unewuser -e "select  ans4 from $tableName where eqid ='${qsArray[$index]}'"; 2> $NULL`
ans4=`echo $ans4 | cut -d" " -f2-`;
counter=$(($counter+1));

}
getAnswer(){
answer=`mysql -D examsystem -unewuser -e "select  cans from $tableName where eqid = '${qsArray[$(($index-1))]}'"; 2> $NULL`
answer=`echo $answer | cut -d" " -f2`
}
 
answeredCorrect(){
mysql -D examsystem -unewuser -e "update examsystem.$tableName set ccount = ccount + 1 where eqid = '${qsArray[$index]}' ";
}
answeredWrong(){
mysql -D examsystem -unewuser -e "update examsystem.$tableName set fcount = fcount + 1 where eqid = '${qsArray[$index]}' ";
}

insertGrade()
{
mysql -D examsystem -unewuser -e " insert into exams (userid,grade,date,time) values ($id,'$grade',CURDATE(),CURTIME()) ";
}





INIT;


while [[ "$O" != " " && $index -lt ${#qsArray[@]} && ! -z "$0" ]]; do case $i in
      0) S=M0;
	#SC;
	# if [[ $cur = "" ]];
	# then C;fi
	;;
      1) S=M1;SC;if [[ $cur = "" ]];
	then C;
	index=$(($index + 1));qnum=$(($qnum+1));
        getAnswer;yourAnswer="a";
        if [ $yourAnswer == $answer ];then
        answeredCorrect
        rslt=$(($rslt+1))
        else
        answeredWrong;
        fi;

	INIT;TPUT 2 2;fi;;
      2) S=M2;SC;if [[ $cur = "" ]];
	then C;
	index=$(($index + 1));qnum=$(($qnum+1));
	getAnswer;yourAnswer="b";
	if [ $yourAnswer == $answer ];then
	answeredCorrect
	rslt=$(($rslt+1))
	else
        answeredWrong;
	fi;
	TPUT 3 2;INIT;fi;;
      3) S=M3;SC;if [[ $cur = "" ]];
	then C;
	index=$(($index + 1));qnum=$(($qnum+1));getAnswer;yourAnswer="c";
	if [ $yourAnswer == $answer ];then
	answeredCorrect
	rslt=$(($rslt+1))
	else
        answeredWrong;
	fi;
	TPUT 3 2;INIT;fi;;
      4) S=M4;SC;if [[ $cur = "" ]];
	then C;
	index=$(($index + 1));qnum=$(($qnum+1));
	getAnswer;yourAnswer="d";
	if [ $yourAnswer == $answer ];then
	answeredCorrect
	rslt=$(($rslt+1))
	else
        answeredWrong;
	fi;
	TPUT 3 2;INIT;fi;;
      5) S=M5;SC;if [[ $cur = "" ]];then C;$e "o5:$($e by Gnedy) \n ";ES;fi;;
      6) S=M6;SC;if [[ $cur = "" ]];then C;exit 0;fi;;
esac;POSITION;done
userGrade;
insertGrade;
CLEAR
echo -e  "Your Degree is " $rslt \\ $(($fullMark * 3));
$e " Your Grade is : " $grade
ES;

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






      M0(){ TPUT 6  15;}
      M1(){ TPUT 7  20; $e "Sign Up";}
      M2(){ TPUT 8  12; $e "Login to start your exam";}
      M3(){ TPUT 9 15; $e "Report for admin ";}
      M4(){ TPUT 10  20; $e "ABOUT  ";}
      M5(){ TPUT 11 20; $e "EXIT   ";}
      LM=5    #Last Menu number
    MENU(){ for each in $(seq 0 $LM);do M${each};done;}
    INIT(){ BLUE;HEAD;FOOT;MENU;}
      SC(){ REFRESH;MARK;$S;cur=`ARROW`;}
	startExam(){ MARK;$e "\nENTER = Start Exam ";$b;read;};
      ES(){ MARK;$e "\nENTER = main menu ";$b;read;INIT;};

signup(){
read -p "Enter your first name : "  entereduserfname;
read -p "Enter your last  name : "  entereduserlname;
read -p "Enter your user  name : "  enteredusername;
}

registeCheck(){
username=`mysql -D examsystem -unewuser -e "select  username from users where username = '$enteredusername'";  2> $NULL`
username=`echo $username | cut -d" " -f2`
}
registe(){
mysql -D examsystem -unewuser -e "insert into users(fname,lname,username) values('$entereduserfname','$entereduserlname','$enteredusername') ";2>$NULL
id=`mysql -D examsystem -unewuser  -e "select uid from users where username = '$enteredusername'";  2> $NULL`
id=`echo $id | cut -d" " -f2`
}

login(){
read -p "Enter Your id :  "  enteredid;
read -p "Enter your username : "  enteredusername;
}


loginCheck(){
username=`mysql -D examsystem -unewuser -e "select  username from users where uid = '$enteredid'";  2> $NULL`
username=`echo $username | cut -d" " -f2`
id=`mysql -D examsystem -unewuser -e "select uid from users where username = '$enteredusername'";  2> $NULL`
id=`echo $id | cut -d" " -f2`
}


adminLogin(){
read -p "Enter your name : "  enteredadminname;
read -s -p "Enter Your password :  "  enteredpass;
}


adminLoginCheck(){
adminname=`mysql -D examsystem -unewuser -e "select  adminName from admins where adminpass = md5('"$enteredpass"')";  2> $NULL`
adminname=`echo $adminname | cut -d" " -f2`
}

INIT;


while [[ "$O" != " "  && ! -z "$0" ]]; do case $i in
      0) S=M0;
	#SC;
	# if [[ $cur = "" ]];
	# then C;fi
	;;
      1) S=M1;SC;if [[ $cur = "" ]];
	     then
         C;signup;
         registeCheck;
         if [[ -z $username ]]
         then  
           if [[ ! -z $entereduserfname && ! -z $enteredusername ]]
	         then
              registe;
              $e "sign up Succesful";
	            $e "\nYour id is " $id 
              ES;
           else 
              $e "user first name or  user name is Empty"
              ES;
           fi;
         else
           $e "There is user with this name please change your username"
           ES;
         fi;
       CLEAR;
	INIT;
        fi;;

      2) S=M2;SC;if [[ $cur = "" ]];
	then
	 C;login;loginCheck;
	if [[ ! -z $enteredid && ! -z $enteredusername ]]
	then
	#$e "NOt Empty"
	#$e-$enteredid- '\n' -$id- '\n' ;
	#$e-$enteredusername- '\n' -$username- '\n';
	
	if [[  $enteredusername == $username ]];then
	#$e -$enteredid- -$id-;
	#$e -$enteredusername- " " -$username-;
	$e "login Succesful";
	$e "\nWelcome $username"
	startExam;
	export startExam;
	export id;
	export username;
	./scripts/numofqs.sh 
	else 
	$e "Invalid id or username"
	ES;
	fi;
	else 
	$e "Username or id is empty"
	ES;
	
	fi;
	 CLEAR;
        INIT;

#exit 0;	
	fi;;
      3) S=M3;SC;if [[ $cur = "" ]];
	     then
	        C;adminLogin;adminLoginCheck;
	        if [[ ! -z $enteredpass && ! -z $enteredadminname ]]
	        then
         	   #$e "NOt Empty"
         	   #$e-$enteredpass- '\n' -$pass- '\n' ;
        	   #$e-$enteredadminname- '\n' -$adminname- '\n';
          	 if [[  $enteredadminname == $adminname ]];then
	              #$e -$enteredpass- -$pass-;
           	    #$e -$enteredadminname- " " -$adminname-;
                  #  echo "hi"
	             ./scripts/report.sh 
           	 else 
	              $e "Invalid id or admin name"
            	  ES;
             fi;
          else 
	           $e "Admin name or password is empty"
           	 ES;
          fi;
	 CLEAR;
        INIT;
		
    	fi;;
      

	4) S=M4;SC;if [[ $cur = "" ]];then C;$e "`cat about.txt` \n ";ES;fi;;

	5) S=M5;SC;if [[ $cur = "" ]];then C;exit 0;fi;;
esac;POSITION;done
CLEAR

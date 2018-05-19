-- MySQL dump 10.13  Distrib 5.7.17, for Linux (x86_64)
--
-- Host: localhost    Database: examsystem
-- ------------------------------------------------------
-- Server version	5.7.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adminName` varchar(50) DEFAULT NULL,
  `adminpass` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `adminName` (`adminName`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'mohamedgnedy','7f347c114b747e30416de026c96e968c'),(2,'admin','21232f297a57a5a743894a0e4a801fc3');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `easyqs`
--

DROP TABLE IF EXISTS `easyqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `easyqs` (
  `eqid` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(250) NOT NULL,
  `ans1` varchar(250) NOT NULL,
  `ans2` varchar(250) NOT NULL,
  `ans3` varchar(250) NOT NULL,
  `ans4` varchar(250) NOT NULL,
  `ccount` int(11) DEFAULT '0',
  `fcount` int(11) DEFAULT '0',
  `cans` char(1) NOT NULL,
  PRIMARY KEY (`eqid`),
  UNIQUE KEY `question` (`question`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `easyqs`
--

LOCK TABLES `easyqs` WRITE;
/*!40000 ALTER TABLE `easyqs` DISABLE KEYS */;
INSERT INTO `easyqs` VALUES (1,'What command is used to count the total number of lines, words, and characters contained in a file?','countw','wcount','wc','count p',3,6,'c'),(2,'What command is used to remove files?','dm','rm','delete','erase',1,7,'b'),(3,'What command is used to remove the directory?','rdir','remove','rd','rmdir',2,10,'d'),(4,'What command is used with vi editor to delete a single character?','x','y','a','z',3,10,'a'),(5,'What hardware architectures are not supported by Red Hat?','SPARC','IBM-compatible','Alpha','Macintosh',1,10,'d'),(6,'The physical layer of a network','constructs packets of data and sends them across the network','controls error detection and correction','defines the electrical characteristics of signals passed between the computer and communication devices','All of the above',1,3,'c'),(7,'What TCP/IP protocol is used for remote terminal connection service?','UDP','RARP','FTP','TELNET',0,1,'d'),(8,'How many networks and nodes per network, are allowed by the Class B network?','127 networks and 16,777,216 nodes per network','16,384 networks and 65,534 nodes per network','2,097,152 networks and 254 nodes per network','All of the above',1,3,'b'),(9,'What service is used to translate domain names to IP addresses?','NFS','SMB','NIS','DNS',0,1,'d'),(10,'Which of the following command is used to create a Linux installation boot floppy?','mkboot disk','\'bootfp disk','ww and rawwrite','dd and rawrite',0,2,'d'),(11,'How can you add Amit, a new user, to your system?','Using useradd','Using adduser','Using linuxconf','All of the above',0,2,'d'),(12,'What file specifies the order in which to use specified name services?','/etc/services','/etc/nsorder','/etc/nsswitch.conf','/etc/hosts',0,2,'c'),(13,'How many primary partitions can exist on one drive?','16','4','2','1',1,1,'b'),(14,'In which directory can you store system user default files used for creating user directories?','/usr/tmp','/etc/default','/etc/skel','/etc/users',1,2,'c'),(15,'How could you install the file ipchains-1.3.9-5.i386.rpm?','rpm -qip ipchains','rpm -Uvh ipchains','rpm -i ipchains* .i386.rpm','rpm -e ipchains-1.3.9-5.i386.rpm',1,1,'c'),(16,'What does FSF stand for?','Free Software File','File Server First','First Serve First','Free Software Foundation',0,4,'d'),(17,'Which of the following is a valid format for mounting a CD-ROM drive?','mount -t iso9660 /dev/cdrom / mnt/cdrom','mount /dev/cdrom','mount /mnt/cdrom','All of the above',0,1,'d'),(18,'What command do you use to create Linux file systems?','fdisk','mkfs','fsck','mount',1,2,'b'),(19,'Which of the following command can you execute to count the number of lines in a file?','lc','wc - l','cl','\'count',1,3,'b'),(20,'Which of the following is not a communication command?','grep','mail','mesg','write',0,2,'a'),(21,'What command is used to display the characteristics of a process?','au','ps','du','pid',1,1,'b'),(22,'What command is not used to list the files chap01, chap02 and chap04?','ls chap*','ls chap[124]','ls - x chap0[124]','ls chap0[124]',0,1,'b'),(23,'What command is used with vi editor to replace text from cursor to right','S','s','R','r',0,2,'c'),(24,'What sign is used to back up over typing errors in vi?','!','$','#','@',0,1,'c'),(25,'What sign is used to erase or kill an entire line you have typed and start you are on a new line (but not display a new prompt)?','!','$','#','@',0,1,'d'),(26,'What command is used to sort the lines of data in a file in alphabetical order?','sort - r','st','sh','sort',0,2,'d'),(27,'What command is used with vi editor to save file and remain in the editing mode?','x','q!',':W',':q',0,1,'c'),(28,'What command is used with vi editor to move back to the beginning of a word?','w','e','a','b',1,0,'d'),(29,'What command is used with vi editor to search a pattern in the forward direction?','??','//','?','/',0,2,'d'),(30,'What command is used to add printing jobs to the queue?','lpd','lpr','lpq','lpc',0,2,'b'),(31,'What protocol(s) is(are) allowed a user to retrieve her/his mail from the mail server to her/his mail reader?','POP3','FTP','MAP','All of the above',2,3,'a'),(32,'What project is currently developing X server support?','XFree86 Project, Inc.','RHAD Labs','GNOME Project','All of the above',1,2,'a'),(33,'What X-based tool is available for configuring the X Window system?','XConfigurator','XF86Setup','xf86config','All of the above',3,2,'b'),(34,'Which of the following server is used with the BIND package?','httpd','shttp','dns','named',1,2,'d'),(35,'What port does squid listen, by default?','4322','2314','7334','3128',1,2,'d'),(36,'Which of the following is the main Apache configuration file?','/etc/apache.conf','/etc/httpd/config.ini','/etc/httpd/conf/httpd.conf','/etc/srm.conf',0,0,'c'),(37,'Which of the following command is used to access an SMB share on a Linux system?','NFS','\'SMD','smbclient','smbserver',0,2,'c'),(38,'Which of the following command is used to see the services running in NFS server?','rpcinfo','serverinfo','NFSinfo','infserv',0,0,'a'),(39,'In which tcp_wrappers file can you specify to allow all connections from all hosts?','/etc/hosts.allow','/etc/hosts.deny','/etc/hosts','/etc/tcp.conf',0,2,'a'),(40,'What does GNU stand for?','GNU\'s not Unix','Greek Needed Unix','General Unix','General Noble Unix',1,1,'a'),(41,'What shell\'s wild-card is used to match any number of characters including none?','*','?','[!ijk]','[ijk]',2,1,'a'),(42,'What command is used to list contents of directories?','tar','dir','lp','ls',0,2,'d'),(43,'What command is used with vi editor to append text at end of line?','I','i','a','A',0,3,'d'),(44,'What command is used to copy directory structures in and out?','copy','cp - p','cpio','cp',1,0,'c'),(45,'In OSI network architecture, the dialogue control and token management are responsible of','data link layer','transport layer','network layer','session layer',0,2,'d'),(46,'Layer one of the OSI model is','network layer','transport layer','link layer','physical layer',0,2,'d'),(47,'What layer of OSI determines the interface of the system with the user?','Session','Data-link','Application','Network',1,0,'c'),(48,'What command is used to remove jobs from the print queue?','lpq','lpr','lprm','lpc',0,1,'c'),(49,'How can you navigate around virtual consoles?','Alt+Function Key','Ctrl+Function Key','Ctrl+Alt+Del','Alt+a+w+Function Key',0,1,'a'),(50,'Which of the following NIS clients, finds and stores information about an NIS domain and server?','ypwhich','ypbind','ypcat','yppoll',0,0,'b');
/*!40000 ALTER TABLE `easyqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exams`
--

DROP TABLE IF EXISTS `exams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exams` (
  `eid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `grade` varchar(15) NOT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  PRIMARY KEY (`eid`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exams`
--

LOCK TABLES `exams` WRITE;
/*!40000 ALTER TABLE `exams` DISABLE KEYS */;
/*!40000 ALTER TABLE `exams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hardqs`
--

DROP TABLE IF EXISTS `hardqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hardqs` (
  `eqid` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(250) NOT NULL,
  `ans1` varchar(250) NOT NULL,
  `ans2` varchar(250) NOT NULL,
  `ans3` varchar(250) NOT NULL,
  `ans4` varchar(250) NOT NULL,
  `ccount` int(11) DEFAULT '0',
  `fcount` int(11) DEFAULT '0',
  `cans` char(1) NOT NULL,
  PRIMARY KEY (`eqid`),
  UNIQUE KEY `question` (`question`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hardqs`
--

LOCK TABLES `hardqs` WRITE;
/*!40000 ALTER TABLE `hardqs` DISABLE KEYS */;
INSERT INTO `hardqs` VALUES (1,'The dmesg command','Shows user login logoff attempts','Shows the syslog file for info messages','kernel log messages','Shows the daemon log messages',2,6,'c'),(2,'The command “mknod myfifo b 4 16”','Will create a block device if user is root','Will create a block device for all users','Will create a FIFO if user is not root','None of the above',2,12,'a'),(3,'Which command is used to set terminal IO characteristic?','tty','ctty','ptty','stty',6,7,'d'),(4,'Which command is used to record a user login session in a file','macro','read','script','none of the above',1,9,'c'),(5,'Which command is used to display the operating system name','os','Unix','kernel','uname',3,7,'d'),(6,'Which command is used to display the unix version?','uname -r','uname -n','uname -t','kernel',1,1,'a'),(7,'Which command is used to print a file ?','print','ptr','lpr','none of the above',0,2,'c'),(8,'Using which command you find resource limits to the session?','rlimit','ulimit','setrlimit','getrlimit',0,1,'b'),(9,'Which option of ls command used to view file inode number ?','-l','-o','-a','-i',0,0,'d'),(10,'find / -name ‘*’ will ?','List all files and directories recursively starting from /','List a file named * in /','List all files in / directory','List all files and directories in / directory',1,1,'a'),(11,'The major number identifies the _____ associated with the device.','driver','protocol','port','none of the mentioned',1,2,'a'),(12,'The minor number range should be','0 to 15','0 to 63','0 to 255','none of the mentioned',0,2,'c'),(13,'Which one of the following is not true?','dynamic allocation of major numbers is not possible','major number can not be shared among drivers','both (a) and (b)','none of the mentioned',0,2,'c'),(14,'In linux kernel 2.4, we can have','256 character drivers only','256 block drivers only','256 character drivers and 256 block drivers at the same time','none of the mentioned',1,1,'c'),(15,'In we use a driver for N number of files, then we have to create ____ device files.','N','1','N-1','none of the mentioned',0,1,'a'),(16,'If we use a driver for various device files, then','minor number will be different for every device file','minor number will be same for every device file','minor number can not be allocated for any device file','none of the mentioned',0,1,'a'),(17,'The connection between the device file and device driver is based on the','name of device file','number of device file','both (a) and (b)','none of the mentioned',2,4,'b'),(18,'In linux kernel 2.1, the minor numbers were used to','represnt the sub-functionalitites of the driver','identify the driver','represent the device files','none of the mentioned',1,0,'a'),(19,'The kernel identifies the driver with its','module','major number','device file','none of the mentioned',0,0,'b'),(20,'In linux, a device driver can work without the','major number','minor number','device file name','none of the mentioned',0,1,'d'),(21,'On x86-32 Linux, at which address the code segment of the program starts?','0x00000000','0x08048000','0x80000000','0xbfff0000',0,0,'b'),(22,'On x86-32 Linux, at which address the user stack resides normally?','0x00000000','0x3fff0000','0x7fff0000','0xbfff0000',0,2,'d'),(23,'A system has 512MB of physical memory. Which among the following is not a suitable virtual memory size for this system architecture?','512MB','256M','4GB','None of the above',0,2,'d'),(24,'LRU stands for','Last received Unit','Least recently Used','Least recently usable ','Lost Recoverd unit',1,2,'b'),(25,'Mm_struct maintains?','memory files','open files','pipe','active memory regions',1,1,'d'),(26,'Among these files which has an ELF format','shared objects','core','executables','all of the above',1,1,'d'),(27,'If one of the thread in multithreaded process is blocked on an I/O, which of the following is true?','The entire process with block if their is no kernel supported threads','Other threads of the process will continue to execute even if there is no kernel supported threads','It depends on specific implementatation','All of the above',0,1,'a'),(28,'Which one of the following is not true about proc filesystem?','proc filesystem is a pseudo-filesystem','proc filesystem is used as an interface to kernel data structures','some files in proc filesystem allow kernel variables to be changed','none of the mentioned',0,1,'d'),(29,'Proc filesystem provides the information about','processes','processor','\'proxy server','none of the mentioned',0,1,'a'),(30,'The /proc directory contains','numerical sub-directory for each running process','sub-directories for installed buses','a text listing of filesystems which are supported by the kernel','all of the mentioned',0,2,'d'),(31,'The file /proc/[PID]/cgroups','describes control groups to which the process belongs','contains the information about all groups of the system','provides the information about the group which has generated the process','none of the mentioned',0,1,'a'),(32,'The file /proc/[PID]/cmdline holds the complete command line for the process, unless the process is a','child process','zombie process','orphan process','none of the mentioned',1,2,'b'),(33,'What is /proc/[PID]/cwd?','symbolic link to current directory of the process','regular file containing the information about the current status of the process','directory containing various sub-directories','none of the mentioned',0,2,'a'),(34,'Which one of the following file contains the environment for the process?','/proc/[PID]/environ','/proc/[PID]/env','/proc/[PID]/path','none of the mentioned',0,4,'a'),(35,'The entry for each file opened by the process is present in','/proc/[PID]/fd','/proc/[PID]/file','/proc/[PID]/maps','none of the mentioned',1,1,'a'),(36,'The file /proc/[PID]/limits displays the ______ for each of the process’s resource limits.','hard limit','soft limit','units of measurement','all of the mentioned',0,2,'d'),(37,'The file /proc/[PID]/maps contains the','currently mapped memory regions','available memory regions','memory regions which are free to map','none of the mentioned',2,3,'a'),(38,'Sysfs was originally called','device driver filesystem','kernel interface filesystem','kernel filesystem','none of the mentioned',2,2,'a'),(39,'What is sysfs?','it is a virtual filesystem','users use it to get the information about the running kernel','it is used for exporting kernel objects.','all of the mentioned',0,3,'d'),(40,'Sysfs can be considered as the reflection of the','kernel’s device model','user’s device model','network’s device model','none of the mentioned',0,3,'a'),(41,'The files of sysfs contains the information about','devices and drivers','memory mapping','ports','none of the mentioned',0,2,'a'),(42,'Which one of the following is not true?.','any file of the sysfs can not be edited','some files of the sysfs are writable for configuration of devices','both (a) and (b)','none of the mentioned',1,0,'b'),(43,'In linux sysfs is always mounted at','/sys','/proc/sys','/proc/mounts','none of the mentioned',0,1,'a'),(44,'Libsysfs is a','user space library','kernel space library','not a library','none of the mentioned',0,3,'a'),(45,'Sysfs represents the','kernel objects','\'libraries','API','none of the mentioned',0,2,'a'),(46,'Sysfs does not contains','regular files','symbolic links','directories','none of the mentioned',2,0,'d'),(47,' The directories in the /sys directory represents','the device files','major subsystems that are registered with sysfs','details of buses only','none of the mentioned',0,2,'b'),(48,'If a signal is received by a process, when will it be processed?','It is processed immediately','It is processed when process is switching to kernel mode','It is processsed in the next timeslice given to the process','none of the mentioned',0,3,'b'),(49,'Which signal is generated when we press control-C?','SIGINT','SIGTERM','SIGKILL','SIGSEGV',0,0,'a'),(50,'Which signal is generated when we press ctrl-Z?','SIGKILL','SIGSTOP','SIGABRT','SIGINT',0,2,'d');
/*!40000 ALTER TABLE `hardqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mediumqs`
--

DROP TABLE IF EXISTS `mediumqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mediumqs` (
  `eqid` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(250) NOT NULL,
  `ans1` varchar(250) NOT NULL,
  `ans2` varchar(250) NOT NULL,
  `ans3` varchar(250) NOT NULL,
  `ans4` varchar(250) NOT NULL,
  `ccount` int(11) DEFAULT '0',
  `fcount` int(11) DEFAULT '0',
  `cans` char(1) NOT NULL,
  PRIMARY KEY (`eqid`),
  UNIQUE KEY `question` (`question`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mediumqs`
--

LOCK TABLES `mediumqs` WRITE;
/*!40000 ALTER TABLE `mediumqs` DISABLE KEYS */;
INSERT INTO `mediumqs` VALUES (1,'If there are multiple recycle bin for a hard disk','you can setdifferent size for each recycle bin','you can choose which recycle bin to use to store your deleted files','You can make any one of them default recycle bin','None of above',1,12,'a'),(2,'Identify false statement','You can find deleted files in recycle bin','You can restore any files in recycle bin if you ever need','You can increase free spaceof disk by sending files in recycle bin','You can right click and choose Empty Recycle Bin to clean it at once',1,9,'c'),(3,'If the displayed system time and dateis wrong,you can reset it using','Write','Calendar','Write file','Control panel',4,7,'d'),(4,'You should save your computer from?','Viruses','Time bombs','Worms','All of the above',3,9,'d'),(5,'World Wide Web is being standard by ....','Worldwide corporation','W3C','World Wide Consortium','World Wide Web Standard',2,6,'b'),(6,'A co-processor','Is relatively easy to support in software','Causes all processor to function equally','Works with any application','Is quite common in modern computer',0,0,'a'),(7,'A Microsoft Windows is .....a(n)','Operating system','Graphic program','Word Processing','Database program',1,1,'a'),(8,'Which of the following is program group?','Accessories','Paint','Word','All of above',0,3,'a'),(9,'Which is not application software?','Windows NT','Page Maker','WinWord XP','Photoshop',0,2,'a'),(10,'The ..... program compresses large files into a smaller file','WinZip','WinShrink','WinStyle','None of above',0,1,'a'),(11,'Which of the following is an example of a real time operating system?','Lynx','MS DOS','Windows XP','Process Control',1,1,'d'),(12,'Which of the following operating system does not implement the multitasking truly?','Windows 98','Windows NT','Windows XP','MS DOS',0,1,'d'),(13,'Which of the following windows versionsupport64 bit processor?','Windows 98','Windows 2000','Windows XP','Windows 95',1,0,'c'),(14,'Which of the following Operating System does not implement multitasking truly?','Windows 98','Windows NT','Windows XP','MS DOS',0,2,'d'),(15,'What program runs first aftercomputer is booted and loading GUI?','Desktop Manager','File Manager','Windows Explorer','Authentication',0,1,'d'),(16,'Which of the following operating system do you choose to implement a client server network?','MS DOS','Windows','Windows 98','Windows 2000',0,4,'d'),(17,'Which of the following Operating systems is better for implementing a Client-Server network','MS DOS','Windows 95','Windows 98','Windows 2000',0,2,'d'),(18,'My Computer was introduced from','Windows 3.1','Windows 3.11','Windows 95','Windows 98',0,0,'c'),(19,'Which of the following Windows do not have Start button','Windows Vista','Windows 7','Windows 8','None of above',0,3,'c'),(20,'Which is the latest version of MS Windows?','Windows 2007','Windows 8.1','Windows 2008','Windows 7',0,1,'b'),(21,'Which operating system doesn\'t support networking between computers?','Windows 3.1','Windows 95','Windows 2000','Windows NT',0,2,'a'),(22,'Which command is used to display the contents of the text file of DOS?','Copy con','Copy','Type','Dir',0,2,'a'),(23,'Which of the following does not support more than one program at a time?','DOS','Linux','Windows','Unix',2,2,'a'),(24,'Which of the following is not an operating system?','DOS','Linux','Windows','Oracle',1,2,'d'),(25,'Linux isa(n) ... operating system','Open source','Microsoft','Windows','Mac',0,1,'a'),(26,'Which operating system can you give smallest file name?','Ps/2','Dos','Windows','Windows NT',1,0,'b'),(27,'Which one is notoperating system?','P11','OS/2','Windows','Unix',2,3,'a'),(28,'Which of the following is not a multitasking operating system?','Windows','Linux','Win NT','DOS',0,2,'d'),(29,'You should choose Sleep option when','The computer is tired after working for the whole day','You are leaving for a very short time and want to resume you work shortly','Whencomputer gets hanged frequently.Let it sleep for some time','You finish working and going to bed',0,2,'b'),(30,'The .... displays the name of every computer user on the computer','Wish list screen','Command screen','Welcome screen','None of the above',1,1,'c'),(31,'The category of software most appropriate for controlling the design and layout of complex document like newsletters and brochure is:','Word processing','Computer aided design','Web page authoring','Desktop publishing',0,1,'d'),(32,'Which one is not a system tool?','Backup','Disk defragment','Virus scanning','All of the above',0,0,'c'),(33,'The memory which allocates space for DOS and application is called','Expanded memory','Cache memory','Virtual memory','Conventional memory',1,2,'d'),(34,'The operating system creates ... from the physical computer','Virtual space','Virtual computer','Virtual device','None',0,3,'b'),(35,'The operating system creates _____ from the physical computer','Virtual space','Virtual computers','Virtual device','None',1,1,'b'),(36,'Which menu bar selection would you access to openfile?','Option','Help','View','None of above',0,1,'d'),(37,'Which mode loadsminimal set of drivers when starting Windows?','Safe Mode','Normal Mode','VGA Mode','Network Support Mode',2,1,'a'),(38,'Which of the following are loaded in safe mode?','Keyboard driver','Mouse driver','VGA drive','All of above',0,2,'d'),(39,'A .... is a named location on a disk where files are stored','Folder','Pod','Version','None of the above',1,2,'a'),(40,'Which command is used to see the version of operating system?','Vol','Version','Ver','None of the above',0,1,'c'),(41,'Which type of command requires additional files to perform specific operations?','Internal commands','External commands','Valuable commands','Primary commands',0,2,'b'),(42,'Which of the following is system software?','Operating system','Compiler','Utilities','All of the above',0,2,'d'),(43,'A user-interface that is easy to use is considered to be','User-happy','User-simple','User-friendly','None of the above\n',0,2,'c'),(44,'A ....is a flash memory storage device that plugins into a USB port','USB snapdrive','USB flashdrive','USB memory makerdrive','None of above',0,1,'b'),(45,'The ....is the drive containing the files to be copied','Source drive','Destination drive','USB drive','None of the above',1,1,'a'),(46,'The number of character contained in primary name (DOS)?','Up to 8 characters','3 characters','Up to 10 characters','None of the above',0,3,'a'),(47,'Which one of the following is not a multitasking operating system?','DOS','Windows','Unix','Linux',0,3,'a'),(48,'The most recent version of MAC OS is based on the ... operating system','Windows','Linux','Unix','CMOS',2,1,'c'),(49,'The ...operating system was initially created in the early 1970s at AT and T\'s Bell Labs','Linux','DOS','Unix','GNU',0,0,'c'),(50,'Which command is used to undelete a bunch of files withextension .doc that you have just deleted?','Undelete','Undelete/all','Undelete *.doc','All of above',1,3,'c');
/*!40000 ALTER TABLE `mediumqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-01-27 18:56:30

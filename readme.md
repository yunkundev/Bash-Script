# Shell Scripting

## 1, Shell Scripting Basic 

### 1.1, Shebang

**Script.sh:**

```
#!/bin/bash
echo "Scripting is fun!"
```

`#!(Shebang)` tell which interpreter will be used by script. 

1. sh(Bourne Shell): basic Unix shell.

2. bash(Bourne Again Shell): LinuxOS defalt. It include some new future such as command completion, command edit and history.

3. csh: Another Shell Scripting, its' grammmar very similiar with C program.

4. tcsh: A tpye of C shell offered by Linux operation.

5. ksh: A combined of C Shell and Bourne Shell

6. pdksh: A tpye of ksh offered by Linux operation.

### 1.2, sleep shell

**Sleepy.sh:**


```
#!/bin/bash
sleep 90
```
We run this script:

```
./sleepy.sh &
```

The & makes the command run in the background.

Linux: 

* sleep:  sleep for a specified number of second

* ps -fp: select specific processes using the ps command 

If a script does not contain a shebang the commands are executed using your shell

### 1.3, More than just shell script


**hi.py:**

```
#! /usr/bin/python
print "This is a Python script."
```

### 1.4 Vairiables

>Syntax:
>
> VARIABLE_NAME = "Value"

Vairables are case sensitive.

 By converntion variables are **uppercase**.
 
 * Variable Usage:
 
 ```
 #!/bin/bash
 MY_SHELL = "bash"
 echo "I like the $MY_SHELL shell."
 ```
 
 
 ```
 #!/bin/bash
 MY_SHELL = "bash"
 echo "I am ${MY_SHELL}ing on my keyboard."
 ```
 
 * Assign command output to a variable:
 
 ```
 #!/bin/bash
 SERVER_NAME = $(hostname)
 echo "You are running this script on ${SERVER_NAME}."
 ```

### 1.5 Tests

> Syntax:
> 
> [Condition-to-test-for]


**File operators(tests):**

* -d FILE:   True if file is a directory.
* -e FILE:   True if file exists.
* -f FILE:   True if file exists and is a regular file.
* -r FILE:   True if file is readable by you.
* -s FILE:   True if file exists and is not empty.
* -w FILE:   True if the file is writable by you.
* -x FILE:   True if the file is executable by yoou.

**String operators(tests):**

* -z FILE:   				True if string is empty.
* -n FILE:   				True if string is not empty.
* STRING1 = STRING2 	True if the strings are equal
* STRING1 != STRING2 	True if the strings are not equal

**Arithmetic operators(tests)**

* arg1 -eq arg2 		True if arg1 is equal to arg2
* arg1 -ne arg2		True if arg1 is not equal to arg2
* arg1 -lt arg2		True if arg1 is less than arg2
* arg1 -le arg2		True if arg1 is less than or equal to arg2
* arg1 -gt arg2		True if arg1 is greater than arg2
* arg1 -ge arg2		True if arg1 is greater than or equal to arg2

### 1.6 The if statement


>if [condition-is-true]
>
>then ...
>
>elif [condition-is-true]
>
>then ...
>
>else ...
>
>fi


### 1.7 For Loop

> for VARIABLE_NAME int ITEM_1 ... ITEM_N
> 
> do ...
> 
> done

**rename_pics.sh:**

```
#!/bin/bash
PICTURES=$(ls *jpg)
DATE=$(date +%F)

for PICTURE in $PICTURES
do 
	echo "Renaming ${PICTURE} to ${DATE}-${PICTURE}"
	mv ${PICTURE} ${DATE}-${PICTURE}
done
```

**Do not leave space before or behind the equal signal!**


### 1.8 Positional Parameters

> script.sh parameter1 parameter2 parameter3

$0: "script.sh"

$1: "parameter1"

$2: "parameter2"

$3: "parameter3"


**lock_user.sh:**

```
#!/bin/bash
echo "Eexecuting script: $0"
for USER in $@
do 
	echo "Archiving user: $USER"
	#Lock the account
	passwd -l $USER
	#Create an archive of the home directory
	tar cf /archives/${USER}.tar.gz /home/${USER}
done
```

### 1.9 Accepting User Input(STDIN)

>Syntax:
>
>	read -p "PROMPT" VARIABLE


**stdin.sh**

```
read -p "Enter a user name: " USER
echo "Archiveing user: $USER" 
```


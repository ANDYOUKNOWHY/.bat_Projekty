@echo off 
setlocal enabledelayedexpansion 

set /p num_users=Enter the number of users to create: 

for /l %%i in (1,1,%num_users%) do (
 set "name=guest%%i"
 net user !name! >nul 2>&1
 if %errorlevel% equ 0 (
   echo !name! user already exists.
   set /a num=1
   :loop
   set "new_name=!name!_!num!"
   net user !new_name! >nul 2>&1
   if %errorlevel% equ 0 (
     set /a num+=1
     goto :loop
   ) else (
     set "name=!new_name!"
     net user !name! /add
     echo !name! user has been created. 
   )
 ) else (
   net user !name! /add
   echo !name! user has been created. 
) 
)

set /p create_password=Do you want to create a password? (y/n):

if /i "%create_password%"=="y" (

for all accounts to "Aa123456"
 for /l %%i in (1,1,%num_users%) do ( 
set "name=guest%%i" 
net user !name! Aa123456 
echo Password for !name! has been set. 
) ) else (
 echo No password has been set.
 ) 

echo All users have been created. 
pause

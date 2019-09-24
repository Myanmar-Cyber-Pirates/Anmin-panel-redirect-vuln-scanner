#!/bin/bash
echo $(clear)
echo -e "||--------------------------------==[+]==-----------------------------------||"
echo -e "||                                                                          ||"
echo -e "||                      \e[1m\e[32mAdmin Panel Redirect Scanner\e[0m                        ||"
echo -e "||                                                                          ||"
echo -e "||Author : Inv!5!bl3                                                        ||"
echo -e "||Ver : 0.1                                                                 ||"
echo -e "||                                                                          ||"
echo -e "||--------------------------========[+]========-----------------------------||"
echo
echo -e "\e[1m\e[91m[+] Example : www.example.com/admin/ \e[32mor\e[0m \e[1m\e[91mwww.example.com/admin.php\e[0m"
echo 
read -p "Enter your Site: " site
echo 
echo -e "\e[1m\e[91m[+] Example : www.example.com/admin/login.php \e[32mor\e[0m \e[1m\e[91mwww.example.com/login.php\e[0m"
echo ""
read -p "Enter your Site: " site1
echo
res=$(curl -LI "$site" -o /dev/null -w "%{http_code}\n" -s)
	if [[ $res -eq "200" ]]; then 
		curl --silent $site > file.txt
	else
		echo "Somethin Went Wrong"
	fi
res1=$(curl -LI "$site1" -o /dev/null -w "%{http_code}\n" -s)
	if  [[ $res1 -eq "200" ]]; then
		curl --silent $site1 > file1.txt
	else
		echo "Something went Wrong"
	fi
len=$(cat file.txt | wc -c)
len1=$(cat file1.txt | wc -c)
	if [[ $len -eq $len1 ]]; then
		echo -e "[+] $site \e[1m\e[92m[Not Vulnerable]\e[0m"
	else
		echo -e "\e[1m\e[91m[+] $site \e[0m \e[1m\e[92m[Vulnerable]\e[0m"
fi
echo $(rm -rf file.txt file1.txt)
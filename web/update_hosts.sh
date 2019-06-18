#!/bin/bash

sudo touch /www/apidoc/web/0618.log
HOSTNAME="127.0.0.1"    #数据库主机IP
PORT="3306"		#端口号
USERNAME="root"		#用户名
PASSWORD="root"		#密码

DBNAME="xm_api_document"   #数据库名称
TABLENAME="hosts"	#数据库中表的名称

sudo rm -rf /etc/hosts_bak
sudo cp /etc/hosts /etc/hosts_bak

select_sql="select CONCAT_WS(' ',ip,domain,',') as rows from ${TABLENAME}"

result=`mysql ${DBNAME} -e "${select_sql}" | awk 'NR>1'`
arr=$(echo $result|tr -d "\n\t")

sudo cat /dev/null > /etc/hosts

for s in ${arr[@]}
do
    [[ $s =~ "," ]] && echo -e "\n" >> /etc/hosts
    [[ $s =~ "," ]] || echo -n ${s}"  "  >> /etc/hosts
done

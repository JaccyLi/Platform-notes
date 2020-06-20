#!/bin/bash
#
#*******************************************************************************
#Author:			    lisuo
#QQ:				    1049103823
#Data:			        2020-05-27
#FileName:		        gen-random-data.sh
#Personal Blog:		    https://suosuoli.cn
#CSDN Blog:		        https://blog.csdn.net/YouOops
#Description:		    gen-random-data.sh
#Copyright (C):	        2020 Steve,All rights reserved.
#*******************************************************************************

# data-sample:
# 0057332130999991950010103004+51317+028783FM-12+017199999V0203201N00721004501CN0100001N9-01281-01391102681
strBegin="005733213099999"
strMiddle="010103004+51317+028783FM-12+017199999V0203201N00721004501CN0100001N9"
strEnd="1-01391102681"
lines=$1

if [[ $# -ne 1 ]]; then 
    echo "Usage: `basename $0` <lines>"
fi

for i in `seq $lines`; do

    yearGen="$(($RANDOM%50+1950))" # gen
    tempGen="-0$(($RANDOM%40+120))" # gen
    concatenateStr=`echo -e $strBegin$yearGen$strMiddle$tempGen$strEnd`
    echo $concatenateStr >> ./example-data.txt

done


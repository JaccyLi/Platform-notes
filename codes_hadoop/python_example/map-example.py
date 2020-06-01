#!/usr/bin/env python
import re
import sys

ytList=[]
for line in sys.stdin:
    val = line.strip()
    (year, temp, q) = (val[15:19], val[87:92], val[92:93])
    if (temp != "+9999" and re.match("[01459]", q)):
        mid = year + "    " + temp
        ytList.append(mid)
ytList.sort()
#print(ytList)

for item in ytList:
    el = item.strip()
    (y, t) = (el[0:4], el[8:13])
    print("{}\t{}".format(y, t))

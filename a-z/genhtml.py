#!/usr/local/bin/python3

import random

ts = [chr(x) for x in range(ord('A'),ord('Z')+1)]

lnks = {}
f = open('map.txt', 'r')
for line in f.readlines():
	if not line.strip():
		continue
	k, v = line.strip().split(': ')
	lnks[k] = v
f.close()

links = ['<div class="a"><a href="{link}"><img src="{L}.png" alt="{L}"/></a></div>'.format(link=lnks[i], L=i)\
			for i in ts]

f = open('index.html', 'w')
f.write('''
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="keywords" content="software linguistics, software language engineering, book of knowledge, glossary, Russian; иньекция; English; inject"/>
	<title>Alphabet by @grammarware</title>
	<link href="a.css" rel="stylesheet" type="text/css"/>
</head>
<body>
{}
<hr style="clear:both"/>
<div class="b">
	<em>Alphabet created and maintained by <a href="http://grammarware.github.io/">Dr. Vadim Zaytsev</a>.</em>
</div>
</body>
</html>'''.format('\n'.join(links)))
f.close()

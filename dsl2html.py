#!/usr/bin/python

import glob, re, datetime

p = re.compile('<(?P<tag>\w+)>(?P<txt>[^\<]+)</(?P=tag)+>')
d = ('Zeroary','January','February','March','April','May','June','July','August','September','October','November','December')[datetime.date.today().month]+' '+`datetime.date.today().year`
for dsl in glob.glob("*.dsl") + glob.glob("*/*.dsl"):
	picdir = ''
	print 'Processing',dsl
	f = open(dsl,'r')
	lines = f.readlines()
	f.close()
	g = open(dsl.replace('.dsl','.html'),'w')
	i = 0
	while i<len(lines):
		if lines[i].strip().startswith('<picdir'):
			picdir = p.search(lines[i].strip()).groups()[1]+'/'
		elif lines[i].strip().startswith('<pic'):
			classes = re.split('\W+',lines[i])[2:-1]
			if 'nopic' in classes:
				classes.remove('nopic')
			else:
				classes.append('pic')
			c = ' '.join(classes)
			i += 1
			pic = {}
			while lines[i].strip()!='</pic>':
				db = p.search(lines[i].strip()).groups()
				pic[db[0]] = db[1]
				i +=1
			if 'name' not in pic:
				pic['name']=''
			if 'alt' not in pic:
				pic['alt'] = pic['name']
			if 'title' not in pic:
				pic['title'] = pic['name']
			if 'text' in pic:
				pic['text'] = '<span class="p">%s</span>' % pic['text']
			else:
				pic['text'] = ''
			for key in pic:
				pic[key] = pic[key].replace('\\n','<br/>')
			g.write('\t\t<div><a href="%s"><span class="%s"><img src="%s%s" alt="%s" title="%s"/><br/>%s%s</span></a></div>\n'
			 % (pic['a'],c,picdir,pic['img'],pic['alt'],pic['title'],pic['name'],pic['text']))
		elif lines[i].find('#LASTMOD#')>-1:
			g.write(lines[i].replace('#LASTMOD#',d))
		else:
			g.write(lines[i])
		i += 1
	g.close()
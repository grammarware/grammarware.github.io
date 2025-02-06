#!/opt/anaconda3/bin/python
# -*- coding: utf-8 -*-

import glob, re, datetime

def prg2full(x):
	if x == 'CS':
		return f'<abbr title="Computer Science">CS</abbr>'
	if x == 'EE':
		return f'<abbr title="Electrical Engineering">EE</abbr>'
	if x == 'EmSys':
		return f'<abbr title="Embedded Systems">EmSys</abbr>'
	return x

# Header Counter
p = re.compile('<(?P<tag>\w+)>(?P<txt>[^\<]+)</(?P=tag)+>')
d = ('Zeroary', 'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August',\
	'September', 'October', 'November', 'December')[datetime.date.today().month]+\
	' '+str(datetime.date.today().year)
# Main loop
for dsl in glob.glob("*.dsl") + glob.glob("*/*.dsl") + glob.glob("*/*/*.dsl"):
	# Paths are local per file
	cssdir = ''
	imgdir = ''
	# Other counters
	HX = 0
	picdir = divclass = ''
	print('Processing', dsl)
	f = open(dsl, 'r', encoding='utf-8')
	lines = f.readlines()
	f.close()
	g = open(dsl.replace('.dsl', '.html'), 'w', encoding='utf-8')
	# if not lines[0].startswith('<?xml '):
	# 	g.write('<?xml version="1.0" encoding="UTF-8"?>\n')
	i = 0
	paper = False
	resolver = {}
	for i in range(0,len(lines)):
		if lines[i].strip().startswith('<paper'):
			HX += 1
			tmp = lines[i].strip().split('#')
			if len(tmp)>1:
				resolver[tmp[1]] = HX
	# print(resolver,HX)
	HX += 1
	for i in range(0,len(lines)):
		while lines[i].find('[#')>0:
			tmp = lines[i].split('#')[1]
			if tmp not in resolver.keys():
				print('Cannot resolve #'+tmp+'#')
				break
			else:
				# print('Resolved #%s# to %s' % (tmp,HX-resolver[tmp]))
				lines[i] = lines[i].replace('#'+tmp+'#', str(HX-resolver[tmp]))
	# TODO: HX is total!
	HX = i = 0
	while i < len(lines):
		# skip comments
		if lines[i].strip().startswith('<!--'):
			while not lines[i].strip().endswith('-->'):
				i += 1
			i += 1
		# skip empty lines
		if not lines[i].strip():
			i += 1
			# to be on the safe side of the boundary bug
			continue
		if paper:
			if lines[i].strip().startswith('<a>'):
				paperA = lines[i].strip()[3:-4]
				lines[i] = ''
			elif lines[i].strip().startswith('<t>'):
				paperT = lines[i].strip()[3:-4]
				lines[i] = ''
			elif lines[i].strip().startswith('<v>'):
				paperV = lines[i].strip()[3:-4]
				lines[i] = ''
			elif lines[i].strip().startswith('<x>'):
				paperX = lines[i].strip()[3:-4]
				lines[i] = ''
			elif lines[i].strip().startswith('<doi>'):
				paperFull = 'http://dx.doi.org/'+lines[i].strip()[5:-6]
				lines[i] = ''
			elif lines[i].strip().startswith('<read>'):
				paperText.append(lines[i].strip()[6:-7])
				lines[i] = ''
			elif lines[i].strip().startswith('<uri'):
				if lines[i].strip().startswith('<uri>'):
					paperFull = lines[i].strip()[5:-6]
				elif lines[i].strip().startswith('<uri closed'):
					paperFull = lines[i].strip()[13:-6]
				elif lines[i].strip().startswith('<uri open'):
					paperOpen = lines[i].strip()[11:-6]
				else:
					print('What kind of URI is "'+lines[i].strip()+'"?')
				lines[i] = ''
			elif lines[i].strip().startswith('<acm>'):
				if not paperFull:
					paperFull = 'http://dl.acm.org/citation.cfm?id=' + lines[i].strip()[5:-6]
				if not paperBib:
					paperBib = 'http://dl.acm.org/citation.cfm?id=' + lines[i].strip()[5:-6]
				lines[i] = ''
			elif lines[i].strip().startswith('<bib>'):
				paperBib = lines[i].strip()[5:-6]
				lines[i] = ''
			elif lines[i].strip().startswith('<dblp>'):
				s = lines[i].strip()[6:-7]
				if s.startswith('https://dblp.org/rec/bibtex/'):
					s = s.replace('https://dblp.org/rec/bibtex/', '')
				paperBib = 'http://dblp.org/rec/bibtex/' + s
				lines[i] = ''
			elif lines[i].strip().startswith('<sleigh>'):
				paperBib = 'http://bibtex.github.io/'+lines[i].strip()[8:-9]+'.html'
				lines[i] = ''
			elif lines[i].strip().startswith('<arxiv>'):
				paperOpen = 'http://arxiv.org/abs/'+lines[i].strip()[7:-8]
				lines[i] = ''
			elif lines[i].strip().startswith('<gwbib>'):
				paperBib = 'http://grammarware.net/bib/'+lines[i].strip()[7:-8]+'.bib'
				lines[i] = ''
			elif lines[i].strip().startswith('<gwpdf>'):
				paperOpen = 'http://grammarware.net/text/'+lines[i].strip()[7:-8]
				lines[i] = ''
			elif lines[i].strip() != '</paper>' and not lines[i].strip().startswith('<paper'):
				paperText.append(lines[i].strip())
				lines[i] = ''
		# globals
		if lines[i].strip().startswith('<path '):
			pairs = lines[i][5:].split('"')
			for j in range(0,len(pairs)//2):
				if pairs[2*j]==' css=':
					cssdir = pairs[2*j+1]
					if not cssdir.endswith('/'):
						cssdir += '/'
				elif pairs[2*j]==' img=':
					imgdir = pairs[2*j+1]
					if not imgdir.endswith('/'):
						imgdir += '/'
				else:
					print('Unknown path is being set: ' + pairs[2*j][:-1])
			i += 1
			continue
		# unified head
		if lines[i].strip().startswith('<head '):
			if lines[i].strip().find('viewport') < 0:
				vp = ''
			else:
				vp = '''
		<meta name="viewport" content="initial-scale=1.0"/>'''
			if lines[i].strip().find('title="') < 0:
				title = ''
				print('Warning: no title found!')
			else:
				title = lines[i].split('"')[1]
			if cssdir:
				csspath = cssdir
			else:
				csspath = '' if dsl.find('/') < 0 and dsl.find('\\') < 0 else '../'
			if lines[i].strip().find('jquery') < 0:
				end = '</script>'
			else:
				end = '''function onn(n) {$('.help:eq('+n+')').css('color',$('body').css('color'));}
		function off(n) {$('.help:eq('+n+')').css('color',$('body').css('background-color'));}
		</script>
		<script src="../jquery.min.js" type="text/javascript"></script>'''
			g.write('''	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge"/>{}
		<title>{}</title>
		<link href="{}common.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript">
  (function(i,s,o,g,r,a,m){{i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){{
  (i[r].q=i[r].q||[]).push(arguments)}},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  }})(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-3743366-8', 'auto');
  ga('send', 'pageview');

		{}
	</head>
'''.format(vp, title, csspath, end))
			i += 1
		# useful macros
		if lines[i].strip() == '<header/>':
			lines[i] = '<div style="text-align:center;"><a href="http://grammarware.github.io">Vadim Zaytsev</a> aka @<a href="http://grammarware.net">grammarware</a></div><hr/>'
		if lines[i].strip() == '<html doctype>':
			lines[i] = '''<!doctype html><html lang="en">
'''
		if lines[i].strip() == '<valid/>':
			if imgdir == '':
				rootpath = '' if dsl.find('/') < 0 and dsl.find('\\') < 0 else '../'
				logopath = rootpath + 'logos/'
			else:
				logopath = imgdir
			lines[i] = '''<br/><a href="http://validator.w3.org/check/referer"><img src="{0}xhtml.88.png" alt="XHTML 1.1" /></a>
			<a href="http://jigsaw.w3.org/css-validator/check/referer"><img src="{0}css.88.png" alt="CSS 3" /></a>\n'''.format(logopath)
		if lines[i].strip().startswith('<footer'):
			rootpath = '' if dsl.find('/') < 0 and dsl.find('\\') < 0 else '../'
			content = ''
			if lines[i].strip() == '<footer/>':
				content = ''
			else:
				i += 1
				while lines[i].strip() != '</footer>':
					content += lines[i].strip() + ' '
					i += 1
			if imgdir == '':
				valdir = rootpath + 'logos/'
			else:
				valdir = imgdir
			lines[i] = '''<div class="last"><br/><hr/>The page is maintained by <a href="http://grammarware.net/">Dr. Vadim Zaytsev</a> a.k.a. @<a href="http://grammarware.github.io">grammarware</a>. {0}Last updated: #LASTMOD#.<br/>
			<a href="http://validator.w3.org/check/referer"><img src="{1}xhtml.88.png" alt="XHTML 1.1" /></a>
			<a href="http://jigsaw.w3.org/css-validator/check/referer"><img src="{1}css.88.png" alt="CSS 3" /></a></div>'''.format(content, valdir)
		# macros for <pre> of bibtex
		if lines[i].find('isbn      =') > -1:
			parts = lines[i].split('"')
			if len(parts)<2:
				print('WRONG ISBN')
			else:
				parts[1] = '<a href="http://www.isbnsearch.org/isbn/{0}">{1}</a>'.format(\
					parts[1].replace('-','').replace(' ',''),\
					parts[1])
				lines[i] = '"'.join(parts)
		elif lines[i].find('doi       =') > -1:
			parts = lines[i].split('"')
			if len(parts)<2:
				print('WRONG DOI')
			else:
				parts[1] = '<a href="http://doi.org/{0}">{0}</a>'.format(parts[1])
				lines[i] = '"'.join(parts)
		elif lines[i].find('url       =') > -1:
			parts = lines[i].split('"')
			if len(parts)<2:
				print('WRONG URL')
			else:
				parts[1] = '<a href="{0}">{0}</a>'.format(parts[1])
				lines[i] = '"'.join(parts)
		# jQuery use
		if lines[i].strip().startswith('<h2 help'):
			helptext = lines[i].split('"')[1]
			gist = lines[i].split('>')[1].split('<')[0]
			lines[i] = f'<h2 onmouseover="onn({HX})" onmouseout="off({HX})">{gist} <span class="help">({helptext})</span></h2>'
			HX += 1
		elif lines[i].strip() == '<li help>':
			gist = lines[i].split('>')[1]
			lines[i] = f'<li onmouseover="onn({HX})" onmouseout="off({HX})">{gist}'
		elif lines[i].strip().startswith('<help>'):
			helptext = lines[i].split('>')[1].split('<')[0]
			lines[i] = f' <span class="help">({helptext})</span>'
			HX += 1
		# Ordered lists
		if lines[i].strip() == '<ol>':
			lines[i] = lines[i].replace('<ol>', '<ol class="fwd">')
		elif lines[i].strip() == '<ol back>':
			j = i
			lis = 1
			while j < len(lines) and lines[j].strip()!='</ol>':
				j += 1
				if j < len(lines):
					if lines[j].find('<li>') > -1 or lines[j].find('<paper') > -1:
						lis += 1
			lines[i] = '<ol class="back" style="counter-reset: item %s">' % lis
		# paper collections
		if lines[i].strip().startswith('<paper'):
			paper = True
			paperText = []
			paperA = paperFull = paperT = paperV = paperX = paperBib = paperOpen = ''
			lines[i] = ''
		elif lines[i].strip().startswith('<no'):
			paper = True
			paperText = []
			paperA = paperFull = paperT = paperV = paperX = paperBib = paperOpen = ''
			paperT = lines[i].strip()
			paperT = paperT.split('>')[1].split('<')[0]
			if lines[i].find('uri="') > -1:
				paperFull = lines[i].split('"')[1]
			lines[i] = '</paper>' # a trick
		if lines[i].strip() == '</paper>':
			paper = False
			if not paperFull and paperOpen:
				paperFull = paperOpen
			if len(paperText) > 0:
				paperText = '<ul class="dim">' + '\n'.join(paperText) + '</ul>'
			else:
				paperText = ''
			if paperOpen:
				paperOpen = ' <a class="now" href="%s">(open access)</a>' % paperOpen
			if paperX:
				paperX = ' <a class="now" href="%s">(extra)</a>' % paperX
			X = ' <a class="red" href="https://www.google.com/search?q=%%22%s%%22">(search)</a>' % paperT
			if paperFull:
				L = ' href="'+paperFull+'"'
			else:
				L = ''
			if paperA:
				paperA += ", "
			if paperV:
				paperV = ', ' + paperV
			lines[i] = '<li>%s<a%s>%s</a>%s. <a class="now" href="%s">(bibtex)</a>%s%s%s%s</li>' % (paperA, L, paperT, paperV, paperBib, paperOpen, paperX, X, paperText)
		# expansions
		if lines[i].find('<codered>') > -1:
			# <a class="red" href="https://github.com/grammarhoard/2023-witmans-whitespace">(code)</a></li>
			print('<<< '+lines[i])
			lines[i] = lines[i].replace('<codered>', '<a class="red" href="').replace('</codered>', '">(code)</a>')
			print('CODE RED!')
			print('>>> '+lines[i])
		# exclusive expansions
		if lines[i].strip().startswith('<picdir'):
			picdir = p.search(lines[i].strip()).groups()[1]+'/'
		elif lines[i].strip().startswith('<divclass'):
			divclass = p.search(lines[i].strip()).groups()[1]
		elif lines[i].strip().startswith('<pic'):
			classes = re.split('\W+', lines[i])[2:-1]
			if 'nopic' in classes:
				classes.remove('nopic')
			else:
				if 'card' not in classes:
					classes.append('pic')
			c = ' '.join(classes)
			i += 1
			pic = {'src':[]}
			while lines[i].strip() != '</pic>':
				linestripped = lines[i].strip()
				if linestripped.startswith('<text>'):
					pic['text'] = linestripped[6:linestripped.index('</text>')]
				elif linestripped.startswith('<raw>'):
					pic['raw'] = linestripped[5:linestripped.index('</raw>')]
				elif linestripped.startswith('<small>'):
					pic['small'] = linestripped[7:linestripped.index('</small>')]
				elif linestripped.startswith('<pre>'):
					pic['pre'] = linestripped[5:linestripped.index('</pre>')].replace('¶', '\n')
				else:
					srch = p.search(linestripped)
					if not srch:
						print(f'Could not recognise "{linestripped.strip()}"')
						continue
					db = srch.groups()
					if db[0] == 'src':
						pic[db[0]].append(db[1])
					else:
						pic[db[0]] = db[1]
				i += 1
			if 'name' not in pic:
				pic['name'] = ''
			if 'alt' not in pic:
				pic['alt'] = pic['name']
			if 'title' not in pic:
				pic['title'] = pic['name']
			if 'text' in pic:
				pic['text'] = '<span class="p">{}</span>'.format(pic['text'])
			else:
				if 'small' in pic:
					if 'wide' in classes:
						pic['text'] = '<br/><p class="s">{}</p>'.format(pic['small'])
					else:
						pic['text'] = '<br/><span class="s">{}</span>'.format(pic['small'])
				else:
					pic['text'] = ''
			for key in pic:
				if key == 'src':
					continue
				pic[key] = pic[key].replace('\\n', '<br/>')
			if divclass:
				div = '<div class="'+divclass+'">'
			else:
				div = '<div>'
			if 'card' in classes:
				sources = []
				for src in pic['src']:
					if src[1] == ':':
						sources.append('<span class="dwi {}">DwI:{}</span>'.format(src[0], src[2:]))
					elif src.startswith('DSL-'):
						sources.append('<span class="dsl">{}</span>'.format(src[4:]))
					else:
						sources.append('<span class="b {}">{}</span>'.format(src.split('-')[0].lower(), src))
				anchor = pic['title'].replace('&amp;','').replace(' ','_').replace('/','')
				if 'single' in pic.keys():
					g.write('\t\t<div class="card flr">')
				else:
					g.write('\t\t<div class="card">')
				if pic['title'].strip() != '':
					g.write('<h1 id="{1}"><a href="index.html#{1}">{0}</a>'.format(\
						pic['title'],
						anchor))
				if 'extended' in pic.keys():
					g.write(f'<a href="{anchor}.html" class="flr">§</a>')
				if 'img' in pic.keys():
					if '@' in pic['img']:
						big,small = pic['img'].split('@')
					else:
						big = small = pic['img']
					bigwithdir = big
					if not bigwithdir.startswith('https://'):
						bigwithdir = picdir + bigwithdir
					smallwithdir = small
					if not smallwithdir.startswith('https://'):
						smallwithdir = picdir + smallwithdir
					img = f'<a href="{bigwithdir}"><img src="{smallwithdir}" alt="{pic["alt"]}" title="{pic["title"]}"/></a>'
				else:
					img = ''
				g.write('</h1>\n')
				if sources:
					g.write('<h6>{0}</h6>'.format(', '.join(sources)))
				if 'raw' in pic.keys():
					g.write(pic['raw']+'\n')
				g.write(img + pic['text'].replace('<span class="p">','<p>').replace('</span>','</p>'),)
				g.write('</div>\n')
			else:
				if 'a' in pic.keys() and pic['a'].find('/') < 0 and not pic['a'].endswith('.html'):
					pic['a'] += '/index.html'
				if 'img' in pic.keys():
					picwithdir = pic['img']
					if not picwithdir.startswith('https://'):
						picwithdir = picdir + picwithdir

					g.write(('\t\t{}<a href="{}"><span class="{}"><img src="{}" alt="{}" title="{}"/>'+\
						'<br/>{}{}</span></a></div>\n').format(\
						div,\
						pic['a'],\
						c,\
						picwithdir,\
						pic['alt'],\
						pic['title'],\
						pic['name'],\
						pic['text'])\
					)
				else:
					if 'a' in pic.keys():
						g.write('\t\t{}<span class="{}"><a href="{}">{}{}</a>'.format(\
							div,\
							c,\
							pic['a'],\
							pic['name'],\
							pic['text'])\
						)
					else:
						g.write('\t\t{}<span class="{}">{}{}'.format(\
							div,\
							c,\
							pic['name'],\
							pic['text'])\
						)
					if 'pre' in pic.keys():
						g.write('<code>' + pic['pre'].replace(' ', '&nbsp;').replace('\n', '<br/>') + '</code>')
					g.write('</span></div>\n')
		elif lines[i].find('<bsc/>') > -1:
			g.write(lines[i].replace('<bsc/>', '<abbr title="Technical Computer Science">TCS</abbr> <abbr title="Bachelor of Science Research Project">BSc</abbr>'))
		elif lines[i].find('<msc/>') > -1:
			g.write(lines[i].replace('<msc/>', '<abbr title="Computer Science">CS</abbr> <abbr title="Master of Science Final Project">MSc</abbr>'))
		elif lines[i].find('<capita>') > -1:
			tmp = lines[i].split('capita>')
			tmp[1] = prg2full(tmp[1][:-2])[1:] + ' <abbr title="Capita Selecta">CS</abbr>'
			g.write(''.join(tmp))
		elif lines[i].find('<iminor>') > -1:
			tmp = lines[i].split('iminor>')
			tmp[1] = prg2full(tmp[1][:-2])[1:] + ' <abbr title="Individual Minor">IM</abbr>'
			g.write(''.join(tmp))
		elif lines[i].find('#LASTMOD#') > -1:
			g.write(lines[i].replace('#LASTMOD#', d))
		else:
			g.write(lines[i])
		i += 1
	g.close()



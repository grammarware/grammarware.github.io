#!/usr/local/bin/python3

import random

lastchosen = None

# alphabet
ts = [chr(x) for x in range(ord('A'),ord('Z')+1)]

# persistent choice
def perchoice(xs, vs):
	global lastchosen
	lastchosen = random.choice(vs)
	while lastchosen in xs:
		lastchosen = random.choice(vs)
	xs.append(lastchosen)
	return lastchosen

lcols = []
dcols = []
f = open('colours.txt', 'r')
for line in f.readlines():
	if line.startswith('50#') or line.startswith('300#'):
		lcols.append(line.strip().split('#')[-1])
	elif line.startswith('600#') or line.startswith('900#'):
		dcols.append(line.strip().split('#')[-1])
f.close()
cols = lcols + dcols

rs = []
cs = []
r = random.randint(1000,9999)
for L in ts:
	f = open(L+'.svg', 'w')
	r = perchoice(rs, range(20000))
	rs.append(r)
	f.write('''<?xml version="1.0" encoding="UTF-8" standalone="no"?>
	<svg
	   xmlns:dc="http://purl.org/dc/elements/1.1/"
	   xmlns:cc="http://creativecommons.org/ns#"
	   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
	   xmlns:svg="http://www.w3.org/2000/svg"
	   xmlns="http://www.w3.org/2000/svg"
	   version="1.1"
	   width="100"
	   height="100"
	   id="svg2985">
	  <defs
	     id="defs2987" />
	  <metadata
	     id="metadata2991">
	    <rdf:RDF>
	      <cc:Work
	         rdf:about="">
	        <dc:format>image/svg+xml</dc:format>
	        <dc:type
	           rdf:resource="http://purl.org/dc/dcmitype/StillImage" />
	        <dc:title></dc:title>
	      </cc:Work>
	    </rdf:RDF>
	  </metadata>
	  <rect
	     width="105"
	     height="105"
	     rx="0"
	     ry="0"
	     x="-2"
	     y="-2"
	     id="rect3011"
	     style="fill:#{backcolour};fill-opacity:1;stroke:none" />
	  <text
	     x="79.492188"
	     y="78.979492"
	     id="text8648"
	     xml:space="preserve"
	     style="font-size:40px;font-style:normal;font-weight:normal;text-align:center;line-height:125%;letter-spacing:0px;word-spacing:0px;text-anchor:middle;fill:#{textcolour};fill-opacity:1;stroke:none;font-family:Courier Prime"><tspan
	       x="50"
	       y="78.979492"
	       id="tspan8648"
	       style="font-size:100px;text-align:center;text-anchor:middle">{letter}</tspan></text>
	</svg>'''.format(\
		backcolour = perchoice(cs, cols),
		textcolour = '000000' if lastchosen in lcols else 'FFFFFF',
		letter = L
	))
	f.close()
print('Done.')

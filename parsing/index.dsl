<?xml version="1.0" encoding="UTF-8"?>
<path css=".." img="../logos"/>
<html doctype>
	<head jquery viewport title="Dr. Vadim Zaytsev — Parsing in a Broad Sense">
	<body>
		<header/>
		<h1>
			(Un)Parsing in a Broad Sense
			<img src="../logos/parsing.200.png" alt="Parsing in a Broad Sense" title="Parsing in a Broad Sense, logo by Vadim Zaytsev"/>
		</h1>
		<hr/>
		<p>Having multiple representations of the same instance is common in software language engineering: models can be visualised as graphs, edited as text, serialised as XML. When mappings between such representations are considered, many terms are used with incompatible meanings and varying sets of underlying assumptions:</p>
		<ul>
			<li>parsing</li>
			<li>tokenising</li>
			<li>stripping</li>
			<li>concatenating</li>
			<li>imploding</li>
			<li>exploding</li>
			<li>unparsing</li>
			<li>printing</li>
			<li>pretty-printing</li>
			<li>formatting</li>
			<li>visualising</li>
			<li>rendering</li>
			<li>recognising</li>
			<li>…</li>
		</ul>
		<p>This is the (mega)model of 12 classes of artefacts found in software language processing (dotted lines denote mappings that rely on either lexical or syntactic definitions; solid lines denote universally defined mappings. The loops are examples of transformations):</p>
		<div class="bmp">
			<a href="megamodel.1429.png"><img src="megamodel.715.png" alt="Bidirectional megamodel of parsing and unparsing" title="Click to enlarge"/></a>
		</div>
		<p>It can be used to systematically explore the technical research space of bidirectional mappings to build on top of the existing body of work and discover as of yet unused relationships.</p>
		<h2>Artefacts</h2>
		<h1>
			<a href="https://github.com/grammarware/bx-parsing#bx-parsing"><img src="../logos/bx.200.png" alt="BX mega, logo by Vadim Zaytsev" title="Bidirectional megamodel of parsing in a broad sense (a code repository)"/></a>
		</h1>
		<dl>
			<dt>STR</dt>
				<dd>a string, a file, a byte stream</dd>
			<dt>TOK</dt>
				<dd>a finite sequence of strings (called tokens) which, when concatenated, yields STR; includes spaces, line breaks, comments, etc — collectively, layout</dd>
			<dt>TTK</dt>
				<dd>a finite sequence of typed tokens, possibly with layout removed, some classified as numbers, strings, etc</dd>
			<dt>LEX</dt>
				<dd>a lexical source model that addes grouping to typing; in fact a possibly incomplete tree connecting most tokens together in one structure</dd>
			<dt>FOR</dt>
				<dd>a forest of parse trees, a parse graph or an ambiguous parse tree with sharing; a tree-like structure that models STR according to a syntactic definition</dd>
			<dt>PTR</dt>
				<dd>an unambiguous parse tree where the leaves can be concatenated to form STR</dd>
			<dt>CST</dt>
			<dd>a parse tree with concrete syntax information; structurally similar to PTR, but abstracted from layout and other minor details; comments could still be a part of the CST model, depending on the use case</dd>
			<dt>AST</dt>
			<dd>a tree which contains only abstract syntax information</dd>
			<dt>PIC</dt>
			<dd>a picture, which can be an ad hoc model, a “natural model” or a rendering of a formal model</dd>
			<dt>DRA</dt>
			<dd>a graphical representation of a model (not necessarily a tree), a drawing in the sense of GraphML or SVG, or a metamodel-indepenent syntax but metametamodel-specific syntax like OMG HUTN</dd>
			<dt>DIA</dt>
			<dd>a diagram, a graphical model in the sense of EMF or UML, a model with an explicit advanced metamodel</dd>
		</dl>
		<h2>Publications / presentations</h2>
		<ul>
			<li help>
				Vadim Zaytsev, Anya Helene Bagge.
				<a href="http://grammarware.net/writes/#Parsing2014">Parsing in a Broad Sense</a>,
				<a href="http://models2014.webs.upv.es/">MoDELS’14</a>, LNCS 8767, 2014.
				<a class="red" href="http://grammarware.net/talks/index.html#MoDELS2014">(slides)</a>
				<help>the MAIN paper on this topic</help>
			</li>
			<li help>
				Vadim Zaytsev.
				<a href="https://github.com/grammarware/bx-parsing#bx-parsing"><code>grammarware/bx-parsing</code></a>, GitHub, March 2014.
				<help>if you like to see some code (in Rascal)</help>
			</li>
			<li help>
				Paul Klint, Ralf Lämmel, Chris Verhoef.
				<em><a href="http://www.cs.vu.nl/grammarware/agenda/">Toward an Engineering Discipline for Grammarware</a></em>, ACM ToSEM, 2005.
				<help>introduces the term “grammars in a broad sense”</help>
			</li>
			<li help>
				Vadim Zaytsev.
				<em><a href="http://grammarware.net/writes/#Bidirectionalisation2014">Case Studies in Bidirectionalisation</a></em>, <a href="http://www.cs.uu.nl/wiki/TFP2014/">TFP</a>, 2014. Extended abstract.
				<a class="red" href="http://grammarware.net/talks/index.html#TFP2014">(slides)</a>
				<help>a more FP/BX targeted piece</help>
			</li>
			<li help>
				Vadim Zaytsev, Anya Helene Bagge.
				<em><a href="http://grammarware.net/writes/#Modelling-Parsing2014">Modelling Parsing and Unparsing</a></em>, <a href="http://www.sleconf.org/2014/Parsing-at-SLE.html">Parsing@SLE</a>, 2014.
				<a class="red" href="http://www.sleconf.org/2014/parsing-slides/4-zaytsev-bagge.pdf">(slides)</a>
				<help>a more technical piece targeted for parsing researchers</help>
			</li>
			<li help>
				Anya Helene Bagge, Ralf Lämmel, Vadim Zaytsev.
				<em><a href="http://grammarware.net/writes/#SLE-Courses2014">Reflections on Courses for Software Language Engineering</a></em>, <a href="http://models2014.webs.upv.es/educatorsym.htm">EduSymp</a>, 2014.
				<a class="red" href="http://softlang.uni-koblenz.de/edusymp14/talk.pdf">(slides)</a>
				<help>contains the megamodel, presents how it was used in teaching</help>
			</li>
			<li help>
				Vadim Zaytsev.
				<em><a href="http://grammarware.net/writes/#Renarration2014">Understanding Metalanguage Integration by Renarrating a Technical Space Megamodel</a></em>, <a href="http://gemoc.org/gemoc2014/">GEMOC’14</a>, 2014.
				<a class="red" href="http://grammarware.net/talks/index.html#GEMOC2014">(slides)</a>
				<help>argues how megamodels are useful in teaching, uses this megamodel as an example</help>
			</li>
			<li help>
				Anya Helene Bagge, Vadim Zaytsev.
				<em><a href="http://grammarware.net/writes/#Tutorial2015">Languages, Models and Megamodels: A Tutorial</a></em>, <a href="http://sattose.org/2014">SATToSE</a>, 2014.
				<a class="red" href="http://grammarware.github.io/sattose/slides/Bagge.pdf">(slides)</a>
				<help>uses the megamodel as one of the examples</help>
			</li>
		</ul>
		<footer/>
	</body>
</html>

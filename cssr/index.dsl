<?xml version="1.0" encoding="UTF-8"?>
<html doctype>
	<head jquery title="Dr. Vadim Zaytsev — Master of Science programme in Software Engineering" />
	<body>
		<header/>
			<a href="http://cssr.nsu.ru/"><img src="cssr.png" alt="Computer Science Summer in Russia" title="Computer Science Summer in Russia (unofficial logo)" style="max-width:300px;float:right"/></a>
		<h1>
			<em>Modern Construction of Industrial Strength Compilers</em>
			<br/>
			at <a href="http://cssr.nsu.ru/">Computer Science Summer in Russia</a>
		</h1>
		<hr/>
		<p>

			Compiler construction is one of the oldest and the most mature
			fields of computer science. Despite existing since the 1950s, it
			has been continuously evolving, advancing and changing. Old
			classic study books are no longer enough to sufficiently prepare
			students and practitioners to face the research world nor the
			industrial reality. These lectures are a short course meant to
			strengthen the classic compiler construction / software evolution
			courses given at Bachelor and Master levels, by highlighting
			problems encountered in the field of compilation of fourth
			generation and domain-specific languages, legacy modernisation,
			software reverse engineering and re-engineering, and revisiting
			the standard points of interest from the modern standpoint. The
			lectures will be given based on previous personal experience in
			research at several leading European institutions, teaching MSc
			students and working in the industry at the biggest independent
			compiler company in the world.

		</p>
		<p>

			There will be examples from modern toolkits and recent academic
			articles, as well as example stories taken from real industrial
			projects in language development, support and migration. <a
			href="https://www.raincodelabs.com/">Our company</a>, designs
			develops and sells compilers and code analysers for many
			languages, ranging from legacy behemoths like COBOL or PL/I to
			customer-specific domain-focused little languages.
		
		</p>

		<h2 help="subject to expansion">Sources</h2>
		<ol>
			<li help>
				Vadim Zaytsev.
				<a href="http://grammarware.net/writes/#Coverage2017">
					Open Challenges in Incremental Coverage of Legacy Software Languages
				</a>,
				PX/17.2, 2017.
				<a class="red" href="http://grammarware.net/text/2017/coverage.pdf">(PDF)</a>
				<help>fourth generation languages and their problems</help>
			</li>
			<li help>
				Vadim Zaytsev, editor.
				<a href="http://slebok.github.io">
					Software Languages Engineering Body of Knowledge
				</a>,
				2019.
				<help>software language engineering</help>
			</li>
			<li help>
				Vadim Zaytsev.
				<a href="http://grammarware.net/writes/#Design2017">
					Language Design with Intent
				</a>,
				MoDELS, 2017.
				<a class="red" href="http://grammarware.net/text/2017/design.pdf">(PDF)</a>
				<help>intentional language design</help>
			</li>
			<li help>
				Vadim Zaytsev.
				<a href="http://grammarware.net/writes/#Design2017">
					Formal Foundations for Semi-parsing
				</a>,
				CSMR-WCRE, 2014.
				<a class="red" href="http://grammarware.net/text/2014/semiparsing.pdf">(PDF)</a>
				<help>semi-parsing algorithms: islands, lakes, etc</help>
			</li>
			<li help>
				Vadim Zaytsev.
				<a href="http://grammarware.net/writes/#Pattern2017">
					Parser Generation by Example for Legacy Pattern Languages
				</a>,
				GPCE, 2017.
				<a class="red" href="http://grammarware.net/text/2017/pattern.pdf">(PDF)</a>
				<help>parsing exotic legacy languages</help>
			</li>
			<li help>
				Vadim Zaytsev, Anya Helene Bagge.
				<a href="http://grammarware.net/writes/#Parsing2014">
					Parsing in a Broad Sense
				</a>,
				MoDELS, 2014.
				<a class="red" href="http://grammarware.net/text/2014/parsing.pdf">(PDF)</a>
				<help>parsing in a broad sense</help>
			</li>
			<li help>
				Ralf Lämmel, Vadim Zaytsev.
				<a href="http://grammarware.net/writes/#JLS-SQJ2011">
					Recovering Grammar Relationships for the Java Language Specification
				</a>,
				SQJ, 2014.
				<a class="red" href="http://grammarware.net/text/2011/jls-sqj.pdf">(PDF)</a>
				<help>grammar extraction</help>
			</li>
			<li help>
				Vadim Zaytsev.
				<a href="http://grammarware.net/writes/#NPGR2012">
					Notation-Parametric Grammar Recovery
				</a>,
				LDTA, 2012.
				<a class="red" href="http://grammarware.net/text/2012/npgr.pdf">(PDF)</a>
				<help>grammar recovery</help>
			</li>
			<li help>
				Mats Stijlaart, Vadim Zaytsev.
				<a href="http://grammarware.net/writes/#Grammar-Smells2017">
					Towards a Taxonomy of Grammar Smells
				</a>,
				SLE, 2017.
				<a class="red" href="http://grammarware.net/text/2017/grammar-smells.pdf">(PDF)</a>
				<help>grammar smells</help>
			</li>
			<li help>
				Ralf Lämmel, Vadim Zaytsev.
				<a href="http://grammarware.net/writes/#Convergence2009">
					An Introduction to Grammar Convergence
				</a>,
				IFM, 2009.
				<a class="red" href="http://grammarware.net/text/2009/convergence.pdf">(PDF)</a>
				<help>grammar convergence</help>
			</li>
			<li help>
				Vadim Zaytsev.
				<a href="http://grammarware.net/writes/#SPPF2016">
					Cotransforming Grammars with Shared Packed Parse Forests
				</a>,
				EC-EASST, 2016.
				<a class="red" href="http://grammarware.net/text/2016/sppf.pdf">(PDF)</a>
				<help>bidirectional and coupled transformations</help>
			</li>
			<li help>
				Vadim Zaytsev.
				<a href="http://grammarware.net/writes/#Compilepretation2017">
					On the Need of Compilepretation for Legacy Languages
				</a>,
				MoreVMs, 2017.
				<a class="red" href="http://grammarware.net/text/2017/compilepretation.pdf">(PDF)</a>
				<a class="red" href="http://www.youtube.com/watch?v=ZqRX-M_KClY">(YouTube)</a>
				<help>between interpretation and compilation</help>
			</li>
			<li help>
				Vadim Zaytsev.
				<a href="http://grammarware.net/writes/#Testing2018">
					An Industrial Case Study in Compiler Testing
				</a>,
				SLE, 2018.
				<a class="red" href="http://grammarware.net/text/2018/testing.pdf">(PDF)</a>
				<help>compiler testing</help>
			</li>
			<li help>
				Vadim Zaytsev, Ralf Lämmel.
				<a href="http://grammarware.net/writes/#LDF2011">
					A Unified Format for Language Documents
				</a>,
				SLE, 2010.
				<a class="red" href="http://grammarware.net/text/2011/ldf.pdf">(PDF)</a>
				<help>language documentation</help>
			</li>
			<li help>
				Juriaan Kennedy van Dam, Vadim Zaytsev.
				<a href="http://grammarware.net/writes/#Identification2016">
					Software Language Identification with Natural Language Classifiers
				</a>,
				SANER, 2016.
				<a class="red" href="http://grammarware.net/text/2016/identification.pdf">(PDF)</a>
				<help>machine learning in compiler construction</help>
			</li>
			<li help>
				Anya Helene Bagge, Vadim Zaytsev.
				<a href="http://grammarware.net/writes/#OOPSLE2015">
					Open and Original Problems in Software Language Engineering 2015 Workshop Report
				</a>,
				SIGSOFT SE Notes, 2015.
				<a class="red" href="http://grammarware.net/text/2015/oopsle.pdf">(PDF)</a>
				<help>open problems of the future</help>
			</li>
		</ol>
		<footer/>
	</body>
</html>

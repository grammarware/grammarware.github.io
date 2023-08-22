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
		<hr/>
		<h2>Lecture 1: Introduction to Modern Compiler Construction (<a href="slides1.pdf" class="red">Slides</a>)</h2>

		<h3>Topic 1.1: Self-introduction</h3>

		<ul>
			<li>
				Personal
				<ol>
					<li>
						Vadim Zaytsev.
						<a href="http://grammarware.net/shares/cv.pdf">Curriculum Vitae</a>,
						June 2019.
					</li>
				</ol>
			</li>
			<li>
				Second generation languages (2GLs)
				<ul>
					<li>
						HLASM
						<ol>
							<li>
								Raincode.
								<a href="https://www.raincode.com/technical-landscape/asm370/">The Raincode ASM370 compiler for .NET and .NET Core</a>,
								2019.
							</li>
							<li>
								Vadim Zaytsev.
								<a href="http://grammarware.net/writes/#Compilepretation2017">On the Need of Compilepretation for Legacy Languages</a>,
								MoreVMs 2017.
								<a class="red" href="http://grammarware.net/text/2017/compilepretation.pdf">(PDF)</a>
								<a class="red" href="http://www.youtube.com/watch?v=ZqRX-M_KClY">(YouTube)</a>
							</li>
							<li>
								Volodymyr Blagodarov, Ynes Jaradin, Vadim Zaytsev.
								<a href="http://grammarware.net/writes/#HLASM-Demo2016">Tool Demo: Raincode Assembler Compiler</a>,
								SLE 2016.
								<a class="red" href="http://grammarware.net/text/2016/hlasm.pdf">(PDF)</a>
							</li>
						</ol>
					</li>
				</ul>
			</li>
			<li>
				Third generation languages (3GLs)
				<ul>
					<li>
						COBOL
						<ol>
							<li>
								Raincode.
								<a href="https://www.raincode.com/technical-landscape/cobol/">The Raincode COBOL compiler for .NET and .NET Core</a>,
								2019.
							</li>
							<li>
								Raincode.
								<a href="http://www.raincode.com">mBank: Core Banking System Moved to Flexible Server-based Platforms</a>,
								2019.
							</li>
							<li>
								Raincode.
								<a href="http://www.raincode.com">CSSA (Czech Social Security Administration): Digital Transformation in the Public Sector</a>,
								2019.
							</li>
							<li>
								Raincode.
								<a href="http://www.raincode.com">Volvo: Scaling a Mainframe Application in Azure</a>,
								2019.
							</li>
						</ol>
					</li>
					<li>
						PL/I
						<ol>
							<li>
								Raincode.
								<a href="https://www.raincode.com/technical-landscape/pli/">The Raincode PL/I compiler for .NET and .NET Core</a>,
								2019.
							</li>
							<li>
								Raincode.
								<a href="http://www.raincode.com">SDC (Skandinavisk Data Center): The Biggest Mainframe to .NET Migration in the World</a>,
								2019.
							</li>
							<li>
								Raincode.
								<a href="http://www.raincode.com">Pulsen: A Retail Application in PL/I Rejuvenated on .NET</a>,
								2019.
							</li>
							<li>
								Raincode.
								<a href="http://www.raincode.com">Topdanmark: Improving Customer Experience with Field-deployed Mainframe Applications</a>,
								2019.
							</li>
						</ol>
					</li>
				</ul>
			</li>
			<li>
				Fourth generation languages (4GLs)
				<ol>
					<li>
						Vadim Zaytsev.
						<a href="http://grammarware.net/writes/#Mainframe-Ecosystem2019">Ecosystem Health as a Reason for Migration: The Mainframe Case</a>,
						SoHeal 2019.
						<a class="red" href="http://grammarware.net/text/2019/mainframe-ecosystem.pdf">(PDF)</a>
						<a class="red" href="https://youtu.be/aImiWsJVBTs">(YouTube)</a>
					</li>
					<li>
						Vadim Zaytsev, Johan Fabry.
						<a href="http://grammarware.net/writes/#4GL-TechDebt2019">Fourth Generation Languages are Technical Debt</a>,
						TechDebt 2019.
						<a class="red" href="http://grammarware.net/text/2019/4gl-techdebt.pdf">(PDF)</a>
					</li>
					<li>
						Vadim Zaytsev.
						<a href="http://grammarware.net/writes/#Coverage2017">Open Challenges in Incremental Coverage of Legacy Software Languages</a>,
						PX/17.2, 2017.
						<a class="red" href="http://grammarware.net/text/2017/coverage.pdf">(PDF)</a>
					</li>

				</ol>
				<ul>
					<li>
						AppBuilder
						<ol>
							<li>
								Raincode.
								<a href="https://www.raincode.com/technical-landscape/tialaa/">TIALAA: There is a Life After AppBuilder</a>,
								2019.
								<a class="red" href="https://www.raincode.com/technical-landscape/tialaa/">(YouTube)</a>
							</li>
							<li>
								Vadim Zaytsev.
								<a href="http://grammarware.net/writes/#Testing2018">An Industrial Case Study in Compiler Testing</a>,
								SLE 2018.
								<a class="red" href="http://grammarware.net/text/2018/testing.pdf">(PDF)</a>
							</li>
							<li>
								Vadim Zaytsev.
								<a href="http://grammarware.net/writes/#Pattern2017">Parser Generation by Example for Legacy Pattern Languages</a>,
								GPCE 2017.
								<a class="red" href="http://grammarware.net/text/2017/pattern.pdf">(PDF)</a>
							</li>
						</ol>
					</li>
					<li>
						IDEAL
						<ol>
							<li>
								Raincode Labs.
								<a href="https://www.raincodelabs.com/datakom/">DataKom: The Migration Solution</a>,
								2019.
							</li>
						</ol>
					</li>
					<li>
						PACBASE
						<ol>
							<li>
								Raincode Labs.
								<a href="https://www.raincodelabs.com/pacbase/">PACBASE Migration: More than 200 million lines of code migrated</a>,
								2019.
							</li>
						</ol>
					</li>
					<li>
						<span class="censored">XXXXXXXX</span> (a 4GL for a MultiValue database system)
						<ol>
							<li>
								Leszek Włodarski, Boris Pereira, Ivan Povazan, Johan Fabry, Vadim Zaytsev.
								<a href="http://grammarware.net/writes/#Migration2019">Quality First! A Large Scale Modernisation Report</a>,
								SANER 2019.
							</li>
						</ol>
					</li>
				</ul>
			</li>
		</ul>
		<h3>Topic 1.2: The Chomsky hierarchy</h3>
		<p>Wikipedia's table of <a href="https://en.wikipedia.org/wiki/Template:Formal_languages_and_grammars">formal languages and grammars</a> (CC-BY-SA):</p>
		<table class="realtable">
			<tbody>
				<tr><th scope="col" colspan="4">
					<a href="https://en.wikipedia.org/wiki/Automata_theory" title="Automata theory">Automata theory</a>:
					<a href="https://en.wikipedia.org/wiki/Formal_language" title="Formal language">formal languages</a> and <a href="https://en.wikipedia.org/wiki/Formal_grammar" title="Formal grammar">formal grammars</a>
				</th></tr>
				<tr>
					<td style="font-weight:bold;"><a href="https://en.wikipedia.org/wiki/Chomsky_hierarchy" title="Chomsky hierarchy">Chomsky hierarchy</a></td>
					<td><a href="https://en.wikipedia.org/wiki/Formal_grammar" title="Formal grammar">Grammars</a></td>
					<td><a href="https://en.wikipedia.org/wiki/Formal_language" title="Formal language">Languages</a></td>
					<td><a href="https://en.wikipedia.org/wiki/Abstract_machine" title="Abstract machine">Abstract machines</a></td>
				</tr>
				<tr style="vertical-align:top;">
					<td>
						<ul><li>Type-0</li>
						<li>—</li>
						<li>Type-1</li>
						<li>—</li>
						<li>—</li>
						<li>—</li>
						<li>—</li>
						<li>—</li>
						<li>Type-2</li>
						<li>—</li>
						<li>—</li>
						<li>Type-3</li>
						<li>—</li>
						<li>—</li></ul>
					</td>
					<td>
						<ul><li><a href="https://en.wikipedia.org/wiki/Unrestricted_grammar" title="Unrestricted grammar">Unrestricted</a></li>
						<li>(no common name)</li>
						<li><a href="https://en.wikipedia.org/wiki/Context-sensitive_grammar" title="Context-sensitive grammar">Context-sensitive</a></li>
						<li><span>Positive <a href="https://en.wikipedia.org/wiki/Range_concatenation_grammars" title="Range concatenation grammars">range concatenation</a></span></li>
						<li><a href="https://en.wikipedia.org/wiki/Indexed_grammar" title="Indexed grammar">Indexed</a></li>
						<li>—</li>
						<li><a href="https://en.wikipedia.org/wiki/Linear_context-free_rewriting_system" class="mw-redirect" title="Linear context-free rewriting system">Linear context-free rewriting systems</a></li>
						<li><a href="https://en.wikipedia.org/wiki/Tree-adjoining_grammar" title="Tree-adjoining grammar">Tree-adjoining</a></li>
						<li><a href="https://en.wikipedia.org/wiki/Context-free_grammar" title="Context-free grammar">Context-free</a></li>
						<li><a href="https://en.wikipedia.org/wiki/Deterministic_context-free_grammar" title="Deterministic context-free grammar">Deterministic context-free</a></li>
						<li><a href="https://en.wikipedia.org/wiki/Nested_word" title="Nested word">Visibly pushdown</a></li>
						<li><a href="https://en.wikipedia.org/wiki/Regular_grammar" title="Regular grammar">Regular</a></li>
						<li>—</li>
						<li><a href="https://en.wikipedia.org/wiki/Non-recursive_grammar" class="mw-redirect" title="Non-recursive grammar">Non-recursive</a></li></ul>
					</td>
					<td>
						<ul><li><a href="https://en.wikipedia.org/wiki/Recursively_enumerable_language">Recursively enumerable</a></li>
						<li><a href="https://en.wikipedia.org/wiki/Recursive_language" title="Recursive language">Decidable</a></li>
						<li><a href="https://en.wikipedia.org/wiki/Context-sensitive_language" title="Context-sensitive language">Context-sensitive</a></li>
						<li><span>Positive <a href="https://en.wikipedia.org/wiki/Range_concatenation_language" class="mw-redirect" title="Range concatenation language">range concatenation</a></span></li>
						<li><a href="https://en.wikipedia.org/wiki/Indexed_language" title="Indexed language">Indexed</a></li>
						<li>—</li>
						<li><a href="https://en.wikipedia.org/wiki/Linear_context-free_rewriting_language" class="mw-redirect" title="Linear context-free rewriting language">Linear context-free rewriting language</a></li>
						<li><a href="https://en.wikipedia.org/wiki/Tree-adjoining_grammar" title="Tree-adjoining grammar">Tree-adjoining</a></li>
						<li><a href="https://en.wikipedia.org/wiki/Context-free_language" title="Context-free language">Context-free</a></li>
						<li><a href="https://en.wikipedia.org/wiki/Deterministic_context-free_language" title="Deterministic context-free language">Deterministic context-free</a></li>
						<li><a href="https://en.wikipedia.org/wiki/Nested_word" title="Nested word">Visibly pushdown</a></li>
						<li><a href="https://en.wikipedia.org/wiki/Regular_language" title="Regular language">Regular</a></li>
						<li><a href="https://en.wikipedia.org/wiki/Star-free_language" title="Star-free language">Star-free</a></li>
						<li><a href="https://en.wikipedia.org/wiki/Finite_language" class="mw-redirect" title="Finite language">Finite</a></li></ul>
					</td>
					<td>
						<ul><li><a href="https://en.wikipedia.org/wiki/Turing_machine" title="Turing machine">Turing machine</a></li>
						<li><a href="https://en.wikipedia.org/wiki/Machine_that_always_halts" title="Machine that always halts">Decider</a></li>
						<li><a href="https://en.wikipedia.org/wiki/Linear_bounded_automaton" title="Linear bounded automaton">Linear-bounded</a></li>
						<li><a href="https://en.wikipedia.org/wiki/PTIME" class="mw-redirect" title="PTIME">PTIME</a> Turing Machine</li>
						<li><a href="https://en.wikipedia.org/wiki/Nested_stack_automaton" title="Nested stack automaton">Nested stack</a></li>
						<li><a href="https://en.wikipedia.org/wiki/Thread_automaton" title="Thread automaton">Thread automaton</a></li>
						<li>restricted <a href="https://en.wikipedia.org/wiki/Tree_stack_automaton" title="Tree stack automaton">Tree stack automaton</a></li>
						<li><a href="https://en.wikipedia.org/wiki/Embedded_pushdown_automaton" title="Embedded pushdown automaton">Embedded pushdown</a></li>
						<li><a href="https://en.wikipedia.org/wiki/Pushdown_automaton" title="Pushdown automaton">Nondeterministic pushdown</a></li>
						<li><a href="https://en.wikipedia.org/wiki/Deterministic_pushdown_automaton" title="Deterministic pushdown automaton">Deterministic pushdown</a></li>
						<li><a href="https://en.wikipedia.org/wiki/Nested_word" title="Nested word">Visibly pushdown</a></li>
						<li><a href="https://en.wikipedia.org/wiki/Finite-state_machine" title="Finite-state machine">Finite</a></li>
						<li><a href="https://en.wikipedia.org/wiki/Aperiodic_finite_state_automaton" title="Aperiodic finite state automaton">Counter-free (with aperiodic finite monoid)</a></li>
						<li><a href="https://en.wikipedia.org/wiki/Deterministic_acyclic_finite_state_automaton" title="Deterministic acyclic finite state automaton">Acyclic finite</a></li></ul>
					</td>
				</tr>
			</tbody>
		</table>
		<h3>Topic 1.3: Grammarware</h3>
		<ol>
			<li>
				Ralf Lämmel.
				<a href="http://www.softlang.org/book">Software Languages: Syntax, Semantics, and Metaprogramming</a>,
				Springer, 2018.
			</li>
			<li>
				Vadim Zaytsev, editor.
				<a href="http://slebok.github.io">Software Languages Engineering Body of Knowledge</a>,
				2019.
			</li>
			<li>
				Paul Klint, Ralf Lämmel, Chris Verhoef.
				<a href="http://www.cs.vu.nl/grammarware/agenda/">Toward an Engineering Discipline for Grammarware</a>,
				ACM ToSEM, 2005.
			</li>
			<li>
				Martin Fowler.
				<a href="https://martinfowler.com/bliki/LanguageWorkbench.html">Language Workbench</a>,
				2008.
			</li>
			<li>
				Мартин Фаулер.
				<a href="http://www.maxkir.com/sd/languageWorkbenches.html">Языковой инструментарий: новая жизнь языков предметной области</a>,
				2005.
			</li>
			<li>
				Vadim Zaytsev.
				<a href="http://slebok.github.io/zoo/">Grammar Zoo</a>,
				2015.
			</li>
			<li>
				Vadim Zaytsev.
				<a href="http://grammarware.net/writes/#Zoo2015">Grammar Zoo: A Corpus of Experimental Grammarware</a>,
				SCP 98, 2015.
				<a class="red" href="http://grammarware.net/text/2015/zoo.pdf">(PDF)</a>
			</li>
		</ol>
		<h3>Topic 1.4: Parsing in a broad sense</h3>
		<ol>
			<li>
				Vadim Zaytsev.
				<a href="../parsing/">Parsing in a Broad Sense</a>,
				webpage, 2015.
			</li>
			<li>
				Vadim Zaytsev, Anya Helene Bagge, <em><a href="http://grammarware.net/writes/#Parsing2014">Parsing in a Broad Sense</a></em>, <a href="http://models2014.webs.upv.es/">MoDELS’14</a>, LNCS 8767, 2014.
				(<a class="red" href="http://grammarware.net/talks/index.html#MoDELS2014">slides</a>)
			</li>
			<li>
				Vadim Zaytsev, <em><a href="http://grammarware.net/writes/#Bidirectionalisation2014">Case Studies in Bidirectionalisation</a></em>, <a href="http://www.cs.uu.nl/wiki/TFP2014/">TFP</a>, 2014. Extended abstract.
				(<a class="red" href="http://grammarware.net/talks/index.html#TFP2014">slides</a>)
			</li>
			<li>
				Vadim Zaytsev, Anya Helene Bagge, <em><a href="http://grammarware.net/writes/#Modelling-Parsing2014">Modelling Parsing and Unparsing</a></em>, <a href="http://www.sleconf.org/2014/Parsing-at-SLE.html">Parsing@SLE</a>, 2014.
				(<a class="red" href="http://www.sleconf.org/2014/parsing-slides/4-zaytsev-bagge.pdf">slides</a>)
			</li>
			<li>
				Anya Helene Bagge, Ralf Lämmel, Vadim Zaytsev, <em><a href="http://grammarware.net/writes/#SLE-Courses2014">Reflections on Courses for Software Language Engineering</a></em>, <a href="http://models2014.webs.upv.es/educatorsym.htm">EduSymp</a>, 2014.
				(<a class="red" href="http://softlang.uni-koblenz.de/edusymp14/talk.pdf">slides</a>)
			</li>
			<li>
				Vadim Zaytsev, <em><a href="http://grammarware.net/writes/#Renarration2014">Understanding Metalanguage Integration by Renarrating a Technical Space Megamodel</a></em>, <a href="http://gemoc.org/gemoc2014/">GEMOC’14</a>, 2014.
				(<a class="red" href="http://grammarware.net/talks/index.html#GEMOC2014">slides</a>)
			</li>
			<li>
				Anya Helene Bagge, Vadim Zaytsev, <em><a href="http://grammarware.net/writes/#Tutorial2015">Languages, Models and Megamodels: A Tutorial</a></em>, <a href="http://sattose.org/2014">SATToSE</a>, 2014.
				<a href="http://grammarware.net/text/2015/tutorial.pdf" class="red">(PDF)</a>
				<a class="red" href="http://grammarware.github.io/sattose/slides/Bagge.pdf">(Slides)</a>
			</li>
		</ol>
		<hr/>
		<h2>Lecture 2: Deep Dive into Compiler Construction (<a href="slides2.pdf" class="red">Slides</a>)</h2>
		<hr/>
		<h2>Lecture 3: Burning Topics in Compiler Construction (<a href="slides3.pdf" class="red">Slides</a>)</h2>

		<h3>Topic 1.5: Design with intent</h3>
		<ol>
			<li>
				Vadim Zaytsev.
				<a href="http://grammarware.net/writes/#Design2017">Language Design with Intent</a>,
				MoDELS, 2017.
				<a class="red" href="http://grammarware.net/text/2017/design.pdf">(PDF)</a>
			</li>
			<li>
				Vadim Zaytsev.
				<a href="http://slebok.github.io/dyol/">DYOL: Design Your Own Language</a>: A software language design toolkit,
				2017.
				<a class="red" href="http://slebok.github.io/dyol/cards/index.html">(cards)</a>
			</li>
			<li>
				Dan Lockton.
				<a href="http://designwithintent.co.uk/">Design with Intent</a>,
				2015.
			</li>
		</ol>

		<hr/>

		<h2 help="subject to expansion">Other sources</h2>
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

<?xml version="1.0" encoding="UTF-8"?>
<html doctype>
	<head jquery title="Dr. Vadim Zaytsev — Cascading Style Sheets" />
	<body>
		<header/>
		<h1>
			<a href="https://www.w3.org/Style/CSS/Overview.en.html">CSS: Cascading Style Sheets</a>
			<a href="https://www.w3.org/html/logo/">
			<img src="../logos/css.300.png" alt="CSS" title="This unofficial CSS logo was designed by Vadim Zaytsev to visually rhyme with the official HTML5 logo"/></a>
		</h1>
		<hr/>
		<p>Cascading Style Sheets, or CSS for short, is the language that makes the web as colourful and fun as we are used to. It is present in some form on pretty much every webpage and is essential to each company’s recognisability. However, there is very little research made on CSS compared to other less widespread software languages like Java. On this page, I collect references to all the papers published at international peer-reviewed academic conferences and journals, that make CSS main focus of their investigation.</p>
		<h2>Methodology</h2>
		<ul>
			<li><a href="http://dblp.uni-trier.de/search/publ?q=css%24%20-venue%3Acss">DBLP: search/publ?q=css$ -venue:css</a></li>
			<li><a href="http://dblp.uni-trier.de/search/publ?q=cascading%20style">DBLP: search/publ?q=cascading style</a></li>
			<li><a href="http://bibtex.github.io/tag/css.html">BibSLEIGH: tag/css</a></li>
			<li><a href="http://dl.acm.org/results.cfm?query=keywords%2Eauthor%2Ekeyword%3A%28css%29&amp;filtered=&amp;within=owners%2Eowner%3DHOSTED&amp;dte=&amp;bfr=&amp;srt=publicationDate">ACM DL: keywords.author.keyword(CSS)</a></li>
			<li>+ publications at other lower profile venues if they are referenced</li>
			<li>– books, theses, reviews, blog posts, anything non-peer-reviewed</li>
		</ul>
		<h2 help="by publication date">Papers</h2>
		<ol back>
			<!-- 2016 -->
			<paper>
				<a>Pavel Panchekha, Emina Torlak</a>
				<t>Automated Reasoning for Web Page Layout</t>
				<v>OOPSLA 2016</v>
				<doi>10.1145/2983990.2984010</doi>
				<x>http://2016.splashcon.org/event/splash-2016-oopsla-automated-reasoning-for-web-page-layout</x>
				This paper presents the first mechanised formalisation of the CSS semantics.
			</paper>
			<paper>
				<a>Scott Buckley, Anthony M. Sloane, Matthew Roberts</a>
				<t>Specifying CSS Layout with Reference Attribute Grammars</t>
				<v>SPLASH 2016 Poster</v>
				<doi>10.1145/2984043.2989216</doi>
				<dblp>conf/oopsla/BuckleySR16</dblp>
			</paper>
			<paper>
				<a>Scott Buckley</a>
				<t>Using Scala’s Pattern Matching Features for an Attribute Grammar Formalisation of the CSS Layout Specification</t>
				<v>Scala 2016</v>
				<uri>http://conf.researchr.org/event/scala-2016/scala-2016-using-scala-s-pattern-matching-features-for-an-attribute-grammar-formalisation-of-the-css-layout-specification</uri>
			</paper>
			<paper #DoCoCo#>
				<a>Boryana Goncharenko, Vadim Zaytsev</a>
				<t>Language Design and Implementation for the Domain of Coding Conventions</t>
				<v>SLE 2016</v>
				<doi>10.1145/2997364.2997386</doi>
				<gwbib>CoCo2016</gwbib>
				<gwpdf>2016/coco.pdf</gwpdf>
				<x>https://dx.doi.org/10.6084/m9.figshare.3085831.v3</x>
			</paper>
			<paper>
				<a>Davood Mazinanian, Nikolaos Tsantalis</a>
				<t>Migrating Cascading Style Sheets to Preprocessors by Introducing Mixins</t>
				<v>ASE 2016</v>
				<doi>10.1145/2970276.2970348</doi>
				<dblp>conf/kbse/MazinanianT16</dblp>
			</paper>
			<paper>
				<a>Leonard Punt, Sjoerd Visscher, Vadim Zaytsev</a>
				<t>Experimental Data for the A?B*A Pattern in CSS: Inputs and Outputs</t>
				<v>ICSME 2016 Artefact</v>
				<doi>10.1109/ICSME.2016.91</doi>
				<gwbib>ABA-Data2016</gwbib>
				<gwpdf>2016/aba-data.pdf</gwpdf>
				<x>http://leonardpunt.github.io/masterproject/dataset-and-results.zip</x>
				A dataset artefact accompanying [#ABA#], made by fixing and extending the <a href="http://dmazinanian.me/publications/FSE'14/FSE'14-crawled.7z">dataset from [#DRO#]</a>. Won the Best Artefact Award.
			</paper>
			<paper>
				<a>Leonard Punt, Sjoerd Visscher, Vadim Zaytsev</a>
				<t>A Tool for Detecting and Refactoring the A?B*A Pattern in CSS</t>
				<v>ICSME 2016 Artefact</v>
				<doi>10.1109/ICSME.2016.90</doi>
				<gwbib>ABA-Tool2016</gwbib>
				<gwpdf>2016/aba-tool.pdf</gwpdf>
				<x>http://leonardpunt.github.io/masterproject/tool.zip</x>
				An executable artefact accompanying [#ABA#]
			</paper>
			<paper #ABA#>
				<a>Leonard Punt, Sjoerd Visscher, Vadim Zaytsev</a>
				<t>The A?B*A Pattern: Undoing Style in CSS and Refactoring Opportunities it Presents</t>
				<v>ICSME 2016</v>
				<doi>10.1109/ICSME.2016.73</doi>
				<gwbib>ABA2016</gwbib>
				<gwpdf>2016/aba-css.pdf</gwpdf>
			</paper>
			<paper>
				<a>Gorjan Jovanovski, Vadim Zaytsev</a>
				<t>Critical CSS Rules — Decreasing Time to First Render by Inlining CSS Rules for Over-the-Fold Elements</t>
				<v>SATToSE 2016</v>
				<uri open=>http://sattose.org/2016:alltalks#paper13</uri>
				<gwbib>Critical2016</gwbib>
				A work-in-progress report on splitting CSS files into a part that has to be loaded up front in order to display the webpage properly, and the remainder with rules about off-screen elements, which can be loaded later dynamically.
			</paper>
			<paper>
				<a>Nico de Groot</a>
				<t>Analysing CSS using the M3 Model</t>
				<v>SATToSE 2016</v>
				<uri open=>http://sattose.org/2016:alltalks#paper10</uri>
				A work-in-progress report. The author took a software analytics library of <a href="http://rascal-mpl.org/">Rascal</a> that was used to analyse Java code but claimed to be language-agnostic. The project was to validate that claim by applying the same library (slightly adjusted) to a software language as far from Java as humanly possible. Hence the choice of CSS.
			</paper>
			<paper>
				<a>Davood Mazinanian, Nikolaos Tsantalis</a>
				<t>An Empirical Study on the Use of CSS Preprocessors</t>
				<v>SANER 2016</v>
				<doi>10.1109/SANER.2016.18</doi>
				<dblp>conf/wcre/MazinanianT16</dblp>
			</paper>
			<paper>
				<a>P. S. Lokhande, B. B. Meshram</a>
				<t>Analytic Hierarchy Process (AHP) to Find Most Probable Web Attack on an E-Commerce Site</t>
				<v>ICTCS 2016</v>
				<doi>10.1145/2905055.2905120</doi>
				<acm>2905120</acm>
			</paper>
			<!-- 2015 -->
			<paper>
				<a>Kei Kanaoka, Motomichi Toyama</a>
				<t>Browser GUI for Generating Web Data Extraction Rules in Ducky</t>
				<v>iiWAS 2015</v>
				<doi>10.1145/2837185.2837262</doi>
				<dblp>conf/iiwas/KanaokaT15</dblp>
				Ducky, a data extraction framework proposed in this paper, uses CSS selectors instead of XPath to address elements within web pages.
			</paper>
			<paper>
				<a>Thomas H. Park, Brian Dorn, Andrea Forte</a>
				<t>An Analysis of HTML and CSS Syntax Errors in a Web Development Course</t>
				<v>TOCE 15(1), 2015</v>
				<doi>10.1145/2700514</doi>
				<dblp>journals/jeric/ParkDF15</dblp>
			</paper>
			<paper>
				<a>Matthew Hague, Anthony Widjaja Lin, C.-H. Luke Ong</a>
				<t>Detecting Redundant CSS Rules in HTML5 Applications: A Tree Rewriting Approach</t>
				<v>OOPSLA 2015</v>
				<doi>10.1145/2814270.2814288</doi>
				<arxiv>1412.5143</arxiv>
				<sleigh>OOPSLA-2015-HagueLO</sleigh>
			</paper>
			<paper>
				<a>Boryana Goncharenko</a>
				<t>Detecting Violations of CSS Code Conventions</t>
				<v>SATToSE 2015</v>
				<uri open=>http://sattose.wdfiles.com/local--files/2015%3Atalks/proceedings.pdf</uri>
				A very early work-in-progress report on the project that would later yield [#DoCoCo#] — for reading mature material the newer version is highly recommended.
			</paper>
			<paper>
				<a>Naoki Takei, Takamichi Saito, Ko Takasu, Tomotaka Yamada</a>
				<t>Web Browser Fingerprinting Using Only Cascading Style Sheets</t>
				<v>BWCCA 2015</v>
				<doi>10.1109/BWCCA.2015.105</doi>
				<dblp>conf/bwcca/TakeiSTY15</dblp>
			</paper>
			<paper>
				<a>Jan Sutter, Kristian Sons, Philipp Slusallek</a>
				<t>A CSS Integration Model for Declarative 3D</t>
				<v>Web3D 2015</v>
				<doi>10.1145/2775292.2775295</doi>
				<dblp>conf/vrml/SutterSS15</dblp>
			</paper>
			<!-- 2014 -->
			<paper>
				<a>Martí Bosch, Pierre Genevès, Nabil Layaïda</a>
				<t>Automated Refactoring for Size Reduction of CSS Style Sheets</t>
				<v>DocEng 2014</v>
				<doi>10.1145/2644866.2644885</doi>
				<sleigh>DocEng-2014-BoschGL</sleigh>
			</paper>
			<paper>
				<a>Alejandro Montes García, Paul De Bra, George H. L. Fletcher, Mykola Pechenizkiy</a>
				<t>A DSL Based on CSS for Hypertext Adaptation</t>
				<v>HT 2014</v>
				<doi>10.1145/2631775.2631782</doi>
				<sleigh>HT-2014-Montes-GarciaBFP</sleigh>
			</paper>
			<paper>
				<a>Yung-Chen Chou, Hsin-Chi Liao</a>
				<t>A Webpage Data Hiding Method by Using Tag and CSS Attribute Setting</t>
				<v>IIH-MSP 2014</v>
				<doi>10.1109/IIH-MSP.2014.37</doi>
				<dblp>conf/iih-msp/ChouL14</dblp>
			</paper>
			<paper #DRO#>
				<a>Davood Mazinanian, Nikolaos Tsantalis, Ali Mesbah</a>
				<t>Discovering Refactoring Opportunities in Cascading Style Sheets</t>
				<v>FSE 2014</v>
				<doi>10.1145/2635868.2635879</doi>
				<uri open=>https://users.encs.concordia.ca/~nikolaos/publications/FSE_2014.pdf</uri>
				<sleigh>FSE-2014-MazinanianTM</sleigh>
				<x>http://dmazinanian.me/conference-papers/fse/2014/06/16/fse14.html</x>
			</paper>
			<!-- 2013 -->
			<paper>
				<a>Robert Kotcher, Yutong Pei, Pranjal Jumde, Collin Jackson</a>
				<t>Cross-origin Pixel Stealing: Timing Attacks using CSS Filters</t>
				<v>CCS 2013</v>
				<doi>10.1145/2508859.2516712</doi>
				<dblp>conf/ccs/KotcherPJJ13</dblp>
			</paper>
			<paper>
				<a>Thomas H. Park, Ankur Saxena, Swathi Jagannath, Susan Wiedenbeck, Andrea Forte</a>
				<t>Towards a Taxonomy of Errors in HTML and CSS</t>
				<v>ICER 2013</v>
				<doi>10.1145/2493394.2493405</doi>
				<dblp>conf/icer/ParkSJWF13</dblp>
			</paper>
			<paper>
				<a>Da-Chun Wu, Hsiu-Yang Su</a>
				<t>Information Hiding in EPUB Files by Rearranging the Contents of CSS Files</t>
				<v>IIH-MSP 2013</v>
				<doi>10.1109/IIH-MSP.2013.29</doi>
				<dblp>conf/iih-msp/WuS13</dblp>
			</paper>
			<paper>
				<a>Hsiang-Sheng Liang, Kuan-Hung Kuo, Po-Wei Lee, Yu-Chien Chan, Yu-Chin Lin, Mike Y. Chen</a>
				<t>SeeSS: Seeing What I Broke — Visualizing Change Impact of Cascading Style Sheets (CSS)</t>
				<v>UIST 2013</v>
				<doi>10.1145/2501988.2502006</doi>
				<dblp>conf/uist/LiangKLCLC13</dblp>
			</paper>
			<paper>
				<a>Hafez Rouzati, Luis Cruiz, Blair MacIntyre</a>
				<t>Unified WebGL/CSS Scene-Graph and Application to AR</t>
				<v>Web3D 2013</v>
				<doi>10.1145/2466533.2466568</doi>
				<dblp>conf/vrml/RouzatiCM13</dblp>
			</paper>
			<paper>
				<a>Richard Duchatsch Johansen, Talita Cristina Pagani Britto, Cesar Augusto Cusin</a>
				<t>CSS Browser Selector Plus: A Javascript Library to Support Cross-browser Responsive Design</t>
				<v>WWW 2013 Dev Track</v>
				<uri>http://dl.acm.org/citation.cfm?id=2487797</uri>
				<dblp>conf/www/JohansenBC13</dblp>
			</paper>
			<!-- 2012 -->
			<paper>
				<a>Karl Gyllstrom, Carsten Eickhoff, Arjen P. de Vries, Marie-Francine Moens</a>
				<t>The Downside of Markup: Examining the Harmful Effects of CSS and Javascript on Indexing Today’s Web</t>
				<v>CIKM 2012</v>
				<doi>10.1145/2396761.2398558</doi>
				<sleigh>CIKM-2012-GyllstromEVM</sleigh>
			</paper>
			<paper>
				<a>César F. Acebal, Bert Bos, María Rodríguez, Juan Manuel Cueva Lovelle</a>
				<t>ALMcss: A Javascript Implementation of the CSS Template Layout Module</t>
				<v>DocEng 2012</v>
				<doi>10.1145/2361354.2361360</doi>
				<sleigh>DocEng-2012-AcebalBRL</sleigh>
			</paper>
			<paper>
				<a>Jesia Zakraoui, Wolfgang L. Zagler</a>
				<t>A Method for Generating CSS to Improve Web Accessibility for Old Users</t>
				<v>ICCHP 2012</v>
				<doi>10.1007/978-3-642-31522-0_50</doi>
				<dblp>conf/icchp/ZakraouiZ12</dblp>
			</paper>
			<paper>
				<a>Ali Mesbah, Shabnam Mirshokraie</a>
				<t>Automated Analysis of CSS Rules to Support Style Maintenance</t>
				<v>ICSE 2012</v>
				<doi>10.1109/ICSE.2012.6227174</doi>
				<sleigh>ICSE-2012-MesbahM</sleigh>
			</paper>
			<paper>
				<a>Adrian Sampson, Calin Cascaval, Luis Ceze, Pablo Montesinos, Darío Suárez Gracia</a>
				<t>Automatic Discovery of Performance and Energy Pitfalls in HTML and CSS</t>
				<v>IISWC 2012</v>
				<doi>10.1109/IISWC.2012.6402904</doi>
				<dblp>conf/iiswc/SampsonCCMG12</dblp>
			</paper>
			<paper>
				<a>Adewole Adewumi, Sanjay Misra, Nicholas Ikhu-Omoregbe</a>
				<t>Complexity Metrics for Cascading Style Sheets</t>
				<v>ICCSA 2012</v>
				<doi>10.1007/978-3-642-31128-4_18</doi>
				<dblp>10.1007/978-3-642-31128-4_18</dblp>
			</paper>
			<paper>
				<a>Pierre Genevès, Nabil Layaïda, Vincent Quint</a>
				<t>On the Analysis of Cascading Style Sheets</t>
				<v>WWW 2012</v>
				<doi>10.1145/2187836.2187946</doi>
				<dblp>conf/www/GenevesLQ12</dblp>
			</paper>
			<!--
				Herman Kabetta, Yudi Dwiandiyanta, Suyoto:
				Information Hiding in CSS : A Secure Scheme Text-Steganography using Public Key Cryptosystem. CoRR abs/1201.1968 (2012)
			-->
			<!-- 2011 -->
			<paper>
				<a>Fabien Cazenave, Vincent Quint, Cécile Roisin</a>
				<t>Timesheets.js: When SMIL Meets HTML5 and CSS3</t>
				<v>DocEng 2011</v>
				<doi>10.1145/2034691.2034700</doi>
				<sleigh>DocEng-2011-CazenaveQR</sleigh>
			</paper>
			<!-- 2010 -->
			<paper>
				<a>Colin Stewart</a>
				<t>Course Restructuring in "CMPT 165 – Introduction to Multimedia and the Internet"</t>
				<v>WCCCE 2010</v>
				<doi>10.1145/1806512.1806518</doi>
				<acm>1806518</acm>
			</paper>
			<paper>
				<a>Kaimin Zhang, Lu Wang, Aimin Pan, Bin Benjamin Zhu</a>
				<t>Smart Caching for Web Browsers</t>
				<v>WWW 2010</v>
				<doi>10.1145/1772690.1772741</doi>
				<dblp>conf/www/ZhangWPZ10</dblp>
			</paper>
			<paper>
				<a>John J. Barton, Jan Odvarko</a>
				<t>Dynamic and Graphical Web Page Breakpoints</t>
				<v>WWW 2010</v>
				<doi>10.1145/1772690.1772700</doi>
				<dblp>conf/www/BartonO10</dblp>
			</paper>
			<paper>
				<a>Leo A. Meyerovich, Rastislav Bodik</a>
				<t>Fast and Parallel Webpage Layout</t>
				<v>WWW 2010</v>
				<doi>10.1145/1772690.1772763</doi>
				<dblp>conf/www/MeyerovichB10</dblp>
			</paper>
			<paper>
				<a>Joel Hollingsworth, David J. Powell</a>
				<t>Teaching Web Programming using the Google Cloud</t>
				<v>ACM SE 2010</v>
				<doi>10.1145/1900008.1900110</doi>
				<dblp>conf/ACMse/HollingsworthP10</dblp>
			</paper>
			<paper>
				<a>Manuel Serrano</a>
				<t>HSS: A Compiler for Cascading Style Sheets</t>
				<v>PPDP 2010</v>
				<doi>10.1145/1836089.1836103</doi>
				<sleigh>PPDP-2010-Serrano</sleigh>
			</paper>
			<paper>
				<a>Marco Balduzzi, Manuel Egele, Engin Kirda, Davide Balzarotti, Christopher Kruegel</a>
				<t>A solution for the Automated Detection of Clickjacking Attacks</t>
				<v>ASIACCS 2010</v>
				<doi>10.1145/1755688.1755706</doi>
				<dblp>conf/ccs/BalduzziEKBK10</dblp>
			</paper>
			<paper>
				<a>Lin-Shung Huang, Zack Weinberg, Chris Evans, Collin Jackson</a>
				<t>Protecting Browsers from Cross-origin CSS attacks</t>
				<v>CCS 2010</v>
				<doi>10.1145/1866307.1866376</doi>
				<dblp>conf/ccs/HuangWEJ10</dblp>
			</paper>
			<paper>
				<a>Matthias Keller, Martin Nussbaumer</a>
				<t>CSS Code Quality: A Metric for Abstractness; Or Why Humans Beat Machines in CSS Coding</t>
				<v>QUATIC 2010</v>
				<doi>10.1109/QUATIC.2010.25</doi>
				<dblp>conf/quatic/KellerN10</dblp>
			</paper>
			<!-- 2009 -->
			<paper>
				<a>Randy W. Connolly</a>
				<t>No Longer Partying like it's 1999: Designing a Modern Web Stream using the IT2008 Curriculum Guidelines</t>
				<v>SIGITE 2009</v>
				<doi>10.1145/1631728.1631752</doi>
				<dblp>conf/sigite/Connolly09</dblp>
			</paper>
			<paper #XQueryWWW#>
				<a>Ghislain Fourny, Markus Pilman, Daniela Florescu, Donald Kossmann, Tim Kraska, Darin McBeath</a>
				<t>XQuery in the Browser</t>
				<v>WWW 2009</v>
				<doi>10.1145/1526709.1526845</doi>
				<dblp>conf/www/FournyPFKKM09</dblp>
			</paper>
			<paper>
				<a>Matthias Keller, Martin Nussbaumer</a>
				<t>Cascading Style Sheets: A Novel Approach Towards Productive Styling With Today’s Standards</t>
				<v>WWW 2009</v>
				<doi>10.1145/1526709.1526907</doi>
				<dblp>conf/www/KellerN09</dblp>
			</paper>
			<paper>
				<a>Amaia Aizpurua, Myriam Arrue, Markel Vigo, Julio Abascal</a>
				<t>Exploring Automatic CSS Accessibility Evaluation</t>
				<v>ICWE 2009</v>
				<doi>10.1007/978-3-642-02818-2_2</doi>
				<uri open=>https://www.researchgate.net/profile/Markel_Vigo/publication/220940174_Exploring_Automatic_CSS_Accessibility_Evaluation/links/0deec526041446ea73000000.pdf</uri>
				<dblp>conf/icwe/AizpuruaAVA09</dblp>
				Extending existing accessibility evaluation procedures to CSS while keeping them fully automatic. The authors list 6 different kinds of smells (called “test cases” by accessibility researchers) and specify them in a guidelines specification language called UGL. Several coding conventions are discussed, and their harmfulness explained in detail.
			</paper>
			<paper>
				<a>Miško Hevery, Adam Abrons</a>
				<t>Declarative Web-Applications without Server: Demonstration of How a Fully Functional Web-Application can be Built in an Hour with only HTML, CSS &amp; &lt;angular/&gt; JavaScript Library</t>
				<v>OOPSLA 2009 Demo</v>
				<doi>10.1145/1639950.1640022</doi>
				<dblp>conf/oopsla/HeveryA09</dblp>
				A salespitch for what now is called <a href="https://angularjs.org/">AngularJS</a>; nothing about CSS whatsoever.
			</paper>
			<!-- 2008 -->
			<paper>
				<a>Ghislain Fourny, Donald Kossmann, Tim Kraska, Markus Pilman, Daniela Florescu</a>
				<t>XQuery in the Browser</t>
				<v>SIGMOD Conference 2008</v>
				<doi>10.1145/1376616.1376769</doi>
				<dblp>conf/sigmod/FournyKKPF08</dblp>
				Early version of [#XQueryWWW#]?
			</paper>
			<paper>
				<a>Marty Stepp, Jessica Miller, Victoria Kirst</a>
				<t>A "CS 1.5" Introduction to Web Programming</t>
				<v>ACM SIGCSE Bulletin 41(1), 2008</v>
				<doi>10.1145/1539024.1508908</doi>
				Archived version of [#CS15WP#]?
			</paper>
			<paper #CS15WP#>
				<a>Marty Stepp, Jessica Miller, Victoria Kirst</a>
				<t>A "CS 1.5" Introduction to Web Programming</t>
				<v>SIGCSE 2008</v>
				<doi>10.1145/1508865.1508908</doi>
				<dblp>conf/sigcse/SteppMK09</dblp>
			</paper>
			<paper>
				<a>Evan Schrier, Mira Dontcheva, Charles Jacobs, Geraldine Wade, David Salesin</a>
				<t>Adaptive Layout for Dynamically Aggregated Documents</t>
				<v>IUI 2008</v>
				<doi>10.1145/1378773.1378787</doi>
				<dblp>conf/iui/SchrierDJWS08</dblp>
			</paper>
			<!-- 2007 -->
			<paper>
				<a>John Wells, Chrisina Draganova</a>
				<t>Progressive Enhancement in the Real World</t>
				<v>HT 2007</v>
				<doi>10.1145/1286240.1286259</doi>
				<sleigh>HT-2007-WellsD</sleigh>
			</paper>
			<paper>
				<a>Vincent Quint, Irène Vatton</a>
				<t>Editing with Style</t>
				<v>DocEng 2007</v>
				<doi>10.1145/1284420.1284460</doi>
				<sleigh>DocEng-2007-QuintV</sleigh>
			</paper>
			<paper>
				<a>Kehinde Alabi</a>
				<t>Generation, Documentation and Presentation of Mathematical Equations and Symbolic Scientific Expressions using Pure HTML and CSS</t>
				<v>WWW 2007</v>
				<doi>10.1145/1242572.1242830</doi>
				<uri open=>http://www2007.org/posters/poster1015.pdf</uri>
				<dblp>conf/www/Alabi07</dblp>
				This two-page paper accompanying a poster, explains how the authors made a tool to display mathematical formulae in pure HTML and CSS, claiming it to be more portable than the alternatives such as MathML. The author uses table layout which in the meantime has been totally outlawed by web designers and developers, and GIFs instead of Unicode characters. The only use for CSS in this project seems to be to make cell borders invisible.
			</paper>
			<!-- 2006 -->
			<paper>
				<a>Ryan Levering, Michal Cutler</a>
				<t>The Portrait of a Common HTML Web Page</t>
				<v>DocEng 2006</v>
				<doi>10.1145/1166160.1166213</doi>
				<sleigh>DocEng-2006-LeveringC</sleigh>
			</paper>
			<paper>
				<a>Rohit Khare, Tantek Çelik</a>
				<t>Microformats: A Pragmatic Path to the Semantic Web</t>
				<v>WWW 2006</v>
				<doi>10.1145/1135777.1135917</doi>
				<dblp>conf/www/KhareC06</dblp>
			</paper>
			<paper>
				<a>Brian J. Rosmaita</a>
				<t>Accessibility First! A New Approach to Web Design</t>
				<v>ACM SIGCSE Bulletin 38(1), 2006</v>
				<doi>10.1145/1124706.1121426</doi>
				Archival version of [#XS1st#]?
			</paper>
			<paper #XS1st#>
				<a>Brian J. Rosmaita</a>
				<t>Accessibility First! A New Approach to Web Design</t>
				<v>SIGCSE 2006</v>
				<doi>10.1145/1121341.1121426</doi>
				<dblp>conf/sigcse/Rosmaita06</dblp>
			</paper>
			<paper>
				<a>Matt Germonprez, Michel Avital</a>
				<t>The Impacts of the Cascading Style Sheet Standard on Mobile Computing</t>
				<v>JITSR 4(2), 2006</v>
				<doi>10.4018/jitsr.2006070104</doi>
				<uri open=>https://pdfs.semanticscholar.org/1b74/a951734e43f304d616cf612a93489026d0e4.pdf</uri>
				<dblp>journals/jitsr/GermonprezA06</dblp>
				A highly abstract paper about how CSS and the way it is defined, impacts the future of mobile computing.
			</paper>
			<paper>
				<a>Simon Harper, Sean Bechhofer, Darren Lunn</a>
				<t>SADIe: Transcoding based on CSS</t>
				<v>ASSETS 2006</v>
				<doi>10.1145/1168987.1169044</doi>
				<uri open=>https://pdfs.semanticscholar.org/0bae/cba9d9e4cc7ba01b390be869ba0fde8664ac.pdf</uri>
				<dblp>conf/assets/HarperBL06</dblp>
				SADIe is Structural Semantics for Accessibility and Device Independence. This is a very short paper briefly explaining the challenges visually impaired people face when surfing the web. The solution presented here which uses ontological inference and reasoning to refactor existing webpages into simplified user-friendly equivalents.
			</paper>
			<paper #OCSSE#>
				<a>Alessandro Cogliati, Petri Vuorimaa</a>
				<t>Optimized CSS Engine</t>
				<v>WEBIST 2006</v>
				<doi>10.5220/0001242502060213</doi>
				<dblp>conf/webist/CogliatiV06</dblp>
				Details of implementing and optimising a browser engine for CSS. The resulting system is 25%–45% faster and uses 85% less memory.
				[#OCSSE#], [#LECD#] and [#XMLBro#] are parts of the same project called <a href="http://www.xsmiles.org/publications.html">X-Smiles</a> (2000–2006).
			</paper>
			<!-- 2005 -->
			<paper>
				<a>Eric A. Meyer</a>
				<t>Is Accessible Design a Myth?</t>
				<v>W4A 2005</v>
				<doi>10.1145/1061811.1061823</doi>
				<dblp>conf/w4a/Meyer05</dblp>
			</paper>
			<paper #PWMDDCSS#>
				<a>Henrik Stormer</a>
				<t>Personalized Websites for Mobile Devices using Dynamic Cascading Style Sheets</t>
				<v>IJWIS 1(2), 2005</v>
				<doi>10.1108/17440080580000085</doi>
				<dblp>journals/ijwis/Stormer05</dblp>
				The paper lists limitations of mobile devices of its time (96 x 65 pixel screens, etc) and proposes to give up on the one-website-fits-all paradigm and generate personalised content from manually created baseline pages. Their case study is a webshop engine. Best quote from the paper: <em>“An interesting development are smartphones”</em>. Amusing read, but hopelessly outdated ideologically and full of misspellings.
			</paper>
			<paper #LECD#>
				<a>Mikko Pohja, Petri Vuorimaa</a>
				<t>CSS Layout Engine for Compound Documents</t>
				<v>LA-WEB 2005</v>
				<doi>10.1109/LAWEB.2005.13</doi>
				<dblp>conf/la-web/PohjaV05</dblp>
				Disregarding Mozilla, Opera, Konqueror and IE as wanna-be XML browsers suffering from HTML legacy, these authors present requirements, design, implementation, integration and evaluation of a stylesheet-based layout engine for a user agent capable of running on anything from handheld devices to digital TV sets.
			</paper>
			<!-- 2004 -->
			<paper>
				<a>Vincent Quint, Irène Vatton</a>
				<t>Techniques for Authoring Complex XML Documents</t>
				<v>DocEng 2004</v>
				<doi>10.1145/1030397.1030422</doi>
				<sleigh>DocEng-2004-QuintV</sleigh>
			</paper>
			<paper>
				<a>Kwok-Bun Yue, Wei Ding</a>
				<t>Design and Evolution of an Undergraduate Course on Web Application Development</t>
				<v>SIGCSE Bulletin 36(3), 2004</v>
				<doi>10.1145/1026487.1008005</doi>
				Archival version of [#DEUCWAD#]?
			</paper>
			<paper #DEUCWAD#>
				<a>Kwok-Bun Yue, Wei Ding</a>
				<t>Design and Evolution of an Undergraduate Course on Web Application Development</t>
				<v>ITiCSE 2004</v>
				<doi>10.1145/1007996.1008005</doi>
				<dblp>conf/iticse/YueD04</dblp>
			</paper>
			<paper>
				<a>Bob Regan</a>
				<t>Accessibility and Design: A Failure of the Imagination</t>
				<v>W4A 2004</v>
				<doi>10.1145/990657.990663</doi>
				<dblp>conf/w4a/Regan04</dblp>
			</paper>
			<paper>
				<a>Paul Ryan Bohman, Shane Anderson</a>
				<t>An Accessible Method of Hiding HTML Content</t>
				<v>W4A 2004</v>
				<doi>10.1145/990657.990664</doi>
				<dblp>conf/w4a/BohmanA04</dblp>
			</paper>
			<paper>
				<a>Timothy J. Hickey</a>
				<t>Scheme-based Web Programming as a Basis for a CS0 Curriculum</t>
				<v>ACM SIGCSE Bulletin 31(1), 2004</v>
				<doi>10.1145/1028174.971423</doi>
				Archived version of [#SBWPBCSC#]?
			</paper>
			<paper #SBWPBCSC#>
				<a>Timothy J. Hickey</a>
				<t>Scheme-based Web Programming as a Basis for a CS0 Curriculum</t>
				<v>SIGCSE 2004</v>
				<doi>10.1145/971300.971423</doi>
				<dblp>conf/sigcse/Hickey04</dblp>
			</paper>
			<!-- 
				<a>Dave Shea</a>
				<t>CSS Zen Garden</t>
				<v>SIGGRAPH Web Graphics 2004 Media</v>
				<doi>10.1145/1186194.1186219</doi>
				<dblp>conf/siggraph/Shea04</dblp>
			 -->
			<paper>
				<a>Henrik Stormer</a>
				<t>Personalized Websites for Mobile Devices using Dynamic Cascading Style Sheets</t>
				<v>MoMM 2004</v>
				<uri closed=>https://diuf.unifr.ch/main/is/publications/personalized-websites-mobile-devices-using-dynamic-cascading-style-sheets-0</uri>
				<bib>https://diuf.unifr.ch/main/is/publications/export/bibtex/51605</bib>
				The <a href="http://www.iiwas.org/publications.htm">Proceedings of MoMM 2004</a> with ISBN 3-85403-184-X, edited by Gabriele Kotsis, David Taniar and Ismail Khalil Ibrahim, are not available online anymore and I could not procure a copy through other methods. However, this paper is presumably just an earlier version of [#PWMDDCSS#]
			</paper>
			<!-- 2003 -->
			<paper #AGBDL#>
				<a>Charles Jacobs, Wilmot Li, Evan Schrier, David Bargeron, David Salesin</a>
				<t>Adaptive Grid-Based Document Layout</t>
				<v>ACM TOG 22(3), 2003</v>
				<doi>10.1145/882262.882353</doi>
				<dblp>journals/tog/JacobsLSBS03</dblp>
			</paper>
			<paper>
				<a>Charles Jacobs, Wilmot Li, Evan Schrier, David Bargeron, David Salesin</a>
				<t>Adaptive Grid-Based Document Layout</t>
				<v>SIGGRAPH 2003</v>
				<doi>10.1145/1201775.882353</doi>
				Preproceedings version of [#AGBDL#]?
			</paper>
			<paper #XMLBro#>
				<a>Alessandro Cogliati, Mikko Pohja, Petri Vuorimaa</a>
				<t>XHTML and CSS Components in an XML Browser</t>
				<v>ICOMP 2003</v>
				<dblp>conf/ic/CogliatiPV03</dblp>
				When HTML was redefined in XML terms as XHTML, it became challenging again to make a browser and interesting enough to write a paper about it. This paper is introductory and has three follow-ups: “<a href="https://pdfs.semanticscholar.org/aaf4/9608d3952e4dbdf02df6e27cc19f7836e590.pdf">An XHTML 2.0 Implementation</a>”, [#LECD#] and [#OCSSE#] above.
			</paper>
			<!-- 2002 -->
			<!-- 2001 -->
			<!-- 2000 -->
			<!-- 1999 -->
			<paper>
				<a>Håkon Wium Lie, Janne Saarela</a>
				<t>Multipurpose Web Publishing Using HTML, XML, and CSS</t>
				<v>CACM 42(10), 1999</v>
				<doi>10.1145/317665.317681</doi>
				<uri open=>https://www.w3.org/People/Janne/porject/paper.html</uri>
				<dblp>journals/cacm/LieS99</dblp>
				The official overview of the CSS1 and CSS2 coauthored by the inventor of CSS. Contains figures of the same content displayed with different styles and speculations about the future of the web.
			</paper>
			<paper>
				<a>Greg J. Badros, Alan Borning, Kim Marriott, Peter J. Stuckey</a>
				<t>Constraint Cascading Style Sheets for the Web</t>
				<v>UIST 1999</v>
				<doi>10.1145/320719.322588</doi>
				<uri open=>https://constraints.cs.washington.edu/web/ccss-uwtr.pdf</uri>
				<dblp>conf/uist/BadrosBMS99</dblp>
				This paper is based on the very first, now long-forgotten <a href="https://www.w3.org/TR/1998/REC-CSS2-19980512/">CSS2.0</a> proposal which was later replaced by a non-backwards-compatible CSS2.1 which people mean nowadays when they say “CSS2”. The authors propose CCSS, a language that adds constraints to CSS2.0 with which one can express, for instance, that the font size of the headings should be strictly greater than the font size of the paragraphs. They extend the <a href="https://www.w3.org/Amaya/">Amaya</a> browser to implement the language and its constraint solving rendering schemes.
			</paper>
			<!-- 1998 -->
			<paper>
				<a>Jukka K. Korpela</a>
				<t>Lurching Toward Babel: HTML, CSS, and XML</t>
				<v>IEEE Computer 31(7), 1998</v>
				<doi>10.1109/2.689682</doi>
				<uri open=>http://221.224.56.74:88/lib/books/268/ts268060.pdf</uri>
				<dblp>journals/computer/Korpela98</dblp>
				A broad explanation of what CSS can do, possibly the first published account of the now-classic example of “this is how the web would have looked without styles”.
			</paper>
			<!-- 1997 -->
			<paper>
				<a>Stuart Culshaw, Michael Leventhal, Murray Maloney</a>
				<t>XML and CSS</t>
				<v>WWW Journal 2(4), 1997</v>
				<uri open=>http://www.xml.com/pub/a/w3j/s3.leventhal.html</uri>
				<dblp>journals/wwwj/CulshawLM97</dblp>
				One of the very first detailed mentions of CSS less than a year after CSS1 reached W3C Rec level. No research contribution, just explanations of what it can do, with lots of examples. PREPARE FOR CAPSLOCK.
			</paper>
		</ol>
		<rejected>
			<no doi="10.1145/2938503.2938527">Modern Web Page Generation by Using Exclusively SuperSQL</no>
			<no doi="10.1145/2851581.2892553">cTed: Advancing Selection Mechanisms in Web Browsers</no>
		</rejected>
		<footer/>
	</body>
</html>

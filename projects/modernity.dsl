<html doctype>
	<head jquery title="Dr. Vadim Zaytsev — Pipeline" />
	<body>
		<header/>
		<h1>
			Software Modernity
			<a href="../logos/modernity.500.png"><img src="../logos/modernity.500.png" alt="modernity" title="modernity" style="max-width: 200px;" /></a>
		</h1>
		<hr/>
		<p>
			Code modernity research direction is an unfunded endeavour which concerns <strong>coevolution</strong> of software languages and codebases written in those languages. We analyse new language features that software language engineers put into new versions of their languages, and track adoption of those by users of these languages over time.
		</p>
		<p>
			We have started bottom-up by tracking the use of certain features over long periods of time, in languages with a strong culture of writing idiomatic code, such as Python. Our findings indicated that some language features have a much slower adoption curve than others; that some others reach a certain saturation level which they never significantly surpass; and that some features even follow the <a href="https://en.wikipedia.org/wiki/Gartner_hype_cycle">hype cycle</a> curve with their <em>peaks of inflated expectations</em> and <em>troughs of disillusionment</em>.
		</p>
		<p>
			Then, we proposed the concept of <strong>modernity signatures</strong> which can be created systematically by traversing parse trees, and accumulated to estimate the age of a codebase. We found out the real software projects differ in their modernity profile, with notable extremes abstaining entirely from new language features (presumably for compatibility and portability reasons) on one hand, and embracing them even before the corresponding major release officially declares them ready for use (possibly for developer effectiveness). Personal taste and coding traditions certainly have their influence there as well.
		</p>
		<p>
			We have replicated the experiments over many different programming languages, seeking to provide insights into coding practices, codebase health and the evolution of software languages. There is also inherent maintenance value in estimating the age of a codebase without executing the code or performing extensive human inspection. We believe modernity signatures can aid developers in many ways from choosing whether to use a system or how to approach its maintenance, to assessing usefulness of a language feature, thus providing a valuable tool for source code analysis and manipulation.
		</p>
		<p>
			One of the future steps for us is to attempt to link modernity of a codebase with the quality of the code in it.
		</p>
		<br clear="both">
		<h2>Completed projects</h2>
		<picdir>../logos</picdir>
		<pic>
			<a>http://purl.utwente.nl/essays/86873</a>
			<img>python.110.svg</img>
			<alt>Python logo (GPL)</alt>
			<title>UT BSc TCS student project</title>
			<name>Aamir Farooq (2021)</name>
			<text>pythonicity analysis</text>
		</pic>
		<pic>
			<a>http://purl.utwente.nl/essays/91735</a>
			<img>duke.300.png</img>
			<alt>Java Duke logo (BSD)</alt>
			<title>UT BSc TCS student project</title>
			<name>Berke Güdücü (2022)</name>
			<text>Java modernity (up to AST level)</text>
		</pic>
		<pic>
			<a>http://purl.utwente.nl/essays/91794</a>
			<img>php.200.png</img>
			<alt>PHP logo (CC-BY-SA)</alt>
			<title>UT BSc TCS student project</title>
			<name>Wouter van den Brink (2022)</name>
			<text>PHP modernity</text>
		</pic>
		<pic>
			<a>http://purl.utwente.nl/essays/94375</a>
			<img>python.110.svg</img>
			<alt>Python logo (GPL)</alt>
			<title>UT BSc TCS student project</title>
			<name>Chris Admiraal (2023)</name>
			<text>Python modernity (based on netromdk's <tt>vermin</tt>)</text>
		</pic>
		<pic>
			<a>http://purl.utwente.nl/essays/96034</a>
			<img>../projects/modnormforms.png</img>
			<alt>normalisation formulae (vector, z-score, logarithmic)</alt>
			<title>UT BSc TCS student project</title>
			<name>Cristian Zubcu (2023)</name>
			<text>effects of normalisation on modernity reports</text>
		</pic>
		<pic>
			<a>http://purl.utwente.nl/essays/101016</a>
			<img>csharp.300.svg</img>
			<alt>C# logo (public domain)</alt>
			<title>UT BSc TCS student project</title>
			<name>Marks Troicins (2024)</name>
			<text>C# modernity (based on <tt>Roslyn</tt>, tested on 6 repos)</text>
		</pic>
		<pic>
			<a>http://purl.utwente.nl/essays/98262</a>
			<img>rust.106.svg</img>
			<alt>Rust logo (CC-BY)</alt>
			<title>UT BSc TCS student project</title>
			<name>Chris Bleeker (2024)</name>
			<text>Rust modernity</text>
		</pic>
		<pic>
			<a>http://purl.utwente.nl/essays/105139</a>
			<img>js.512.svg</img>
			<alt>unofficial JavaScript logo (public domain)</alt>
			<title>UT BSc TCS student project</title>
			<name>Thijs Beumer (2025)</name>
			<text>JavaScript modernity</text>
		</pic>
		<pic>
			<a>http://purl.utwente.nl/essays/107509</a>
			<img>csharp.300.svg</img>
			<alt>C# logo (public domain)</alt>
			<title>UT BSc TCS student project</title>
			<name>Sorin Zele (2025)</name>
			<text>C# modernity (8800+ commits from 134 repos)</text>
		</pic>
		<br clear="both">
		<h2 help="latest first">Publications</h2>
		<ul>
			<li>
				Chris Admiraal, Wouter van den Brink, Marcus Gerhold, Vadim Zaytsev, Christian Zubcu.
				<em>Deriving Modernity Signatures of Codebases with Static Analysis</em>, JSS vol. 211, 2024.
				<doired>10.1016/j.jss.2024.111973</doired>
			</li>
			<li>
				Wouter van den Brink, Marcus Gerhold, Vadim Zaytsev.
				<em>Deriving Modernity Signatures for PHP Systems with Static Analysis</em>, SCAM 2022
				<doired>10.1109/SCAM55253.2022.00027</doired>
			</li>
			<li>
				Aamir Farooq, Vadim Zaytsev.
				<em>There Is More Than One Way to Zen Your Python.</em>, SLE 2021.
				<doired>10.1145/3486608.3486909</doired>
			</li>
		</ul>
		<footer/>
	</body>
</html>

Project Requirements:
1. A statement of the research question you wish to answer with molecular modeling, and an argument for why the tools you're using are appropriate for answering this question.

2. A code repository that documents:

    2.0 The setup for your software environment.

    2.1. Your protocols for initializing your systems.

    2.2. The interactions defining your forcefield.

    2.3. Your protocols for equilibrium sampling and a measurement of energy decorrelation times for each run.

    2.4. Some evidence justifying the system sizes you consider - This can be literature citations, experiments you run, or performance scaling analyses. 

3. A pdf document that summarizes 2.0-2.4 and then reports out on your answer to your research question.

Rubric:

40% For a well-posed question that has been discussed with the instructor iteratively in class. -10% for up to 4 mismatches: e.g. methods (e.g., MD to study fluid-vapor coexistence, or MC to study diffusion of acetone in water), or developing detailed forcefields where simplified models work well or better, or systems with major finite-size effects. 
10% for each of: 2.0-2.4. Your code will be tested on Borah, -5% if it doesn't run without error.
5% for a concise summary that doesn't confuse Eric.
5% for implementing new concepts relative to the first 2 projects. For example, applying an EAM forcefield or water model, calculating free energy differences, implementing a nonstandard molecule in Gromacs, or performing polymer simulations.

This directory contains files to establish properties comparing the sequential segway, (version4), 3 versions of the parallel segway, and 
the parallel segway where the AnglePID controller has been replaced with an ANN component. 

- segwaycomparison_cspgen contains the most recent version of the segway comparison project automatically generated CSP semantics. 
- cspgen_integrated_annsemantics contains the generated csp semantics, but where AnglePID_C (O__ process) has been replaced by an ANN controller. 
- ANN_semantics contains the ANN controller in its own module, for isolation testing purposes. 

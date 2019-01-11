# Introduction

This folder contains the transcription of the original Apollo Program drawing 1006543D to KiCad.  This is the electrical schematic for Block I AGC module A17.  We also have revision 1006543- through 1006543C of the original drawing, though these have not been transcribed to CAD so far.  

At the same time, the schematic is supplemented by the original "signal wiring diagram", of which we have drawing 1006123B (and 1006123- and 1006123A).  Signal wiring diagrams provide information lacking in the schematics, primarily reference designators and input-pin numbering for NOR gates.  The signal wiring diagrams also duplicate most of the NOR-gate and connector wiring, albeit with a certain degree of ambiguity, though this information is not needed by the transcription process.  

__Note:__ Wiring diagram 1006123B is likely matched to schematic 1006543B rather than to 1006543D, and we would likely require 1006123D to have the appropriate match instead.  However, we only have the resources we have, and not the resources we might wish to have.

_Prior_ to the availability of the original drawings for module A17, the schematics for this module were "recovered" from AC Electronics document ND-1021041 as a different set of KiCad files, referred to as [1006543r](https://github.com/virtualagc/virtualagc/edit/schematics/Schematics/1006543r).  Now that CAD files from both the original and from ND-1021041 are available, it is a useful proofing method, as well as a way to judge the accuracy of ND-1021041, to compare the netlists of these two implementation of 1006543 in CAD.  

There is [a Python script](https://github.com/virtualagc/virtualagc/edit/schematics/Scripts/netlistCompare.py) to assist in carrying out this comparison.  I don't claim the script is perfect or all-inclusive, but it did find stuff, and after I fixed up those things it did stop detecting them.

The reason a script is needed rather than a simple text comparison is that various factors need to be ignored in the comparison, and thus some semantic understanding of what's going on is needed:

* Different reference designators for NOR gates
* Different input-pin assignments in NOR gates
* Different naming of backplane signals, in cases where ND-1021041 _does not_ provide explicits name for them.

Differences which can be detected using this method, once the factors above are discounted, are:

* Missing components in one or the other netlist.
* Missing component pins in one or the other netlist.
* Different naming of backplane signals, in cases where ND-1021041 _does_ provide explicit names for them.
* Different connectivity.

The differences that are detected are then either transcription errors (which are fixed within the CAD files themselves), legitimate differences in conventions (such as "(NC)" vs "N.C." for no-connects), or else are actual differences that require, or at least invite, resolution.  The findings relating to the actual differences are noted below.

# TBD

TBD

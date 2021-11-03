# hydrophobicity
A software for adding hydrophobicity values on pdb. You may add this software on a repertory and add it on the $PATH variable of your linux distribution.

In a shell, type:

% hydrophobicity.pl filename.pdb

This software put the protein hydrophobicity values of each residue type to the B-factor column of a pdb. Visualisation can then be made by several softwares such as VMD or pymol. The user will have the choice between several scales:

   - 1  Hopp-Woods 
   - 2  Cornette 
   - 3  Eisenberg 
   - 4  Rose 
   - 5  Janin 
   - 6  Engelman

A common choice is Eisenberg (3). The new pdb file will have the format: filename_hydro.pdb. To visualize the values on vmd software: you have to choose 'Beta' as 'coloring method' in the 'graphical representation' dialog. Similar representations could be find on other molecular visualization software. All values have been normalized to be used as beta factor.

If this software is useful for you, please cite: 
"Solution structure of ALO3: a new knottin-type antifungal peptide from the insect Acrocinus longimanus." F. Barbault, C. Landon, M. Guenneugues, M. Legrain, V. Schott, J.L. Dimarcq and F. Vovelle*. Biochemistry 2003 (42) pp 14434-42 

#!/usr/bin/perl
# ***********************
# *  hydrophobicity.pl  *
# ***********************
#
# usage: hydrophobicity.pl file.pdb
#
# this soft put the protein hydrophobicity values to the B-factor data of a pdb.
# Visualisation can then be made by several softwares such as VMD or pymol.
# 
#
$| = 1;
use strict;
use Math::Trig;
#-----------------------------------------------------------------------------------------------------------------------------
# Get the input arguments and declarations
#
my $pdb=$ARGV[0];
my @A = (0,0.55,0.38,0.81,0.56,0.78,0.87);
my @C = (0,0.62,0.82,0.72,1.00,1.00,0.89);
my @D = (0,0.00,0.00,0.42,0.26,0.44,0.19);
my @E = (0,0.00,0.15,0.46,0.26,0.41,0.26);
my @F = (0,0.86,0.85,0.95,0.92,0.85,1.00);
my @G = (0,0.47,0.35,0.77,0.51,0.78,0.83);
my @H = (0,0.45,0.41,0.54,0.67,0.63,0.58);
my @I = (0,0.75,0.90,1.00,0.92,0.93,0.96);
my @K = (0,0.00,0.00,0.26,0.00,0.00,0.22);
my @L = (0,0.75,1.00,0.92,0.85,0.85,0.94);
my @M = (0,0.67,0.83,0.81,0.85,0.82,0.98);
my @N = (0,0.44,0.30,0.45,0.28,0.48,0.47);
my @P = (0,0.47,0.10,0.68,0.31,0.56,0.76);
my @Q = (0,0.44,0.03,0.43,0.26,0.41,0.51);
my @R = (0,0.00,0.51,0.00,0.31,0.15,0.00);
my @S = (0,0.42,0.30,0.60,0.36,0.63,0.81);
my @T = (0,0.53,0.14,0.63,0.46,0.59,0.84);
my @V = (0,0.70,0.89,0.92,0.87,0.89,0.93);
my @W = (0,1.00,0.47,0.85,0.85,0.78,0.89);
my @Y = (0,0.82,0.72,0.71,0.62,0.52,0.73);
my $res="";
my $i=0;
my $ligne="";
my $choix=0;
my $val=0.5;
my $i=0;
my $sort="";
#-----------------------------------------------------------------------------------------------------------------------------
# Check if there is no pdb file as input
#
if ($pdb eq "")
 {
   print "\n!!!!!!!! usage:  hydrophobicity ^ pdb_file !!!!!!!!!\n";
   print "\n END, no creation\n";
 }
else
{
#-----------------------------------------------------------------------------------------------------------------------------
# Choose which hydrophobicity scale
#
 print "\nChoose which type of hydrophobicity you want";
 print "\n1  Hopp-Woods";
 print "\n2  Cornette";
 print "\n3  Eisenberg";
 print "\n4  Rose";
 print "\n5  Janin";
 print "\n6  Engelman";
 print "\n\nPlease, make your choice :   ";
 $choix=<STDIN>;
 chop($choix);
#-----------------------------------------------------------------------------------------------------------------------------
# create the output filename as filename.pdb to filename_hydro.pdb
#
 $sort=$pdb."_hydro";
 $sort=~ s/(.pdb)+//;
 $sort=$sort.".pdb";
#-----------------------------------------------------------------------------------------------------------------------------
# intializing the loops
#
 $res="";
 $i=0;
 $ligne="";
#-----------------------------------------------------------------------------------------------------------------------------
# opening files and add hydrophobicity
#
 open (FSOR, "> $sort");
 open (FILE, "< $pdb");
 while (<FILE>)
 {
   $ligne=substr($_,0,54);
   $res=substr($_,17,3);
   $val = 0.5;
   #
   if ($res eq "ALA"){ $val = $A[$choix];}
   if ($res eq "CYS"){ $val = $C[$choix];}
   if ($res eq "CYX"){ $val = $C[$choix];}
   if ($res eq "ASP"){ $val = $D[$choix];}
   if ($res eq "GLU"){ $val = $E[$choix];}
   if ($res eq "PHE"){ $val = $F[$choix];}
   if ($res eq "GLY"){ $val = $G[$choix];}
   if ($res eq "HIS"){ $val = $H[$choix];}
   if ($res eq "HIE"){ $val = $H[$choix];}
   if ($res eq "HIP"){ $val = $H[$choix];}
   if ($res eq "ILE"){ $val = $I[$choix];}
   if ($res eq "LYS"){ $val = $K[$choix];}
   if ($res eq "LEU"){ $val = $L[$choix];}
   if ($res eq "MET"){ $val = $M[$choix];}
   if ($res eq "ASN"){ $val = $N[$choix];}
   if ($res eq "PRO"){ $val = $P[$choix];}
   if ($res eq "GLN"){ $val = $Q[$choix];}
   if ($res eq "ARG"){ $val = $R[$choix];}
   if ($res eq "SER"){ $val = $S[$choix];}
   if ($res eq "THR"){ $val = $T[$choix];}
   if ($res eq "VAL"){ $val = $V[$choix];}
   if ($res eq "TRP"){ $val = $W[$choix];}
   if ($res eq "TYR"){ $val = $Y[$choix];}
   print FSOR "$ligne  1.00  $val\n";
 }
 print "\n The END, file $sort has been created.\n";
}
close(FILE);
close(FSOR);

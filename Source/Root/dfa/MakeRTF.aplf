 r←color MakeRTF qcr;hdr;font;blue;green;red;txt;trlr;colorNames;l0;lz;c;black;rb;gb;rgb128;prefix;yellow;cyan;magenta
 ⍝ Create RTF to display qcr text in one color per character
 hdr←'{\rtf1\ansi\ansicpg1252\deff0\deflang2057',LF,LF
 font←'{\fonttbl{\f0\fswiss\fcharset0 Arial;}'
 font←font,'{\f1\fnil\charset2 Dyalog Std TT;}}',LF,LF
 black←';\red0\green0\blue0'
 blue←';\red0\green0\blue255'
 cyan←';\red0\green255\blue255'
 green←';\red0\green255\blue0'
 magenta←';\red255\green0\blue255'
 red←';\red255\green0\blue0'
 yellow←';\red0\green255\blue255'
 rb←';\red255\green0\blue255'
 gb←';\red0\green255,\blue255'
 rgb128←';\red128\green128\blue128'
 colorNames←'{\colortbl ',black,blue,cyan,green,magenta,red,yellow
 colorNames←colorNames,rb,gb,rgb128,';}',LF,LF
 l0←'{\f1\fs48\b0' ⍝ Each line in same font, non-bold, 24pt
 lz←'}\par',LF,LF  ⍝ Newline after each line
 txt←color Highlight qcr
 txt←D Raze¨(ER1 txt),¨E'\par'
 txt←D Raze txt
 txt←l0,txt,lz
 trlr←'\par}',CR,LF
 prefix←'\viewkind4\uc1\pard'
 r←hdr,font,colorNames,prefix,txt,trlr

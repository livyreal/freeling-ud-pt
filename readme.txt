How to reproduce:

1. First, download Bosque 7.5 UD from Linguateca: in 7.5/ execute
   download.sh

2. Fix all the issues in Bosque 7.5 UD: in 7.5/ execute fix-errors.sh.
   The errors found are listed in 7.5/readme.txt

3. Make sure you have perl modules for Freeling 4.0 ready to use.  See
   the Freeling documentation for more details on how to compile it and
   its API modules. 

4. Update the path to your Freeling installation in
   conll_convert_tags_from_uposf.pl

5. Execute convert-7.5.sh

6. The result from that command is four files:

   devel.conll train.conll: to be used in training treeler (see next
   steps)

   freeling.tokens palavras.tokens: to be used in comparing the
   differences between PALAVRAS and Freeling tokenization and PoS
   tagging.

7. If you are unable to execute these steps, the directory
   pregenerated/ contains a version of those files.

8. To train treeler, see train/readme.txt

This script was developed under Ubuntu 14.04, the following are the
programs and their versions used:

awk: GNU Awk 4.0.1
python: Python 2.7.6
perl: perl v5.18.2
bash: GNU bash, version 4.3.11(1)-release
grep: grep (GNU grep) 2.16

For issues documentation we use:
CGDE in Universal dependencies in CoNLL format: 
[1] bosque_CP.udep.conll.gz,
[2] bosque_CF.udep.conll.gz 
Last modification March, 22 2016, version 7.5, by Eckhard Bick
Available at: http://www.linguateca.pt/floresta/levantamento.html

To compare [1] and [2] to other Bosque Versions, we use [3] and [4]

[3]7.3 Bosque version, converted by  Dan Zeman, available at https://github.com/UniversalDependencies/UD_Portuguese
[4]7.3 made available by Linguateca Team, CoNLL format, at http://www.linguateca.pt/floresta/CoNLL-X/

#!/usr/bin/env perl

# Converts from UD to Freeling EAGLES PT

# Based on the following script: coll_convert_tags_to_uposf.pl, with this description:

# Reads CoNLL-X from STDIN, converts CPOS+POS+FEAT to the universal POS and features, writes the result to STDOUT.
# The output contains the universal POS tag in the CPOS column and the universal features in the FEAT column.
# The POS column is copied over from the input.
# Copyright © 2015 Dan Zeman <zeman@ufal.mff.cuni.cz>
# License: GNU GPL

use utf8;
use open ':utf8';
binmode(STDIN, ':utf8');
binmode(STDOUT, ':utf8');
binmode(STDERR, ':utf8');
use Getopt::Long;
use Lingua::Interset::Converter;

use lib '.';
use freeling;

my $FREELINGDIR = "/home/fcbr/bin/freeling-4.0";
my $DATA = $FREELINGDIR."/share/freeling/";
my $LANG="pt";

my $ts = new freeling::tagset($DATA.$LANG."/tagset.dat");

my $tagset1 = 'pt::freeling';

my $c = new Lingua::Interset::Converter ('to' => $tagset1, 'from' => 'mul::uposf');

# Read the CoNLL-U file from STDIN or from files given as arguments.
while(<>)
{
    # Skip comment lines before sentences.
    # Skip empty lines after sentences.
    # Skip initial lines of multi-word tokens.
    unless(m/^#/ || m/^\s*$/ || m/^\d+-\d/)
    {
        chomp();
        my @f = split(/\t/, $_);

        if (scalar @f eq 8)
        {
            my $tag = "$f[3]\t$f[5]";

            my $ftag1 = $c->convert($tag);
            # print "< $tag # $ftag1\n";

            my $msd = $ts->get_msd_string($ftag1);
            my $ftag2 = $ts->msd_to_tag('', $msd);
            my $short = $ts->get_short_tag($ftag2);
            
            $f[3] = $short;
            $f[4] = $ftag2;
            $f[5] = $msd;
        }

        $_ = join("\t", @f)."\n";
    }
    # Write the modified line to the standard output.
    print();
}

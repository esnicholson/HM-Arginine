use Modern::Perl;
use HackaMol;
use Path::Tiny;

path("pdbs")->mkpath;

my @pdbs = qw(
167L
168L
169L
170L
171L
172L
173L
174L
175L
176L
177L
178L
180L
);

say HackaMol->new->pdbid_mol($_)->mass foreach @pdbs;

system("mv *.pdb pdbs/");


use Modern::Perl;
use HackaMol;
use YAML::XS;


my @pdbs = glob("pdbs/*pdb");

my $bldr = HackaMol->new;

my %bin;

foreach my $pdb (@pdbs){
  say $pdb;
  my @atoms = $bldr->read_file_atoms($pdb);
  my @cz_arg = grep{ $_->name    eq 'CZ' }
               grep{ $_->resname eq 'ARG'} @atoms;
  #HackaMol::Molecule->new(atoms=>[@cz_arg])->print_pdb($pdb.".shit.pdb");
 # HackaMol::Molecule->new(atoms=>[@cz_arg])->print_pdb;
foreach my $cz (@cz_arg){
	my @cluster = grep {$cz->distance($_) <= 5} @atoms;
#	HackaMol::Molecule->new(atoms=>[@cluster])->print_pdb;
	$bin{$_}++ foreach ( map{ $_->resname} @cluster );
}
}

print Dump \%bin;



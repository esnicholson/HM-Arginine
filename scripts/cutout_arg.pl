use Modern::Perl;
use HackaMol;
use YAML::XS;


my @pdbs = glob("pdbs/*pdb");

my $bldr = HackaMol->new;

foreach my $pdb (@pdbs){
  say $pdb;
  my @cz_arg = grep{ $_->name    eq 'CZ' }
               grep{ $_->resname eq 'ARG'} $bldr->read_file_atoms($pdb);
  #HackaMol::Molecule->new(atoms=>[@cz_arg])->print_pdb($pdb.".shit.pdb");
  HackaMol::Molecule->new(atoms=>[@cz_arg])->print_pdb;
}



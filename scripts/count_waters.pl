use Modern::Perl;
use HackaMol;
use YAML::XS;


my @pdbs = glob("pdbs/*pdb");

my $bldr = HackaMol->new;

foreach my $pdb (@pdbs){
  say $pdb;
  my @atoms = $bldr->read_file_atoms($pdb);
  my @waters = grep {$_->resname eq 'HOH'} @atoms;
  say scalar (@waters);
}



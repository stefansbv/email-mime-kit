package Email::MIME::Kit::KitReader::Dir;

use Moose;
with 'Email::MIME::Kit::Role::KitReader';
# ABSTRACT: read kit entries out of a directory

use File::Spec;

# cache sometimes
sub get_kit_entry {
  my ($self, $path) = @_;
  
  my $fullpath = File::Spec->catfile($self->kit->source, $path);

  open my $fh, '<', $fullpath or die "can't open $fullpath for reading: $!";
  my $content = do { local $/; <$fh> };

  return \$content;
}

1;

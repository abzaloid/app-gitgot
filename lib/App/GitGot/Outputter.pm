package App::GitGot::Outputter;

# ABSTRACT: Generic base class for outputting formatted messages.
use 5.014;

use Term::ANSIColor qw/ colored /;
use Types::Standard -types;

use App::GitGot::Types;

use Moo;
use namespace::autoclean;

=attr no_color

Boolean indicating whether color messages should be output at all.

=cut

has no_color => (
  is            => 'ro' ,
  isa           => Bool ,
  default       => 0 ,
  documentation => 'boolean indicating whether color messages should be output at all' ,
);

=method error

Display a message using the 'color_error' color settings.

=cut

sub error {
  my( $self , $message ) = @_;
  return $self->_colored( $message , $self->color_error );
}

=method major_change

Display a message using the 'color_major_change' color settings.

=cut

sub major_change {
  my( $self , $message ) = @_;
  return $self->_colored( $message , $self->color_major_change );
}

=method minor_change

Display a message using the 'color_minor_change' color settings.

=cut

sub minor_change {
  my( $self , $message ) = @_;
  return $self->_colored( $message , $self->color_minor_change );
}

=method warning

Display a message using the 'color_warning' color settings.

=cut

sub warning {
  my( $self , $message ) = @_;
  return $self->_colored( $message , $self->color_warning );
}

sub _colored {
  my( $self , $message , $color_string ) = @_;

  return ( $self->no_color || $color_string eq 'uncolored' ) ? $message
    : colored( $message , $color_string );
}

1;

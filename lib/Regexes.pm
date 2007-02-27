# $Id: Regexes.pm 2183 2007-02-27 23:24:59Z comdog $
package Brick::Regexes;
use strict;

use base qw(Exporter);
use vars qw($VERSION);

$VERSION = sprintf "1.%04d", q$Revision: 2183 $ =~ m/ (\d+) /xg;

package Brick::Bucket;
use strict;

use Carp qw(croak);
use Storable qw(dclone);

=head1 NAME

Brick - This is the description

=head1 SYNOPSIS

	use Brick::Constraints;

=head1 DESCRIPTION

See C<Brick::Constraints> for the general discussion of constraint
creation.

=head2 Utilities

=over 4

=item matches_regex( HASHREF )

Create a code ref to apply a regular expression to the named field.

	field - the field to apply the regular expression to
	regex - a reference to a regular expression object ( qr// )

=cut

sub _matches_regex
	{
	my( $bucket, $setup ) = @_;

	my @caller = main::__caller_chain_as_list();

	unless( eval { $setup->{regex}->isa( ref qr// ) } )
		{
    	croak( "Argument to $caller[0]{'sub'} must be a regular expression object" );
		}

	$bucket->add_to_bucket ( {
		name        => $setup->{name} || $caller[0]{'sub'},
		description => ( $setup->{description} || "Match a regular expression" ),
		#args       => [ dclone $hash ],
		fields      => [ $setup->{field} ],
		code        => sub {
			die {
				message => "The value in $setup->{field} [$_[0]->{ $setup->{field} }] did not match the pattern",
				field   => $setup->{field},
				handler => $caller[0]{'sub'},
				} unless $_[0]->{ $setup->{field} } =~ m/$setup->{regex}/;
			},
		} );

	}

=back

=head1 TO DO

Regex::Common support

=head1 SEE ALSO

TBA

=head1 SOURCE AVAILABILITY

This source is part of a SourceForge project which always has the
latest sources in CVS, as well as all of the previous releases.

	http://sourceforge.net/projects/brian-d-foy/

If, for some reason, I disappear from the world, one of the other
members of the project can shepherd this module appropriately.

=head1 AUTHOR

brian d foy, C<< <bdfoy@cpan.org> >>

=head1 COPYRIGHT

Copyright (c) 2007, brian d foy, All Rights Reserved.

You may redistribute this under the same terms as Perl itself.

=cut

1;
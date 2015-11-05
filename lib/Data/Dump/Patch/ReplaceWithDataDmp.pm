package Data::Dump::Patch::ReplaceWithDataDmp;

# DATE
# VERSION

use 5.010001;
use strict;
no warnings;
#use Log::Any '$log';

use Module::Patch 0.12 qw();
use Data::Dmp;
use base qw(Module::Patch);

our %config;

sub patch_data {
    return {
        v => 3,
        patches => [
            {
                action => 'replace',
                sub_name => 'dump',
                code => sub {
                    if (defined wantarray) { dmp(@_) } else { dd(@_) }
                },
            },
        ],
    };
}

1;
# ABSTRACT: Replace Data::Dump's dump() with Data::Dmp's version

=for Pod::Coverage ^(patch_data)$

=head1 SYNOPSIS

 use Data::Dump::Patch::ReplaceWithDataDmp;


=head1 DESCRIPTION

This patch module is for testing. It will replace L<Data::Dump>'s C<dump()>
routine with one that uses L<Data::Dmp>, so any other code that uses Data::Dump
will dump using Data::Dmp instead.


=head1 SEE ALSO

=cut

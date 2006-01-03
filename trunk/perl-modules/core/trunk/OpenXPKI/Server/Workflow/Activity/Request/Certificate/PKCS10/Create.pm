# OpenXPKI Workflow Activity
# Copyright (c) 2005 Martin Bartosch
# $Revision: 80 $

package OpenXPKI::Server::Workflow::Activity::Request::Certificate::PKCS10::Create;

use strict;
use base qw( OpenXPKI::Server::Workflow::Activity );
use Log::Log4perl       qw( get_logger );

# use Smart::Comments;


sub execute {
    my $self = shift;
    my $workflow = shift;

    $self->setparams($workflow, 
		     {
			 token => {
			     required => 1,
			 },
			 key => {
			     required => 1,
			 },
			 keypass => {
			 },
			 subject => {
			     required => 1,
			 },
		     });    


    my $context = $workflow->context();
    my $log = get_logger(); 
    
    my $token = $self->param('token');

    ## create CSR
    my $csr = $token->command ("create_pkcs10",
			       KEY     => $self->param('key'),
			       PASSWD  => $self->param('keypass'),
			       SUBJECT => $self->param('subject'));
    

    ### Creating PKCS10 request...
    # export
    $context->param(pkcs10request => $csr);

    $workflow->add_history(
        Workflow::History->new({
            action      => 'Create PKCS#10 request',
            description => sprintf( "Created PKCS#10 request"
		),
            user        => $self->param('creator'),
			       })
	);
    
}


1;

=head1 Description

Implements the 'PKCS#10 request creation' workflow action.

=head2 Context parameters

Expects the following context parameters:

=over 12

=item creator

User id of creator

=back

FIXME: This activity is the entry point as seen from the web interface. 
We should list and require all parameters that have to be queried from
the user.

=head1 Functions

=head2 execute

Executes the action.

# ignore mistargetted hilights
#
# DESCRIPTION
# based on mass_hilight_blocker.pl by Uli Baumann (GPL)
#
# CHANGELOG
# * 17.07.2011
# First version

use Irssi;
use vars qw($VERSION %IRSSI);
$VERSION = "0.1";
%IRSSI = (
        authors         => "Nigel Jones",
        contact         => "nigel\@nigelj.com",
        name            => "hilight_blocker",
        description     => "Blocks mistargetted hilights",
        license         => "GPL",
        changed         => "Tue Jul  17 15:25:34 NZST 2011",
);

sub sig_pubmsg {
        my ($dest, $text, $stripped) = @_;
        my $window = $dest->{window};
        my $pattern='G(\+|\')';

        if (($dest->{level} & MSGLEVEL_HILIGHT) && ($dest->{level} & MSGLEVEL_PUBLIC))
        {
                if ($text =~ m/$pattern/i)
                {
                        $window->print($text, MSGLEVEL_PUBLIC);
                        Irssi::signal_stop();
                }
        }
}

Irssi::signal_add_first('print text', 'sig_pubmsg');


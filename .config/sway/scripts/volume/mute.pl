#!/usr/bin/env perl

my $master;

# remove whitespaces
sub trim {
    my $s = shift;
    $s =~ s/^\s+|\s+$//g;
    return $s;
};

$master = `amixer sget Master | egrep "%" | head -n1 | awk '{print \$6}'`;
$master = substr(trim($master), 1, -1);
printf $master;

if ($master eq "off") {
    `amixer -q sset Master on`;
} else {
    `amixer -q sset Master off`;
}

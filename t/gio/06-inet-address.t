use v6.c;

use Test;

use GTK::Compat::Types;

use GIO::InetAddress;

sub test-parse {
  my @non-null = <
    0:0:0:0:0:0:0:0
    1:0:0:0:0:0:0:8
    0:0:0:0:0:FFFF:204.152.189.116
    ::1
    ::
    ::FFFF:204.152.189.116
    204.152.189.116
  >;

  my @null = «
    ::1::2
    2001:1:2:3:4:5:6:7]
    [2001:1:2:3:4:5:6:7
    [2001:1:2:3:4:5:6:7]
    [2001:1:2:3:4:5:6:7]:80
    0:1:2:3:4:5:6:7:8:9
    ::FFFFFFF
    204.152.189.116:80
  »;

  for @non-null {
    my $a = GIO::InetAddress.new($_, :string);

    ok ~$a,   "Address {$_} is valid";
  }

  for @null {
    my $a = GIO::InetAddress.new($_, :string);

    nok $a,  "Address {$_} is NOT valid";
  }
}

sub test-any {
  for GSocketFamilyEnum
        .enums
        .pairs
        .grep( *.key.contains('IPV') )
        .sort( *.key )
  {
    my $f = GSocketFamilyEnum( .value );
    my $s = $f == G_SOCKET_FAMILY_IPV4 ?? 4 !! 16;
    my $a = GIO::InetAddress.new($f, :any);


    ok  $a.is-any,                'InetAddress is ANY';
    is  $a.family,       $f,      "InetAddress belongs to { $f }";
    is  $a.native-size,  $s,      "InetAddress native size is { $s }";

    nok $a.is-loopback,           'InetAddress is NOT a loopback';
    nok $a.is-link-local,         'InetAddress is NOT link local';
    nok $a.is-site-local,         'InetAddress is NOT site local';
    nok $a.is-multicast,          'InetAddress is NOT a multicast addr';
    nok $a.is-mc-global,          'InetAddress is NOT MC Global';
    nok $a.is-mc-link-local,      'InetAddress is NOT MC Link Local';
    nok $a.is-mc-node-local,      'InetAddress is NOT MC Node Local';
    nok $a.is-mc-org-local,       'InetAddress is NOT MC Org Local';
    nok $a.is-mc-site-local,      'InetAddress is NOT MC Site Local';
  }
}

test-parse;
test-any;

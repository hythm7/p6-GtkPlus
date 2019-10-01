use v6.c;

use Test;

use GTK::Compat::Types;

use GTK::Compat::Roles::GFile;

use GIO::FileIcon;
use GIO::ThemedIcon;

use GIO::Roles::Icon;

plan 67;

sub compare-path-nodes ($uri, @a?) {
  my $l = GTK::Compat::Roles::GFile.new-for-uri($uri);
  my $i = GIO::FileIcon.new($l);

  is  +$i.file(:raw).p,
      +$l.GFile.p,
      'FileIcon and Location are the same';

  my $d = ~$i;
  if @a {
    ok  $*SPEC.splitdir($d) cmp @a,
        "Path nodes of a stringified GFileIcon match '{$uri}'";
  } else {
    is  $d,
        $uri,
        "Non-native path comparison matches '{$uri}'";
  }

  my $i2 = GIO::Roles::Icon.new-for-string($d);
  nok $ERROR,
      "No error occured when creating another GIcon for '{$d}'";

  ok  $i2.equal($i),
      'Newly created icon from URI matches previously created object';

  # .unref for $i2, $i, $l;
}

sub compareEmblem (&f) {
  use GTK::Compat::FileTypes;
  use GIO::Emblem;
  use GIO::EmblemedIcon;

  my $i = GIO::ThemedIcon.new('face-smirk');
  my $i2 = GIO::ThemedIcon.new('emblem-important');
  $i2.append-name('emblem-shared');

  my $uri = 'file::///some/path/somewhere.png';
  my $l = GTK::Compat::Roles::GFile.new-for-uri($uri);
  my $i3 = GIO::FileIcon.new($l);
  my $e1 = GIO::Emblem.new-with-origin($i2, G_EMBLEM_ORIGIN_DEVICE);
  my $e2 = GIO::Emblem.new-with-origin($i3, G_EMBLEM_ORIGIN_LIVEMETADATA);
  my $i4 = GIO::EmblemedIcon.new($i, $e1);
  $i4.add-emblem($e2);

  my $i5 = &f($i4);

  ok  $i4.equal($i5), 'Emblemed Icon and newly constructed Icon are equivalent';
  is  $e1.origin, G_EMBLEM_ORIGIN_DEVICE,
      'Emblem1 origin matches G_EMBLEM_ORIGIN_DEVICE';
  ok  +$i2.GIcon.p == +$e1.icon(:raw).p,
      "Icon2 and the value of Emblem1's icon property are the same";

  # .unref for $i, $e1, $e2, $i, $i2, $i3, $i4, $i5;
}

sub icon-to-string {
  compare-path-nodes(
    'file:///some/native/path/to/an/icon.png',
    <some native path to an icon.png>
  );

  compare-path-nodes(
    'file:///some/native/path/to/an/icon with spaces.png',
    «some native path to an "icon with spaces.png"»
  );

  compare-path-nodes(
    'sftp:///some/non-native/path/to/an/icon.png'
  );

  {
    my $i = GIO::ThemedIcon.new_with_default_fallbacks('some-icon-symbolic');
    $i.append-name('some-other-icon');

    is  ~$i, qq:to/MATCH/.chomp, 'Themed icon has appropriate fallbacks';
      . GThemedIcon some-icon-symbolic some-symbolic some-other-icon {''
      }some-other some some-icon some-other-icon-symbolic some-other-symbolic
      MATCH
  }

  {
    my $i = GIO::ThemedIcon.new('network-server');
    my $d = ~$i;

    is $d, 'network-server', 'Themed icon location stringifies properly';

    my $i2 = GIO::Roles::Icon.new-for-string($d);
    nok $ERROR, 'No error when creating GIO::Roles::Icon from string';

    ok  $i2.equal($i), 'ThemedIcon and duplicate are equivalent';
  }

  {
    my $i = GIO::ThemedIcon.new-with-default-fallbacks('network-server');
    my $d = ~$i;

    is $d,
       '. GThemedIcon network-server network network-server-symbolic network-symbolic',
       'ThemedIcon has approriate fallbacks for "network-server"';

    my $i2 = GIO::Roles::Icon.new-for-string($d);

    nok $ERROR, 'No error when creating GIO::Roles::Icon from string';

    ok  $i2.equal($i), 'ThemedIcon and duplicate are equivalent';
  }

  {
    my $i = GIO::Roles::Icon.new-for-string('network-server%');
    nok $ERROR, "No error when constructing Icon with URI 'network-server%'";

    my $i2 = GIO::ThemedIcon.new('network-server%');
    ok $i2.equal($i), 'Icon and ThemedIcon clone are equivalent';
  }

  {
    my $uri = '/path/to/somewhere.png';
    my $i = GIO::Roles::Icon.new-for-string($uri);
    nok $ERROR, "No error when constructing Icon with URI '{$uri}'";

    my $l = GTK::Compat::Roles::GFile.new-for-commandline-arg($uri);
    my $i2 = GIO::FileIcon.new($l);
    ok $i2.equal($i), 'Icon and FileIcon initialized from GFile, are equivalent';
  }

  {
    my $uri = '/path/to/somewhere with whitespace.png';
    my $i = GIO::Roles::Icon.new-for-string($uri);
    nok $ERROR, "No error when consturcting Icon with URI '{$uri}'";

    my $d = ~$i;
    ok  $*SPEC.splitdir($d) cmp «path to "somewhere with whitespace.png"»,
        'Path nodes for icon match properly.';

    my $l = GTK::Compat::Roles::GFile.new-for-commandline-arg($uri);
    my $i2 = GIO::FileIcon.new($l);
    ok $i2.equal($i), 'Icon and FileIcon from same URI, are equivalent';

    my $uri2 = $uri.subst(' ', '%20', :g);
    $l = GTK::Compat::Roles::GFile.new-for-commandline-arg($uri2);
    $i2 = GIO::FileIcon.new($l);
    nok $i.equal($i2), "Icon and FileIcon from URI {$uri2}, are equivalent";
  }

  {
    my $uri = "sftp:///path/to/somewhere.png";
    my $i = GIO::Roles::Icon.new-for-string($uri);
    nok $ERROR, "No error when consturcting Icon with URI '{$uri}'";

    my $d = ~$i;
    is  $uri, $d,
        "Stringified Icon matches URI '{$uri}'";

    my $l = GTK::Compat::Roles::GFile.new-for-commandline-arg($uri);
    my $i2 = GIO::FileIcon.new($l);
    ok $i2.equal($i), 'Icon and FileIcon from same URI, are equivalent';
  }

  # Test GIO::ThemedIcon.append-name
  for 'nework-server', 'icon name with whitespace', 'network-server-xyz' {
    my $i = GIO::ThemedIcon.new($_);
    $i.append-name('computer');

    my $d = ~$i;
    my $i2 = GIO::Roles::Icon.new-for-string($d);
    nok $ERROR, "No error when consturcting Icon with URI '{$_}'";
    ok $i.equal($i2), 'ThemeIcon and Icon from same URI, are equivalen';
  }

  compareEmblem(-> $a {
    my $d = ~$a;
    my $i5 = GIO::Roles::Icon.new-for-string($d);
    nok $ERROR, "No error when consturcting Icon with URI '{$d}'";

    $i5;
  });
}

sub icon-serialize {
  use GTK::Compat::Variant;

  {
    my $u = 'network-server%';
    my $d = GTK::Compat::Variant.new-string($u);
    my $i = GIO::Roles::Icon.deserialize($d.ref-sink);
    my $i2 = GIO::ThemedIcon.new($u);

    ok  $i.equal($i2),
        'Icon from variant and ThemedIcon from string are equivalent';
  }

  {
    my $u  = '/path/to/somewhere.png';
    my $d  = GTK::Compat::Variant.new-string($u);
    my $i  = GIO::Roles::Icon.deserialize($d.ref-sink);
    my $l  = GTK::Compat::Roles::GFile.new-for-commandline-arg($u);
    my $i2 = GIO::FileIcon.new($l);

    ok  $i.equal($i2),
        'Icon from variant and FileIcon from GFile are equivalent';
  }

  {
    my $u  = '/path/to/somewhere with whitespace.png';
    my $d  = GTK::Compat::Variant.new-string($u);
    my $i  = GIO::Roles::Icon.deserialize($d.ref-sink);
    my $l  = GTK::Compat::Roles::GFile.new-for-commandline-arg($u);
    my $i2 = GIO::FileIcon.new($l);

    ok  $i.equal($i2),
        'Icon from variant with spaces and FileIcon from GFile are equivalent';
    $i2.unref;

    my $u2 = $u.subst(' ', '%20', :g);
    my $l2 = GTK::Compat::Roles::GFile.new-for-commandline-arg($u2);
    $i2 = GIO::FileIcon.new($l2);

    nok $i.equal($i2),
        'Icon and FileIcon, using %20 instead of spaces, are not equivalent';
  }

  {
    my $u  = 'sftp:///path/to/somewhere.png';
    my $d  = GTK::Compat::Variant.new-string($u);
    my $i  = GIO::Roles::Icon.deserialize($d.ref-sink);
    my $l  = GTK::Compat::Roles::GFile.new-for-commandline-arg($u);
    my $i2 = GIO::FileIcon.new($l);

    ok  $i.equal($i2),
        "Icon from variant URI '{$u}' and FileIcon from GFile are equivalent";
  }

  for 'network-server',
      'icon name with whitespace',
      'network-server-xyz' -> $u
  {
    my $i = GIO::ThemedIcon.new($u);
    $i.append-name('compunter');

    my $d = $i.serialize;
    my $i2 = GIO::Roles::Icon.deserialize($d);
    ok  $i.equal($i2),
        "Icon and copy created from serialize/deserialize of '{$u}' are equivalent";
  }

  compareEmblem(-> $a {
    my $d = $a.serialize;
    my $i5 = GIO::Roles::Icon.deserialize($d);
    $i5;
  });

}

sub test-themed-icon {
  my $i = GIO::ThemedIcon.new('testicon');
  nok $i.use-default-fallbacks, 'Icon has no fallbacks';

  my @n = $i.names;

  is +@n, 2, 'Icon contains only 2 names';
  is @n[0],  'testicon', 'First icon is "testicon"';
  is @n[1],  'testicon-symbolic', 'Second name is "testicon-symbolic"';

  $i.prepend-name('first-symbolic');
  $i.append-name('last');
  @n = $i.names;
  is +@n, 6,  'Icon contains 6 names after append and prepend';
  is @n[0],   'first-symbolic',     'First name is "first-symbolic"';
  is @n[1],   'testicon',           'Second name is "testicon"';
  is @n[2],   'last',               'Third name is "last"';
  is @n[3],   'first',              'Fourth name is "first"';
  is @n[4],   'testicon-symbolic',  'Fifth name is "testicon-symbolic"';
  is @n[5],   'last-symbolic',      'Last name is "last-symbolic"';
  is $i.hash, 1812785139,           'Hash value of icon is correct';

  @n = <first-symbolic testicon last>;
  my $i2 = GIO::ThemedIcon.new-from-names(@n);
  ok $i.equal($i2), 'First Icon matches new Icon created from array';

  my $i3 = GIO::Roles::Icon.new-for-string(~$i2);
  ok  $i2.equal($i3),
      "Second Icon matches third icon created from Second's string representation";

  my $v = $i3.serialize;
  my $i4 = GIO::Roles::Icon.deserialize($v);
  ok  $i3.equal($i4),
      'Fourth icon created from serialize/deserialize of Third Icon matches';

  is  $i3.hash, $i4.hash, 'Hashes from Third and Fourth Icons are the same.';
}

icon-to-string;
icon-serialize;
test-themed-icon;

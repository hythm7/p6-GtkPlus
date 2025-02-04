#!/usr/bin/env perl6
use v6.c;

qx[ scripts/dependencies.pl6 ];

die 'Cannot find BuildList file in current directory.'
  unless 'BuildList'.IO.e;

my @buildlist = 'BuildList'.IO.open.slurp-rest.split(/\r?\n/).map( *.chomp );

sub MAIN( $rev = 'HEAD' ) {
  #chdir '/home/cbwood/Projects/p6-GtkPlus';
  mkdir '.touch' unless '.touch'.IO.d;
  my @files = qqx{git diff --name-only $rev}.chomp;
  @files = @files.split("\n").map({
    next if / ^ 't/' /;
    next unless / '.pm6' $/;
    my $a = S/ '.pm6' //;
    $a = ( $a .= split("\/") )[1..*].join('::');
    [ $_, $a, @buildlist.first(* eq $a, :k) // Inf ];
  });

  for @files.grep({ .[2] !~~ Inf }).sort( *[2] ) {
    unless .[2] {
      say "{ $_[0] } is not in the BuildList.";
      next;
    }

    next if $_[1] ~~ /^ 'BuilderWidgets' | 'GTK::Builder::' /;
    # Temporary cheat.
    next if $_[0].ends-with('GFile.pm6');

    my $rel = $_[0].IO.dirname.split('/')[1..*].join('/');
    mkdir ".touch/{ $rel }";
    my $tf = ".touch/{ $rel }/{ $_[0].IO.basename }";
    next unless ! $tf.IO.e || $_[0].IO.modified > $tf.IO.modified;

    say "===== $_[1] =====";
    my $proc = Proc::Async.new(
      './p6gtkexec',
      '-e',
      'use '~ $_[1]
    );

    $proc.stdout.tap(-> $o { $o.say; });
    await $proc.start;
    qqx{touch $tf};
  }
}

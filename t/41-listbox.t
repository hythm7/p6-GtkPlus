use v6.c;

use lib <t .>;

use DateTime::Format;
use GTK::Compat::Types;
use GTK::Raw::Types;
use GTK::Application;
use listbox_test;

use NativeCall;

my (%messages, $avatar_other);

sub sort-func($a, $b) {
  %messages{$a}<data><time> <=> %messages{$b}<data><time>
};

sub row-expand(GtkListBoxRow() $r) {
  my $revealer = %messages{$r}<widgets>.details_revealer;
  $revealer.reveal_child .= not;
  %messages{$r}<widgets>.expand_button.label = $revealer.reveal_child ??
    'Hide' !! 'Expand';
}

sub get-new-row-ui {
  my regex tcword { <[A..Z]><[a..z]>+ };
  my $ui-row = $ui-template;
  state $c = 1;

  $ui-row ~~ s:g!
    '<template class="'
    (\w+)
    '"' \s* 'parent="'
    (\w+)
    '"'
  !<object class="$1" id="{
      $0.Str.trim ~~ / <tcword>+ /;
      $/<tcword>[1..*].map( *.lc ).join('_') ~ '_r%%%'
  }"!;

  $ui-row ~~ s:g!'</template>'!</object>!;
  $ui-row ~~ s:g/'%%%'/{ $c }/;
  ($ui-row, $c++);
}

sub new_row {
  ## GTK::Builder support for UI fragments is not yet working, correctly.
  ## So this has been put off until it can be determined that it is
  ## possible without writing a derivative widget class.
  # ---------------------------------------------------------------
  # Needs GTK::Builder support, so test will need to be in the post 40s
  # state $b = GTK::Builder.new;
  # my ($ui, $c) = get-new-row-ui();
  # my @rid = (
  #   "menu1-r{$c}",
  #   "message_row_r{$c}",
  #   "expand_button-r{$c}"
  # );

  # Proper way to handle a GError. Need a better way for client code to
  # Access this.

  my %b = buildListRow;
  %b<row> := %b<template0>;
  %b<reshare-button>.clicked.tap({
    %messages{%b<row>}<data>.n_reshares++;
    row_update(%b<row>);
  });
  %b<expand_button>.clicked.tap({ row-expand(%b<listrow>) });
  %b<favorite-button>.clicked.tap({
    %messages{%b<row>}<data>.n_favorites++;
    row_update(%b<row>);
  });
  %b<listrow>.state-flags-changed.tap(-> $, $pf {
    %b<extra_buttons_box>.visible = %b<row>.state_flags +&
      (GTK_STATE_FLAG_PRELIGHT +| GTK_STATE_FLAG_SELECTED);
    %b<listrow>.state_flags = $pf;
  });
  %b;
}

sub new_message($m) {
  my @msg = $m.split('|');
  my %msg;
  my $i = 0;

  %msg<id>          = @msg[$i++];
  %msg<sender_name> = @msg[$i++];
  %msg<sender_nick> = @msg[$i++];
  %msg<message>     = @msg[$i++];
  %msg<time>        = @msg[$i++];
  with @msg[$i] {
    %msg<reply_to>    = @msg[$i++];
    with @msg[$i] {
      %msg<resent_by> = @msg[$i++];
      with @msg[$i] {
        %msg<n_favorites> = @msg[$i++];
        %msg<reshares> = @msg[$i] with @msg[$i];
      }
    }
  }
  %msg;
}

sub row_update($r) {
  my $d = %messages{$r.listboxrow}<data>;
  my $w = %messages{$r.listboxrow}<widgets>;

  $w<source_name>.text          = $d.sender_name;
  $w<source_nick>.text          = $d.sender_nick;
  $w<content_label>.text        = $d.message;
  $w<short_time_label>.text     = strftime('%e %b %y', DateTime($d.time));
  $w<detailed_time_label>.text  = strftime('%X - %e %b %Y', DateTime($d.time));

  $w<n_favorites_label>.visible = $d.n_favorites.so;
  $w<n_favorites_label>.markup  = sprintf('<b>%d</b>\nFavorites', $d.n_favorites);
  $w<n_reshares_label>.visible  = $d.n_reshares.so;
  $w<n_reshares_label>.markup   = sprintf('<b>%d</b>\nReshares', $d.n_reshares);
  $w<resent_box>.visible        = $d.resent_by.chars.so;
  $w<resent_box>.label          = $d.resent_by if $d.resent_by.chars.so;

  if $d.sender_nick eq '@GTKtoolkit' {
    $w<avatar_image>.set_from_icon_name('gtk3-demo');
    $w<avatar_image>.icon_size = GTK_ICON_SIZE_LARGE_TOOLBAR;
  } else {
    $w<avatar_image>.set_from_pixbuf($avatar_other);
  }
}

my $a = GTK::Application.new( title => 'org.genex.listbox' );

$a.activate.tap({
  my $avatar_pixbuf = load_at_scale("/listbox/apple-red.png", 32, 32, 0);
  my $vbox = GTK::Box.new-vbox(12);
  my $label = GTK::Label.new('Messages from Gtk+ and Friends');
  my $scrolled = GTK::ScrolledWindow.new;
  my $listbox = GTK::ListBox.new;

  $a.window.title = 'List Box';
  $a.window.set_default_size(400, 600);
  $a.window.add($vbox);

  $scrolled.set_policy(GTK_POLICY_NEVER, GTK_POLICY_AUTOMATIC);
  $scrolled.vexpand = True;
  $scrolled.add($listbox);

  $vbox.pack_start($label);
  $vbox.pack_start($scrolled);

  $a.window.show_all;

  # Fix when able
  # $listbox.set_sort_func(&sort-func);
  $listbox.activate_on_single_click = False;
  $listbox.row-activated.tap( -> $r { row-expand($r) } );

  my $msg_file = 'messages.txt';
  $msg_file = 't/messages.txt' unless $msg_file.IO.e;
  for $msg_file.IO.open.slurp.lines {
    say "LINE: $_";

    my ($message, $row) = (new_message($_), new_row);
    %messages{$row<row>.listboxrow}<widgets> = $row;
    %messages{$row<row>.listboxrow}<data> = $message;
    $listbox.add($row);
    $row.show;
  }

});

$a.run;

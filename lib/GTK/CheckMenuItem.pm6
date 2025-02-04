use v6.c;

use Method::Also;
use NativeCall;

use GTK::Compat::Types;
use GTK::Raw::CheckMenuItem;
use GTK::Raw::Types;

use GTK::Raw::Utils;

use GTK::MenuItem;

our subset CheckMenuItemAncestry is export
  where GtkCheckMenuItem | MenuItemAncestry;

class GTK::CheckMenuItem is GTK::MenuItem {
  has GtkCheckMenuItem $!cmi is implementor;

  method bless(*%attrinit) {
    my $o = self.CREATE.BUILDALL(Empty, %attrinit);
    $o.setType($o.^name);
    $o;
  }

  submethod BUILD(:$checkmenuitem) {
    my $to-parent;
    given $checkmenuitem {
      when CheckMenuItemAncestry {
        self.setCheckMenuItem($checkmenuitem);
      }
      when GTK::CheckMenuItem {
      }
      default {
      }
    }
  }

  method GTK::Raw::Types::GtkCheckMenuItem
    is also<CheckMenuItem>
  { $!cmi }

  method setCheckMenuItem(CheckMenuItemAncestry $checkmenuitem) {
    my $to-parent;
    $!cmi = do given $checkmenuitem {
      when GtkCheckMenuItem {
        $to-parent = nativecast(GtkMenuItem, $_);
        $_;
      }
      when MenuItemAncestry {
        $to-parent = $_;
        nativecast(GtkCheckMenuItem, $_);
      }
    }
    self.setMenuItem($to-parent);
  }

  multi method new (CheckMenuItemAncestry $checkmenuitem) {
    my $o = self.bless(:$checkmenuitem);
    $o.upref;
    $o;
  }
  multi method new {
    my $checkmenuitem = gtk_check_menu_item_new();
    self.bless(:$checkmenuitem);
  }
  multi method new(Str() :$label, Str() :$mnemonic) {
    die "Use ONE of \$label or \$mnemonic when using { ::?CLASS.^name }.new()"
      unless $label.defined ^^ $mnemonic.defined;

    my $checkmenuitem = do {
      with $label    { gtk_check_menu_item_new_with_label($_);    }
      with $mnemonic { gtk_check_menu_item_new_with_mnemonic($_); }
    };
    self.bless(:$checkmenuitem);
  }
  multi method new (
    Str() $label,
    :$clicked,
    :$toggled,
  ) {
    my $checkmenuitem = gtk_check_menu_item_new_with_label($label);
    my $o = self.bless(:$checkmenuitem);
    $o.toggled.tap({ $clicked() }) with $clicked;
    $o.toggled.tap({ $toggled() }) with $toggled;
    $o;
  }

  method new_with_label(Str $label) is also<new-with-label> {
    my $checkmenuitem = gtk_check_menu_item_new_with_label($label);
    self.bless(:$checkmenuitem);
  }

  method new_with_mnemonic(Str $label) is also<new-with-mnemonic> {
    my $checkmenuitem = gtk_check_menu_item_new_with_mnemonic($label);
    self.bless(:$checkmenuitem);
  }

  # ↓↓↓↓ SIGNALS ↓↓↓↓

  # Is originally:
  # GtkCheckMenuItem, gpointer --> void
  method toggled is also<clicked> {
    self.connect($!cmi, 'toggled');
  }
  # ↑↑↑↑ SIGNALS ↑↑↑↑

  # ↓↓↓↓ ATTRIBUTES ↓↓↓↓
  method active is rw {
    Proxy.new(
      FETCH => -> $ {
        so gtk_check_menu_item_get_active($!cmi);
      },
      STORE => -> $, Int() $is_active is copy {
        my $ia = resolve-bool($is_active);
        gtk_check_menu_item_set_active($!cmi, $ia);
      }
    );
  }

  method draw_as_radio is rw is also<draw-as-radio> {
    Proxy.new(
      FETCH => sub ($) {
        so gtk_check_menu_item_get_draw_as_radio($!cmi);
      },
      STORE => sub ($, Int() $draw_as_radio is copy) {
        my $dar = resolve-bool($draw_as_radio);
        gtk_check_menu_item_set_draw_as_radio($!cmi, $dar);
      }
    );
  }

  method inconsistent is rw {
    Proxy.new(
      FETCH => sub ($) {
        so gtk_check_menu_item_get_inconsistent($!cmi);
      },
      STORE => sub ($, Int() $setting is copy) {
        my $s = resolve-bool($setting);
        gtk_check_menu_item_set_inconsistent($!cmi, $s);
      }
    );
  }
  # ↑↑↑↑ ATTRIBUTES ↑↑↑↑

  # ↓↓↓↓ METHODS ↓↓↓↓
  method get_type is also<get-type> {
    state ($n, $t);
    GTK::Widget.unstable_get_type( &gtk_check_menu_item_get_type, $n, $t );
  }

  # Alias to emit_toggled for C-ppl
  method emit-toggled is also<emit_toggled> {
    gtk_check_menu_item_toggled($!cmi);
  }
  # ↑↑↑↑ METHODS ↑↑↑↑

}

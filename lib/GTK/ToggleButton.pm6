use v6.c;

use Method::Also;
use NativeCall;

use GTK::Compat::Types;
use GTK::Raw::ToggleButton;
use GTK::Raw::Types;

use GTK::Button;

our subset ToggleButtonAncestry is export 
  where GtkToggleButton | ButtonAncestry;

class GTK::ToggleButton is GTK::Button {
  has GtkToggleButton $!tb is implementor;

  method bless(*%attrinit) {
    my $o = self.CREATE.BUILDALL(Empty, %attrinit);
    $o.setType('GTK::ToggleButton');
    $o;
  }

  submethod BUILD(:$togglebutton) {
    do given $togglebutton {
      when ToggleButtonAncestry {
        self.setToggleButton($togglebutton);
      }
      when GTK::ToggleButton {
      }
      default {
      }
    }
  }
  
  method GTK::Raw::Types::GtkToggleButton is also<ToggleButton> { $!tb }
  
  method setToggleButton(ToggleButtonAncestry $togglebutton) {
    self.IS-PROTECTED;
    
    my $to-parent;
    $!tb = do given $togglebutton {
      when GtkToggleButton {
        $to-parent = nativecast(GtkButton, $_);
        $_;
      }
      when ButtonAncestry {
        $to-parent = $_;
        nativecast(GtkToggleButton, $_);
      }
    }
    self.setButton($to-parent);
  }

  multi method new (ToggleButtonAncestry $togglebutton) {
    my $o = self.bless(:$togglebutton);
    $o.upref;
    $o;
  }
  multi method new {
    my $togglebutton = gtk_toggle_button_new();
    self.bless(:$togglebutton);
  }

  method new_with_label (Str $label) is also<new-with-label> {
    my $togglebutton = gtk_toggle_button_new_with_label($label);
    self.bless(:$togglebutton);
  }

  method new_with_mnemonic (Str $label) is also<new-with-mnemonic> {
    my $togglebutton = gtk_toggle_button_new_with_mnemonic($label);
    self.bless(:$togglebutton);
  }

  # ↓↓↓↓ SIGNALS ↓↓↓↓
  # Is originally:
  # GtkToggleButton, gpointer --> void
  method toggled {
    self.connect($!tb, 'toggled');
  }
  # ↑↑↑↑ SIGNALS ↑↑↑↑

  # ↓↓↓↓ ATTRIBUTES ↓↓↓↓
  method active is rw {
    Proxy.new(
      FETCH => sub ($) {
        so gtk_toggle_button_get_active($!tb);
      },
      STORE => sub ($, Int() $is_active is copy) {
        my gboolean $ia = self.RESOLVE-BOOL($is_active);
        gtk_toggle_button_set_active($!tb, $ia);
      }
    );
  }

  method inconsistent is rw {
    Proxy.new(
      FETCH => sub ($) {
        so gtk_toggle_button_get_inconsistent($!tb);
      },
      STORE => sub ($, Int() $setting is copy) {
        my gboolean $s = self.RESOLVE-BOOL($setting);
        gtk_toggle_button_set_inconsistent($!tb, $s);
      }
    );
  }

  method mode is rw {
    Proxy.new(
      FETCH => sub ($) {
        so gtk_toggle_button_get_mode($!tb);
      },
      STORE => sub ($, $draw_indicator is copy) {
        my gboolean $di = self.RESOLVE-BOOL($draw_indicator);
        gtk_toggle_button_set_mode($!tb, $di);
      }
    );
  }
  # ↑↑↑↑ ATTRIBUTES ↑↑↑↑

  # ↓↓↓↓ METHODS ↓↓↓↓
  method get_type is also<get-type> {
    state ($n, $t);
    GTK::Widget.unstable_get_type( &gtk_toggle_button_get_type, $n, $t );
  }

  method emit-toggled is also<emit_toggled> {
    gtk_toggle_button_toggled($!tb);
  }
  # ↑↑↑↑ METHODS ↑↑↑↑

}

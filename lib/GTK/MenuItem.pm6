use v6.c;

use Method::Also;
use NativeCall;

use GTK::Compat::Types;
use GTK::Raw::MenuItem;
use GTK::Raw::Types;

use GTK::Roles::Actionable;

use GTK::Bin;
use GTK::Widget;

our subset MenuItemAncestry is export
  where GtkMenuItem | GtkActionable | BinAncestry;

class GTK::MenuItem is GTK::Bin {
  also does GTK::Roles::Actionable;

  has GtkMenuItem $!mi is implementor;

  method bless(*%attrinit) {
    my $o = self.CREATE.BUILDALL(Empty, %attrinit);
    $o.setType($o.^name);
    $o;
  }

  submethod BUILD (
    :$menuitem,
    :$submenu,
    :$clicked,
    :$activate,
    :$right
  ) {
    given $menuitem {
      when MenuItemAncestry {
        self.setMenuItem($menuitem);
      }
      when GTK::MenuItem {
      }
      default {
      }
    }

    if $submenu.defined {
      # Error checking for a GTK::Menu without a circular dependency?
      # Otherwise, GtkWidget is the best we can do.
      self.submenu = $submenu if $submenu ~~ (GtkWidget, GTK::Widget).any;
    }

    # $clicked and $activate do the same thing.
    # DON'T GO OVERBOARD.
    self.activate.tap({ $clicked();  }) with $clicked;
    self.activate.tap({ $activate(); }) with $activate;
    self.right_justified = True if $right;
  }

  method setMenuItem($menuitem) {
    my $to-parent;
    $!mi = do given $menuitem {
      when GtkMenuItem {
        $to-parent = nativecast(GtkBin, $_);
        $_;
      }

      when GtkActionable {
        $!action = $_;                            # GTK::Roles::Actionable
        $to-parent = nativecast(GtkBin, $_);
        nativecast(GtkMenuItem, $_);
      }

      default {
        $to-parent = $_;
        nativecast(GtkMenuItem, $_);
      }

    }
    $!action //= nativecast(GtkActionable, $!mi); # GTK::Roles::Actionable
    self.setBin($to-parent);
  }

  multi method new (MenuItemAncestry $menuitem) {
    my $o = self.bless(:$menuitem);
    $o.upref;
    $o;
  }
  multi method new {
    my $menuitem = gtk_menu_item_new();
    self.bless(:$menuitem);
  }

  multi method new(
    Str() $label,
    :$clicked,
    :$activate,
    :$right,
    :$mnemonic,
    :$submenu
  ) {
    my $menuitem = $mnemonic.so ??
      gtk_menu_item_new_with_mnemonic($label)
      !!
      gtk_menu_item_new_with_label($label);

    self.bless(
      :$menuitem,
      :$submenu,
      :$activate,
      :$clicked,
      :$right
    );
  }
  # multi method new(
  #   Str() :$label,
  #   Str() :$mnemonic
  # ) {
  #   die "Use ONE of \$label or \$mnemonic when using { ::?CLASS.^name }.new()"
  #     unless $label.defined ^^ $mnemonic.defined;
  #
  #   my $menuitem = do {
  #     with $label    { gtk_menu_item_new_with_label($_);    }
  #     with $mnemonic { gtk_menu_item_new_with_mnemonic($_); }
  #   };
  #   self.bless(:$menuitem);
  # }

  method new_with_label (Str() $label) is also<new-with-label> {
    my $menuitem = gtk_menu_item_new_with_label($label);
    self.bless(:$menuitem);
  }

  method new_with_mnemonic (Str() $label) is also<new-with-mnemonic> {
    my $menuitem = gtk_menu_item_new_with_mnemonic($label);
    self.bless(:$menuitem);
  }

  method GTK::Raw::Types::GtkMenuItem is also<MenuItem> { $!mi }

  # ↓↓↓↓ SIGNALS ↓↓↓↓

  # Is originally:
  # GtkMenuItem, gpointer --> void
  method activate {
    self.connect($!mi, 'activate');
  }

  # Is originally:
  # GtkMenuItem, gpointer --> void
  method activate-item is also<activate_item> {
    self.connect($!mi, 'activate-item');
  }

  # Is originally:
  # GtkMenuItem, gpointer --> void
  method deselect {
    self.connect($!mi, 'deselect');
  }

  # Is originally:
  # GtkMenuItem, gpointer --> void
  method select {
    self.connect($!mi, 'select');
  }

  # Is originally:
  # GtkMenuItem, gint, gpointer --> void
  method toggle-size-allocate is also<toggle_size_allocate> {
    self.connect-int($!mi, 'toggle-size-allocate');
  }

  # Is originally:
  # GtkMenuItem, gpointer, gpointer --> void
  method toggle-size-request is also<toggle_size_request> {
    self.connect-pointer($!mi, 'toggle-size-request');
  }
  # ↑↑↑↑ SIGNALS ↑↑↑↑

  # ↓↓↓↓ ATTRIBUTES ↓↓↓↓
  method accel_path is rw is also<accel-path> {
    Proxy.new(
      FETCH => sub ($) {
        gtk_menu_item_get_accel_path($!mi);
      },
      STORE => sub ($, Str() $accel_path is copy) {
        gtk_menu_item_set_accel_path($!mi, $accel_path);
      }
    );
  }

  method label is rw {
    Proxy.new(
      FETCH => sub ($) {
        gtk_menu_item_get_label($!mi);
      },
      STORE => sub ($, Str() $label is copy) {
        gtk_menu_item_set_label($!mi, $label);
      }
    );
  }

  method reserve_indicator is rw is also<reserve-indicator> {
    Proxy.new(
      FETCH => sub ($) {
        so gtk_menu_item_get_reserve_indicator($!mi);
      },
      STORE => sub ($, Int() $reserve is copy) {
        my $r = self.RESOLVE-BOOL($reserve);
        gtk_menu_item_set_reserve_indicator($!mi, $r);
      }
    );
  }

  method right_justified is DEPRECATED is rw is also<right-justified> {
    Proxy.new(
      FETCH => sub ($) {
        so gtk_menu_item_get_right_justified($!mi);
      },
      STORE => sub ($, Int() $right_justified is copy) {
        my gboolean $rj = self.RESOLVE-BOOL($right_justified);
        gtk_menu_item_set_right_justified($!mi, $rj);
      }
    );
  }

  method submenu is rw {
    # We can't bring in MenuShellAncestry without causing all kinds of bad, 
    # so we reproduce it here. In a set of bad options, it's the one that's 
    # the least bad.
    my subset WidgetOrObject of Mu 
      where GTK::Widget | GtkWidget;
      
    Proxy.new(
      FETCH => sub ($) {
        GTK::Widget.new( gtk_menu_item_get_submenu($!mi) );
      },
      STORE => sub ($, WidgetOrObject $submenu is copy) {
        self.set-end($submenu);
        $submenu .= Widget if $submenu ~~ GTK::Widget;
        gtk_menu_item_set_submenu($!mi, $submenu);
      }
    );
  }

  method use_underline is rw is also<use-underline> {
    Proxy.new(
      FETCH => sub ($) {
        so gtk_menu_item_get_use_underline($!mi);
      },
      STORE => sub ($, Int() $setting is copy) {
        my gboolean $s = self.RESOLVE-BOOL($setting);
        gtk_menu_item_set_use_underline($!mi, $s);
      }
    );
  }
  # ↑↑↑↑ ATTRIBUTES ↑↑↑↑

  # ↓↓↓↓ METHODS ↓↓↓↓
  method emit-activate is also<emit_activate> {
    gtk_menu_item_activate($!mi);
  }

  method emit-deselect is also<emit_deselect> {
    gtk_menu_item_deselect($!mi);
  }

  method emit-select is also<emit_select> {
    gtk_menu_item_select($!mi);
  }

  method get_type is also<get-type> {
    state ($n, $t);
    GTK::Widget.unstable_get_type( &gtk_menu_item_get_type, $n, $t );
  }

  method emit_toggle_size_allocate (Int() $allocation)
    is also<emit-toggle-size-allocate>
  {
    my gint $a = self.RESOLVE-INT($allocation);
    gtk_menu_item_toggle_size_allocate($!mi, $a);
  }

  method emit_toggle_size_request (Int() $requisition)
    is also<emit-toggle-size-request>
  {
    my gint $r = self.RESOLVE-INT($requisition);
    gtk_menu_item_toggle_size_request($!mi, $r);
  }
  # ↑↑↑↑ METHODS ↑↑↑↑

}

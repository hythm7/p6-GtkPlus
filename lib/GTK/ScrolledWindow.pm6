use v6.c;

use NativeCall;

use GTK::Compat::Types;
use GTK::Raw::ScrolledWindow;
use GTK::Raw::Types;

use GTK::Adjustment;
use GTK::Bin;

class GTK::ScrolledWindow is GTK::Bin {
  has GtkScrolledWindow $!sw;

  method bless(*%attrinit) {
    use nqp;
    my $o = nqp::create(self).BUILDALL(Empty, %attrinit);
    $o.setType('GTK::ScrolledWindow');
    $o;
  }

  submethod BUILD(:$scrolled) {
    given $scrolled {
      when GtkScrolledWindow | GtkWidget {
        self.setScrolledWindow($scrolled);
      }
      when GTK::ScrolledWindow {
      }
      default {
      }
    }
  }

  multi method new (
    GtkAdjustment() $hadjustment,
    GtkAdjustment() $vadjustment
  ) {
    my $scrolled = gtk_scrolled_window_new($hadjustment, $vadjustment);
    self.blessed(:$scrolled);
  }
  multi method new (GtkWidget $scrolled) {
    self.bless(:$scrolled);
  }

  method setScrolledWindow($scrolled) {
    my $to-parent;
    given $scrolled {
      when GtkScrolledWindow | GtkWidget {
        $!sw = do {
          when GtkWidget {
            $to-parent = $_;
            nativecast(GtkScrolledWindow, $_);
          }
          when GtkScrolledWindow {
            $to-parent = nativecast(GtkBin, $_);
            $_;
          }
        }
        self.setParent($to-parent);
      }
    }
  }

  # ↓↓↓↓ SIGNALS ↓↓↓↓

  # Is originally:
  # GtkScrolledWindow, GtkPositionType, gpointer --> void
  method edge-overshot {
    self.connect($!sw, 'edge-overshot');
  }

  # Is originally:
  # GtkScrolledWindow, GtkPositionType, gpointer --> void
  method edge-reached {
    self.connect($!sw, 'edge-reached');
  }

  # Is originally:
  # GtkScrolledWindow, GtkDirectionType, gpointer --> void
  method move-focus-out {
    self.connect($!sw, 'move-focus-out');
  }

  # Is originally:
  # GtkScrolledWindow, GtkScrollType, gboolean, gpointer --> gboolean
  method scroll-child {
    self.connect($!sw, 'scroll-child');
  }

  # ↑↑↑↑ SIGNALS ↑↑↑↑

  # ↓↓↓↓ ATTRIBUTES ↓↓↓↓
  method capture_button_press is rw {
    Proxy.new(
      FETCH => sub ($) {
        gtk_scrolled_window_get_capture_button_press($!sw);
      },
      STORE => sub ($, Int() $capture_button_press is copy) {
        my gboolean  $cbp = self.RESOLVE-BOOL($capture_button_press);
        gtk_scrolled_window_set_capture_button_press($!sw, $cbp);
      }
    );
  }

  method hadjustment is rw {
    Proxy.new(
      FETCH => sub ($) {
        GTK::Adjustment.new(
          gtk_scrolled_window_get_hadjustment($!sw)
        );
      },
      STORE => sub ($, GtkAdjustment() $hadjustment is copy) {
        gtk_scrolled_window_set_hadjustment($!sw, $hadjustment);
      }
    );
  }

  method kinetic_scrolling is rw {
    Proxy.new(
      FETCH => sub ($) {
        so gtk_scrolled_window_get_kinetic_scrolling($!sw);
      },
      STORE => sub ($, Int() $kinetic_scrolling is copy) {
        my gboolean $ks = self.RESOLVE-BOOL($kinetic_scrolling);
        gtk_scrolled_window_set_kinetic_scrolling($!sw, $ks);
      }
    );
  }

  method max_content_height is rw {
    Proxy.new(
      FETCH => sub ($) {
        gtk_scrolled_window_get_max_content_height($!sw);
      },
      STORE => sub ($, Int() $height is copy) {
        my $h = self.RESOLVE-INT($height);
        gtk_scrolled_window_set_max_content_height($!sw, $height);
      }
    );
  }

  method max_content_width is rw {
    Proxy.new(
      FETCH => sub ($) {
        gtk_scrolled_window_get_max_content_width($!sw);
      },
      STORE => sub ($, Int() $width is copy) {
        my gint $w = self.RESOLVE-INT($width);
        gtk_scrolled_window_set_max_content_width($!sw, $w);
      }
    );
  }

  method min_content_height is rw {
    Proxy.new(
      FETCH => sub ($) {
        gtk_scrolled_window_get_min_content_height($!sw);
      },
      STORE => sub ($, Int() $height is copy) {
        my gint $h = self.RESOLVE-INT($height);
        gtk_scrolled_window_set_min_content_height($!sw, $h);
      }
    );
  }

  method min_content_width is rw {
    Proxy.new(
      FETCH => sub ($) {
        gtk_scrolled_window_get_min_content_width($!sw);
      },
      STORE => sub ($, Int() $width is copy) {
        my gint $w = self.RESOLVE-INT($width);
        gtk_scrolled_window_set_min_content_width($!sw, $w);
      }
    );
  }

  method overlay_scrolling is rw {
    Proxy.new(
      FETCH => sub ($) {
        so gtk_scrolled_window_get_overlay_scrolling($!sw);
      },
      STORE => sub ($, Int() $overlay_scrolling is copy) {
        my $os = self.RESOLVE-BOOL($overlay_scrolling);
        gtk_scrolled_window_set_overlay_scrolling($!sw, $os);
      }
    );
  }

  method propagate_natural_height is rw {
    Proxy.new(
      FETCH => sub ($) {
        so gtk_scrolled_window_get_propagate_natural_height($!sw);
      },
      STORE => sub ($, Int() $propagate is copy) {
        my gboolean $p = self.RESOLVE-BOOL($propagate);
        gtk_scrolled_window_set_propagate_natural_height($!sw, $p);
      }
    );
  }

  method propagate_natural_width is rw {
    Proxy.new(
      FETCH => sub ($) {
        so gtk_scrolled_window_get_propagate_natural_width($!sw);
      },
      STORE => sub ($, Int() $propagate is copy) {
        my gboolean $p = self.RESOLVE-BOOL($propagate);
        gtk_scrolled_window_set_propagate_natural_width($!sw, $p);
      }
    );
  }

  method shadow_type is rw {
    Proxy.new(
      FETCH => sub ($) {
        GtkShadowType( gtk_scrolled_window_get_shadow_type($!sw) );
      },
      STORE => sub ($, $type is copy) {
        my uint32 $t = self.RESOLVE-UINT($type);
        gtk_scrolled_window_set_shadow_type($!sw, $t);
      }
    );
  }

  method vadjustment is rw {
    Proxy.new(
      FETCH => sub ($) {
        GTK::Adjustment.new(
          gtk_scrolled_window_get_vadjustment($!sw)
        );
      },
      STORE => sub ($, GtkAdjustment() $vadjustment is copy) {
        gtk_scrolled_window_set_vadjustment($!sw, $vadjustment);
      }
    );
  }
  # ↑↑↑↑ ATTRIBUTES ↑↑↑↑

  # ↓↓↓↓ METHODS ↓↓↓↓
  method add_with_viewport (GtkWidget() $child) {
    gtk_scrolled_window_add_with_viewport($!sw, $child);
  }

  method get_hscrollbar {
    gtk_scrolled_window_get_hscrollbar($!sw);
  }

  method get_placement {
    GtkCornerType( gtk_scrolled_window_get_placement($!sw) );
  }

  multi method get_policy (
    Int() $hscrollbar_policy is rw,     # GtkPolicyType
    Int() $vscrollbar_policy is rw      # GtkPolicyType
  ) {
    my @u = ($hscrollbar_policy, $vscrollbar_policy);
    my uint32 ($hp, $vp) = self.RESOLVE-UINT(@u);
    my $rc = gtk_scrolled_window_get_policy($!sw, $hp, $vp);
    ($hscrollbar_policy, $vscrollbar_policy) = ($hp, $vp);
    $rc;
  }
  multi method get_policy {
    my ($hp, $vp);
    samewith($hp, $vp);
    ($hp, $vp);
  }

  method get_type {
    gtk_scrolled_window_get_type();
  }

  method get_vscrollbar {
    gtk_scrolled_window_get_vscrollbar($!sw);
  }

  method set_policy (Int() $hscrollbar_policy, Int() $vscrollbar_policy) {
    my @u = ($hscrollbar_policy, $vscrollbar_policy);
    my uint32 ($hp, $vp) = self.RESOLVE-UINT(@u);
    gtk_scrolled_window_set_policy($!sw, $hp, $vp);
  }

  method unset_placement {
    gtk_scrolled_window_unset_placement($!sw);
  }
  # ↑↑↑↑ METHODS ↑↑↑↑

}

use v6.c;

use NativeCall;

use GTK::Compat::Types;
use GTK::Raw::SearchBar;
use GTK::Raw::Types;

use GTK::Bin;

class GTK::SearchBar is GTK::Bin {
  has GtkSearchBar $!sb;

  method bless(*%attrinit) {
    use nqp;
    my $o = nqp::create(self).BUILDALL(Empty, %attrinit);
    $o.setType('GTK::SearchBar');
    $o;
  }

  submethod BUILD(:$searchbar) {
    my $to-parent;
    given $searchbar {
      when GtkSearchBar | GtkWidget {
        $!sb = do {
          when GtkWidget {
            $to-parent = $_;
            nativecast(GtkSearchBar, $_);
          }
          when GtkSearchBar {
            $to-parent = nativecast(GtkBin, $_);
            $_;
          }
        }
        self.setBin($to-parent);
      }
      when GTK::SearchBar {
      }
      default {
      }
    }
  }

  multi method new {
    my $searchbar = gtk_search_bar_new();
    self.bless(:$searchbar);
  }

  multi method new (GtkWidget $searchbar) {
    self.bless(:$searchbar);
  }

  # ↓↓↓↓ SIGNALS ↓↓↓↓
  # ↑↑↑↑ SIGNALS ↑↑↑↑

  # ↓↓↓↓ ATTRIBUTES ↓↓↓↓
  method search_mode is rw {
    Proxy.new(
      FETCH => sub ($) {
        so gtk_search_bar_get_search_mode($!sb);
      },
      STORE => sub ($, Int() $search_mode is copy) {
        my gboolean $sm = self.RESOLVE-BOOL($search_mode);
        gtk_search_bar_set_search_mode($!sb, $sm);
      }
    );
  }

  method show_close_button is rw {
    Proxy.new(
      FETCH => sub ($) {
        so gtk_search_bar_get_show_close_button($!sb);
      },
      STORE => sub ($, Int() $visible is copy) {
        my gboolean $v = self.RESOLVE-BOOL($visible);
        gtk_search_bar_set_show_close_button($!sb, $v);
      }
    );
  }
  # ↑↑↑↑ ATTRIBUTES ↑↑↑↑

  # ↓↓↓↓ METHODS ↓↓↓↓
  method connect_entry (GtkEntry() $entry) {
    gtk_search_bar_connect_entry($!sb, $entry);
  }

  method get_type {
    gtk_search_bar_get_type();
  }

  method handle_event (GdkEvent $event) {
    gtk_search_bar_handle_event($!sb, $event);
  }
  # ↑↑↑↑ METHODS ↑↑↑↑

}

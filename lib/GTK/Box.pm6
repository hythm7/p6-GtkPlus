use v6.c;

use GTK::Raw::Box;
use GTK::Raw::Types;
use GTK::Container;

class GTK::Box is GTK::Container {
  also does GTK::Roles::Signals;

  has $!b;

  submethod BUILD(:$box) {
    $!b = $box;
  }

  method new (GtkOrientation $orientation, gint $spacing){
    my $box = gtk_box_new($orientation, $spacing);
    self.bless(:$box, :container($box), :widget($box));
  }

  method baseline_position is rw {
    Proxy.new(
      FETCH => sub ($) {
        gtk_box_get_baseline_position($!b);
      },
      STORE => sub ($, $position is copy) {
        gtk_box_set_baseline_position($!b, $position);
      }
    );
  }

  method center_widget is rw {
    Proxy.new(
      FETCH => sub ($) {
        gtk_box_get_center_widget($!b);
      },
      STORE => sub ($, $widget is copy) {
        gtk_box_set_center_widget($!b, $widget);
      }
    );
  }

  method homogeneous is rw {
    Proxy.new(
      FETCH => sub ($) {
        gtk_box_get_homogeneous($!b);
      },
      STORE => sub ($, $homogeneous is copy) {
        gtk_box_set_homogeneous($!b, $homogeneous);
      }
    );
  }

  method spacing is rw {
    Proxy.new(
      FETCH => sub ($) {
        gtk_box_get_spacing($!b);
      },
      STORE => sub ($, $spacing is copy) {
        gtk_box_set_spacing($!b, $spacing);
      }
    );
  }

  #method get_type () {
  #  gtk_box_get_type();
  #}

  method pack_end (GtkWidget $child, gboolean $expand, gboolean $fill, guint $padding) {
    gtk_box_pack_end($!b, $child, $expand, $fill, $padding);
  }

  method pack_start (GtkWidget $child, gboolean $expand, gboolean $fill, guint $padding) {
    gtk_box_pack_start($!b, $child, $expand, $fill, $padding);
  }

  method query_child_packing (GtkWidget $child, gboolean $expand, gboolean $fill, guint $padding, GtkPackType $pack_type) {
    gtk_box_query_child_packing($!b, $child, $expand, $fill, $padding, $pack_type);
  }

  method reorder_child (GtkWidget $child, gint $position) {
    gtk_box_reorder_child($!b, $child, $position);
  }

  method set_child_packing (GtkWidget $child, gboolean $expand, gboolean $fill, guint $padding, GtkPackType $pack_type) {
    gtk_box_set_child_packing($!b, $child, $expand, $fill, $padding, $pack_type);
  }

}

use v6.c;

use NativeCall;

use GTK::Compat::Types;
use GTK::Raw::Types;

unit package GTK::Raw::Layout;

sub gtk_layout_get_bin_window (GtkLayout $layout)
  returns GdkWindow
  is native($LIBGTK)
  is export
  { * }

sub gtk_layout_get_size (
  GtkLayout $layout,
  guint $width  is rw,
  guint $height is rw
)
  is native($LIBGTK)
  is export
  { * }

sub gtk_layout_get_type ()
  returns GType
  is native($LIBGTK)
  is export
  { * }

sub gtk_layout_move (
  GtkLayout $layout,
  GtkWidget $child_widget,
  gint $x,
  gint $y
)
  is native($LIBGTK)
  is export
  { * }

sub gtk_layout_new (
  GtkAdjustment $hadjustment,
  GtkAdjustment $vadjustment
)
  returns GtkWidget
  is native($LIBGTK)
  is export
  { * }

sub gtk_layout_put (
  GtkLayout $layout,
  GtkWidget $child_widget,
  gint $x,
  gint $y
)
  is native($LIBGTK)
  is export
  { * }

sub gtk_layout_set_size (GtkLayout $layout, guint $width, guint $height)
  is native($LIBGTK)
  is export
  { * }

sub gtk_layout_get_hadjustment (GtkLayout $layout)
  returns GtkAdjustment
  is native($LIBGTK)
  is export
  { * }

sub gtk_layout_get_vadjustment (GtkLayout $layout)
  returns GtkAdjustment
  is native($LIBGTK)
  is export
  { * }

sub gtk_layout_set_hadjustment (
  GtkLayout $layout,
  GtkAdjustment $adjustment
)
  is native($LIBGTK)
  is export
  { * }

sub gtk_layout_set_vadjustment (
  GtkLayout $layout,
  GtkAdjustment $adjustment
)
  is native($LIBGTK)
  is export
  { * }
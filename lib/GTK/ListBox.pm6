use v6.c;

use NativeCall;

use GTK::Compat::Types;
use GTK::Raw::ListBox;
use GTK::Raw::Types;

use GTK::Container;
use GTK::ListBoxRow;

my subset Ancestry where GtkListBox | GtkBuildable | GtkWidget;

class GTK::ListBox is GTK::Container {
  has GtkListBox $!lb;

  method bless(*%attrinit) {
    my $o = self.CREATE.BUILDALL(Empty, %attrinit);
    $o.setType('GTK::ListBox');
    $o;
  }

  submethod BUILD(:$listbox) {
    my $to-parent;
    given $listbox {
      when Ancestry {
        $!lb = do {
          when GtkWidget {
            $to-parent = $_;
            nativecast(GtkListBox, $_);
          }
          when GtkBuildable {
            $!b = nativecast(GtkBuildable, $_);     # GTK::Roles::Buildable
            $to-parent = nativecast(GtkContainer, $_);
            nativecast(GtkListBox, $_);
          when GtkListBox {
            $to-parent = nativecast(GtkContainer, $_);
            $_;
          }
        }
        self.setContainer($to-parent);
        $!b //= nativecast(GtkBuildable, $_);       # GTK::Roles::Buildable
      }
      when GTK::ListBox {
      }
      default {
      }
    }
  }

  multi method new {
    my $listbox = gtk_list_box_new();
    self.bless(:$listbox);
  }
  multi method new (Ancestry $listbox) {
    self.bless(:$listbox);
  }

  # ↓↓↓↓ SIGNALS ↓↓↓↓

  # Is originally:
  # GtkListBox, gpointer --> void
  method activate-cursor-row {
    self.connect($!lb, 'activate-cursor-row');
  }

  # Is originally:
  # GtkListBox, GtkMovementStep, gint, gpointer --> void
  method move-cursor {
    self.connect($!lb, 'move-cursor');
  }

  # Is originally:
  # GtkListBox, GtkListBoxRow, gpointer --> void
  method row-activated {
    self.connect($!lb, 'row-activated');
  }

  # Is originally:
  # GtkListBox, GtkListBoxRow, gpointer --> void
  method row-selected {
    self.connect($!lb, 'row-selected');
  }

  # Is originally:
  # GtkListBox, gpointer --> void
  method select-all {
    self.connect($!lb, 'select-all');
  }

  # Is originally:
  # GtkListBox, gpointer --> void
  method selected-rows-changed {
    self.connect($!lb, 'selected-rows-changed');
  }

  # Is originally:
  # GtkListBox, gpointer --> void
  method toggle-cursor-row {
    self.connect($!lb, 'toggle-cursor-row');
  }

  # Is originally:
  # GtkListBox, gpointer --> void
  method unselect-all {
    self.connect($!lb, 'unselect-all');
  }


  # ↑↑↑↑ SIGNALS ↑↑↑↑

  # ↓↓↓↓ ATTRIBUTES ↓↓↓↓
  method activate_on_single_click is rw {
    Proxy.new(
      FETCH => sub ($) {
        gtk_list_box_get_activate_on_single_click($!lb);
      },
      STORE => sub ($, $single is copy) {
        gtk_list_box_set_activate_on_single_click($!lb, $single);
      }
    );
  }

  method adjustment is rw {
    Proxy.new(
      FETCH => sub ($) {
        gtk_list_box_get_adjustment($!lb);
      },
      STORE => sub ($, $adjustment is copy) {
        gtk_list_box_set_adjustment($!lb, $adjustment);
      }
    );
  }

  method selection_mode is rw {
    Proxy.new(
      FETCH => sub ($) {
        gtk_list_box_get_selection_mode($!lb);
      },
      STORE => sub ($, $mode is copy) {
        gtk_list_box_set_selection_mode($!lb, $mode);
      }
    );
  }

  # ↑↑↑↑ ATTRIBUTES ↑↑↑↑

  # ↓↓↓↓ PROPERTIES ↓↓↓↓
  # ↑↑↑↑ PROPERTIES ↑↑↑↑

  # ↓↓↓↓ METHODS ↓↓↓↓
  method bind_model (
    GListModel() $model,
    GtkListBoxCreateWidgetFunc $create_widget_func,
    gpointer $user_data,
    GDestroyNotify $user_data_free_func
  ) {
    gtk_list_box_bind_model(
      $!lb,
      $model,
      $create_widget_func,
      $user_data,
      $user_data_free_func
    );
  }

  method drag_highlight_row (GtkListBoxRow() $row) {
    gtk_list_box_drag_highlight_row($!lb, $row);
  }

  method drag_unhighlight_row {
    gtk_list_box_drag_unhighlight_row($!lb);
  }

  method get_row_at_index (gint $index) {
    GTK::ListBoxRow.new( gtk_list_box_get_row_at_index($!lb, $index) );
  }

  method get_row_at_y (gint $y) {
    GTK::ListBoxRow( gtk_list_box_get_row_at_y($!lb, $y) );
  }

  method get_selected_row {
    GTK::ListBoxRow.new( gtk_list_box_get_selected_row($!lb) );
  }

  method get_selected_rows {
    gtk_list_box_get_selected_rows($!lb);
  }

  method get_type {
    gtk_list_box_get_type();
  }

  method insert (GtkWidget() $child, gint $position) {
    gtk_list_box_insert($!lb, $child, $position);
  }

  method invalidate_filter {
    gtk_list_box_invalidate_filter($!lb);
  }

  method invalidate_headers {
    gtk_list_box_invalidate_headers($!lb);
  }

  method invalidate_sort {
    gtk_list_box_invalidate_sort($!lb);
  }

  method prepend (GtkWidget() $child) {
    gtk_list_box_prepend($!lb, $child);
  }

  method select_all {
    gtk_list_box_select_all($!lb);
  }

  method select_row (GtkListBoxRow() $row) {
    gtk_list_box_select_row($!lb, $row);
  }

  method selected_foreach (GtkListBoxForeachFunc $func, gpointer $data) {
    gtk_list_box_selected_foreach($!lb, $func, $data);
  }

  method set_filter_func (
    GtkListBoxFilterFunc $filter_func,
    gpointer $user_data,
    GDestroyNotify $destroy
  ) {
    gtk_list_box_set_filter_func($!lb, $filter_func, $user_data, $destroy);
  }

  method set_header_func (
    GtkListBoxUpdateHeaderFunc $update_header,
    gpointer $user_data,
    GDestroyNotify $destroy
  ) {
    gtk_list_box_set_header_func($!lb, $update_header, $user_data, $destroy);
  }

  method set_placeholder (GtkWidget() $placeholder) {
    gtk_list_box_set_placeholder($!lb, $placeholder);
  }

  method set_sort_func (
    GtkListBoxSortFunc $sort_func,
    gpointer $user_data,
    GDestroyNotify $destroy
  ) {
    gtk_list_box_set_sort_func($!lb, $sort_func, $user_data, $destroy);
  }

  method unselect_all {
    gtk_list_box_unselect_all($!lb);
  }

  method unselect_row (GtkListBoxRow() $row) {
    gtk_list_box_unselect_row($!lb, $row);
  }
  # ↑↑↑↑ METHODS ↑↑↑↑

}

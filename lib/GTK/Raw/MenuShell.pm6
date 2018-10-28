use v6.c;

use NativeCall;

use GTK::Compat::Types;
use GTK::Raw::Types;

unit package GTK::Raw::MenuShell;

sub gtk_menu_shell_activate_item (
  GtkMenuShell $menu_shell,
  GtkWidget $menu_item,
  gboolean $force_deactivate
)
  is native($LIBGTK)
  is export
  { * }

sub gtk_menu_shell_append (GtkMenuShell $menu_shell, GtkWidget $child)
  is native($LIBGTK)
  is export
  { * }

sub gtk_menu_shell_bind_model (
  GtkMenuShell $menu_shell,
  GMenuModel $model,
  gchar $action_namespace,
  gboolean $with_separators
)
  is native($LIBGTK)
  is export
  { * }

sub gtk_menu_shell_cancel (GtkMenuShell $menu_shell)
  is native($LIBGTK)
  is export
  { * }

sub gtk_menu_shell_deactivate (GtkMenuShell $menu_shell)
  is native($LIBGTK)
  is export
  { * }

sub gtk_menu_shell_deselect (GtkMenuShell $menu_shell)
  is native($LIBGTK)
  is export
  { * }

sub gtk_menu_shell_get_parent_shell (GtkMenuShell $menu_shell)
  returns GtkWidget
  is native($LIBGTK)
  is export
  { * }

sub gtk_menu_shell_get_selected_item (GtkMenuShell $menu_shell)
  returns GtkWidget
  is native($LIBGTK)
  is export
  { * }

sub gtk_menu_shell_get_type ()
  returns GType
  is native($LIBGTK)
  is export
  { * }

sub gtk_menu_shell_insert (
  GtkMenuShell $menu_shell,
  GtkWidget $child,
  gint $position
)
  is native($LIBGTK)
  is export
  { * }

sub gtk_menu_shell_prepend (GtkMenuShell $menu_shell, GtkWidget $child)
  is native($LIBGTK)
  is export
  { * }

sub gtk_menu_shell_select_first (
  GtkMenuShell $menu_shell,
  gboolean $search_sensitive
)
  is native($LIBGTK)
  is export
  { * }

sub gtk_menu_shell_select_item (
  GtkMenuShell $menu_shell,
  GtkWidget $menu_item
)
  is native($LIBGTK)
  is export
  { * }

sub gtk_menu_shell_get_take_focus (GtkMenuShell $menu_shell)
  returns uint32
  is native($LIBGTK)
  is export
  { * }

sub gtk_menu_shell_set_take_focus (
  GtkMenuShell $menu_shell,
  gboolean $take_focus
)
  is native($LIBGTK)
  is export
  { * }
use v6.c;

use NativeCall;

use GTK::Compat::Types;
use GTK::Raw::Types;

unit package GTK::Dialog::Raw::Message;

sub gtk_message_dialog_get_message_area (GtkMessageDialog $message_dialog)
  returns GtkWidget
  is native($LIBGTK)
  is export
  { * }

sub gtk_message_dialog_get_type ()
  returns GType
  is native($LIBGTK)
  is export
  { * }

sub gtk_message_dialog_set_markup (GtkMessageDialog $message_dialog, gchar $str)
  is native($LIBGTK)
  is export
  { * }

sub gtk_message_dialog_get_image (GtkMessageDialog $dialog)
  returns GtkWidget
  is native($LIBGTK)
  is export
  { * }

sub gtk_message_dialog_set_image (GtkMessageDialog $dialog, GtkWidget $image)
  is native($LIBGTK)
  is export
  { * }

# Was va_list
sub gtk_message_dialog_new (
  GtkWindow $parent,
  uint32    $flags,             # GtkDialogFlags flags
  uint32    $type,              # GtkMessageType type
  uint32    $buttons,           # GtkButtonsType buttons
  Str       $message_format
)
  returns GtkMessageDialog
  is native($LIBGTK)
  is export
  { * }

# Was va_list
sub gtk_message_dialog_new_with_markup (
  GtkWindow $parent,
  uint32    $flags,             # GtkDialogFlags flags
  uint32    $type,              # GtkMessageType type
  uint32    $buttons,           # GtkButtonsType buttons
  Str       $message_format
)
  returns GtkMessageDialog
  is native($LIBGTK)
  is export
  { * }

# Was va_list
sub gtk_message_dialog_format_secondary_text (
  GtkMessageDialog $message_dialog,
  Str $message_format
)
  is native($LIBGTK)
  is export
  { * }

# Was va_list
sub gtk_message_dialog_format_secondary_markup (
  GtkMessageDialog $message_dialog,
  Str $message_format
)
  is native($LIBGTK)
  is export
  { * }
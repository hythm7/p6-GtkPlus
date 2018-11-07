use v6.c;

use NativeCall;

use gio::Compat::Types;

unit package gio::Compat::Raw::Icon;

sub g_icon_deserialize (GVariant $value)
  returns GIcon
  is native(gio)
  is export
  { * }

sub g_icon_equal (GIcon $icon1, GIcon $icon2)
  returns uint32
  is native(gio)
  is export
  { * }

sub g_icon_get_type ()
  returns GType
  is native(gio)
  is export
  { * }

sub g_icon_hash (gconstpointer $icon)
  returns guint
  is native(gio)
  is export
  { * }

sub g_icon_new_for_string (gchar $str, GError $error)
  returns GIcon
  is native(gio)
  is export
  { * }

sub g_icon_serialize (GIcon $icon)
  returns GVariant
  is native(gio)
  is export
  { * }

sub g_icon_to_string (GIcon $icon)
  returns Str
  is native(gio)
  is export
  { * }

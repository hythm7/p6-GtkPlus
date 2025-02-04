use v6.c;

use Method::Also;
use NativeCall;

use GTK::Raw::Utils;

use GTK::Compat::Types;
use GIO::Raw::AppInfo;

class GTK::Compat::LaunchContext {
  has GAppLaunchContext $!lc is implementor;

  submethod BUILD(:$context) {
    $!lc = $context
  }

  multi method new {
    my $context = g_app_launch_context_new();
    
    self.bless(:$context) if $context;
  }
  multi method new(GAppLaunchContext $context) {
    self.bless(:$context);
  }

  # ↓↓↓↓ SIGNALS ↓↓↓↓

  # Is originally
  # GAppLaunchContext, gchar, gpointer
  method launch-failed is also<launch_failed> {
    self.connect($!lc, 'launch-failed');
  }

  method launched {
    self.connect($!lc, 'launched');
  }

  # ↑↑↑↑ SIGNALS ↑↑↑↑

  # ↓↓↓↓ ATTRIBUTES ↓↓↓↓
  # ↑↑↑↑ ATTRIBUTES ↑↑↑↑

  # ↓↓↓↓ METHODS ↓↓↓↓

  method get_display (GAppInfo() $info, GList() $files)
    is also<get-display>
  {
    g_app_launch_context_get_display($!lc, $info, $files);
  }

  method get_environment is also<get-environment> {
    CStringArrayToArray( g_app_launch_context_get_environment($!lc) );
  }

  # Needs objectification.
  method get_startup_notify_id (GAppInfo() $info, GList() $files)
    is also<get-startup-notify-id>
  {
    g_app_launch_context_get_startup_notify_id($!lc, $info, $files);
  }

  method emit_launch_failed (Str() $startup_notify_id)
    is also<eemit-launch-failed>
  {
    so g_app_launch_context_launch_failed($!lc, $startup_notify_id);
  }

  method setenv (Str() $variable, Str() $value) {
    g_app_launch_context_setenv($!lc, $variable, $value);
  }

  method unsetenv (Str() $variable) {
    g_app_launch_context_unsetenv($!lc, $variable);
  }
  # ↑↑↑↑ METHODS ↑↑↑↑

}

use v6.c;

use NativeCall;

use GTK::Compat::Types;
use GTK::Raw::Subs;
use GTK::Raw::Types;
use GTK::Raw::Application;
use GTK::Raw::Window;

use GTK::Window;

class GTK::Application {
  also does GTK::Roles::Signals;

  my $gapp;

  has $!app;    # GtkApplication
  has $!title;
  has $!width;
  has $!height;

  has $.window handles <show_all>;

  submethod BUILD(
    :$app,
    Str    :$title,
    uint32 :$flags = 0,
    uint32 :$width,
    uint32 :$height,
  ) {
    $!app = $app;
    $!title = $title;
    $!width = $width;
    $!height = $height;

    self.activate.tap({
      $!window = GTK::Window.new( :window( gtk_application_window_new($app) ) );

      self.window.setWindow($!window);
      self.window.title = $title;
      self.window.set_default_size($width, $height);
    });
  }

  method init (GTK::Application:U: ) {
    my $argc = CArray[uint32].new;
    $argc[0] = 1;
    my $args = CArray[Str].new;
    $args[0] = $*PROGRAM.Str;
    my $argv = CArray[CArray[Str]].new;
    $argv[0] = $args;

    gtk_init($argc, $argv);
  }

  method new(
    Str :$title = 'Application',
    Int :$flags = 0,
    Int :$width = 200,
    Int :$height = 200
  ) {
    my uint32 $f = $flags;
    my uint32 $w = $width;
    my uint32 $h = $height;

    GTK::Application.init;

    # Use raw GTK calls here since the object model will be used by the callers.
    my $app = gtk_application_new($title, $f);

    self.bless(
      :$app,
      :$title,
      :flags($f),
      :width($w),
      :height($h)
    );
  }

  method title {
    $!title;
  }

  method width {
    $!width;
  }

  method height {
    $!height;
  }

  method app_menu is rw {
    Proxy.new(
      FETCH => sub ($) {
        gtk_application_get_app_menu($!app);
      },
      STORE => sub ($, $app_menu is copy) {
        gtk_application_set_app_menu($!app, $app_menu);
      }
    );
  }

  method menubar is rw {
    Proxy.new(
      FETCH => sub ($) {
        gtk_application_get_menubar($!app);
      },
      STORE => sub ($, $menubar is copy) {
        gtk_application_set_menubar($!app, $menubar);
      }
    );
  }

  multi method run(GTK::Application:D: ) {
    #gtk_main();
    g_application_run($!app, OpaquePointer, OpaquePointer);
  }
  multi method run(GTK::Application:U: ) {
    $gapp = gtk_application_new('Application', G_APPLICATION_FLAGS_NONE);

    g_application_run($gapp, OpaquePointer, OpaquePointer);
  }

  multi method exit(GTK::Application:D: ) {
    #gtk_main_quit();
    g_application_quit($!app);
  }
  multi method exit(GTK::Application:U: ) {
    g_application_quit($gapp);
  }

  method activate {
    self.connect($!app, 'activate');
  }

  method startup {
    self.connect($!app, 'startup');
  }

  method shutdown {
    self.connect($!app, 'shutdown');
  }

  method add_accelerator (gchar $accelerator, gchar $action_name, GVariant $parameter) {
    gtk_application_add_accelerator($!app, $accelerator, $action_name, $parameter);
  }

  multi method add_window (GtkWindow $window) {
    gtk_application_add_window($!app, $window);
  }
  multi method add_window(GTK::Window $window) {
    samewith($window.window);
  }

  method get_accels_for_action (gchar $detailed_action_name) {
    gtk_application_get_accels_for_action($!app, $detailed_action_name);
  }

  method get_actions_for_accel (gchar $accel) {
    gtk_application_get_actions_for_accel($!app, $accel);
  }

  method get_active_window {
    gtk_application_get_active_window($!app);
  }

  method get_menu_by_id (gchar $id) {
    gtk_application_get_menu_by_id($!app, $id);
  }

  method get_type {
    gtk_application_get_type();
  }

  method get_window_by_id (guint $id) {
    gtk_application_get_window_by_id($!app, $id);
  }

  method get_windows {
    gtk_application_get_windows($!app);
  }

  # cw: Variant to accept a GTK::Window
  multi method inhibit (GtkWindow $window, GtkApplicationInhibitFlags $flags, gchar $reason) {
    gtk_application_inhibit($!app, $window, $flags, $reason);
  }
  multi method inhibit (GTK::Window $window, GtkApplicationInhibitFlags $flags, gchar $reason) {
    samewith($window.window, $flags, $reason);
  }

  method is_inhibited (GtkApplicationInhibitFlags $flags) {
    gtk_application_is_inhibited($!app, $flags);
  }

  method list_action_descriptions {
    gtk_application_list_action_descriptions($!app);
  }

  method prefers_app_menu {
    gtk_application_prefers_app_menu($!app);
  }

  method remove_accelerator (gchar $action_name, GVariant $parameter) {
    gtk_application_remove_accelerator($!app, $action_name, $parameter);
  }

  method remove_window (GtkWindow $window) {
    gtk_application_remove_window($!app, $window);
  }

  method uninhibit (guint $cookie) {
    gtk_application_uninhibit($!app, $cookie);
  }

}

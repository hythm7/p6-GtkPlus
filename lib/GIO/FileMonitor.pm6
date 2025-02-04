use v6.c;

use Method::Also;

use GTK::Compat::Types;
use GTK::Compat::FileTypes;

use GIO::Raw::FileMonitor;

use GTK::Roles::Properties;
use GIO::Roles::Signals::FileMonitor;

class GIO::FileMonitor {
  also does GTK::Roles::Properties;
  also does GIO::Roles::Signals::FileMonitor;

  has GFileMonitor $!m is implementor;

  submethod BUILD (:$monitor) {
    $!m = $monitor;

    self.roleInit-Object;
  }

  method GTK::Compat::Types::GFileMonitor
    is also<GFileMonitor>
  { $!m }

  method new (GFileMonitor $monitor) {
    self.bless( :$monitor );
  }

  # Type: gint
  method rate-limit is rw  is also<rate_limit> {
    my GTK::Compat::Value $gv .= new( G_TYPE_INT );
    Proxy.new(
      FETCH => -> $ {
        $gv = GTK::Compat::Value.new(
          self.prop_get('rate-limit', $gv)
        );
        $gv.int;
      },
      STORE => -> $, Int() $val is copy {
        $gv.int = $val;
        self.prop_set('rate-limit', $gv);
      }
    );
  }

  # Is originally:
  # GFileMonitor, GFile, GFile, GFileMonitorEvent, gpointer --> void
  method changed {
    self.connect-changed($!m);
  }

  method cancel {
    g_file_monitor_cancel($!m);
  }

  method emit_event (
    GFile() $child,
    GFile() $other_file,
    GFileMonitorEvent $event_type
  )
    is also<emit-event> 
  {
    g_file_monitor_emit_event($!m, $child, $other_file, $event_type);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &g_file_monitor_get_type, $n, $t );
  }

  method is_cancelled is also<is-cancelled> {
    so g_file_monitor_is_cancelled($!m);
  }

  method set_rate_limit (gint $limit_msecs) is also<set-rate-limit> {
    my gint $l = $limit_msecs;

    g_file_monitor_set_rate_limit($!m, $l);
  }

}

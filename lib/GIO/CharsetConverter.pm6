use v6.c;

use NativeCall;

use GTK::Compat::Types;
use GIO::Raw::CharsetConverter;

use GTK::Roles::Properties;
use GIO::Roles::Converter;
use GIO::Roles::Initable;

class GIO::CharsetConverter {
  also does GTK::Roles::Properties;
  also does GIO::Roles::Converter;
  also does GIO::Roles::Initable;

  has GCharsetConverter $!cc;

  submethod BUILD (:$converter) {
    $!cc = $converter;

    self.roleInit-Object;
    self.roleInit-Converter;
    self.roleInit-Initable;
  }

  multi method new (GCharsetConverter :$converter) {
    self.bless( :$converter );
  }
  multi method new (
    Str $to_charset,
    Str $from_charset,
    CArray[Pointer[GError]] $error = gerror
  ) {
    clear_error;
    my $cc = g_charset_converter_new($to_charset, $from_charset, $error);
    set_error($error);
    self.bless( converter => $cc );
  }

  # Type: gchar
  method from-charset is rw  {
    my GTK::Compat::Value $gv .= new( G_TYPE_STRING );
    Proxy.new(
      FETCH => -> $ {
        $gv = GTK::Compat::Value.new(
          self.prop_get('from-charset', $gv)
        );
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('from-charset', $gv);
      }
    );
  }

  # Type: gchar
  method to-charset is rw  {
    my GTK::Compat::Value $gv .= new( G_TYPE_STRING );
    Proxy.new(
      FETCH => -> $ {
        $gv = GTK::Compat::Value.new(
          self.prop_get('to-charset', $gv)
        );
        $gv.string;
      },
      STORE => -> $, Str() $val is copy {
        $gv.string = $val;
        self.prop_set('to-charset', $gv);
      }
    );
  }

  # Type: gboolean
  method use_fallback is rw {
    Proxy.new(
      FETCH => sub ($) {
        so g_charset_converter_get_use_fallback($!cc);
      },
      STORE => sub ($, Int() $use_fallback is copy) {
        my gboolean $u = $use_fallback;

        g_charset_converter_set_use_fallback($!cc, $u);
      }
    );
  }

  method get_num_fallbacks {
    g_charset_converter_get_num_fallbacks($!cc);
  }

  method get_type {
    state ($n, $t);

    unstable_get_type( self.^name, &g_charset_converter_get_type, $n, $t );
  }

}

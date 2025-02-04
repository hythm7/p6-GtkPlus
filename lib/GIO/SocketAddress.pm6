use v6.c;

use Method::Also;

use NativeCall;

use GTK::Compat::Types;
use GIO::Raw::SocketAddress;

use GIO::Roles::SocketConnectable;

our subset SocketAddressAncestry is export of Mu
  where GSocketConnectable | GSocketAddress;

class GIO::SocketAddress {
  also does GTK::Compat::Roles::Object;
  also does GIO::Roles::SocketConnectable;

  has GSocketAddress $!sa is implementor;

  submethod BUILD (:$address) {
    self.setSocketAddress($address) if $address;
  }

  method setSocketAddress (SocketAddressAncestry $_) {
    my $role-set = False;

    # This is NOT the normal when processing. since it is NOT an assignment!
    {
      when GSocketConnectable {
        self.roleInit-SocketConnectable($_);
        $role-set = True;
        proceed;
      }

      default {
        $!sa = $_ ~~ GSocketAddress ?? $_ !! cast(GSocketAddress, $_);
      }
    }

    # ALWAYS set Object first!
    self.roleInit-Object;
    self.roleInit-SocketConnectable unless $role-set;
  }

  method GTK::Compat::Types::GSocketAddress
    is also<GSocketAddress>
  { $!sa }

  method new (GSocketAddress $address) {
    self.bless( :$address );
  }

  method new_from_native (Pointer $native, Int() $len)
    is also<new-from-native>
  {
    my gsize $l = $len;

    self.bless( address => g_socket_address_new_from_native($native, $l) )
  }

  method get_family
    is also<
      get-family
      family
    >
  {
    GSocketFamilyEnum( g_socket_address_get_family($!sa) );
  }

  method get_native_size
    is also<
      get-native-size
      native_size
      native-size
    >
  {
    g_socket_address_get_native_size($!sa);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &g_socket_address_get_type, $n, $t );
  }

  method to_native (
    Pointer $dest,
    Int() $destlen,
    CArray[Pointer[GError]] $error = gerror
  )
    is also<to-native>
  {
    my gsize $dl = $destlen;

    clear_error;
    my $rv = g_socket_address_to_native($!sa, $dest, $dl, $error);
    set_error($error);
    $rv;
  }

}

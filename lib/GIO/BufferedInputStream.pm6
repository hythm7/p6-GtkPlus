use v6.c;

use Method::Also;

use NativeCall;

use GTK::Compat::Types;
use GIO::Raw::BufferedInputStream;

use GIO::FilterInputStream;

use GIO::Roles::Seekable;

our subset BufferedInputStreamAncestry is export of Mu
  where GBufferedInputStream | GSeekable | FilterInputStreamAncestry;

class GIO::BufferedInputStream is GIO::FilterInputStream {
  also does GIO::Roles::Seekable;

  has GBufferedInputStream $!bis is implementor;

  submethod BUILD (:$buffered-stream) {
    given $buffered-stream {
      when BufferedInputStreamAncestry {
        self.setBufferedInputStream($_);
      }

      when GIO::BufferedInputStream {
      }

      default {
      }
    }
  }

  method setBufferedInputStream (BufferedInputStreamAncestry $_) {
    my $to-parent;

    $!bis = do {
      when GBufferedInputStream {
        $to-parent = cast(GFilterInputStream, $_);
        $_;
      }

      when GSeekable {
        $to-parent = cast(GFilterInputStream, $_);
        $!s = $_;
        cast(GBufferedInputStream, $_);
      }

      default {
        $to-parent = $_;
        cast(GBufferedInputStream, $_);
      }
    }
    self.roleInit-Seekable unless $!s;
    self.setFilterInputStream($to-parent);
  }

  method GTK::Compat::Types::GBufferedInputStream
    is also<GBufferedInputStream>
  { $!bis }

  proto method new (|)
  { * }

  multi method new (BufferedInputStreamAncestry $buffered-stream) {
    self.bless( :$buffered-stream );
  }
  multi method new (GIO::InputStream $base) {
    self.bless(
      buffered-stream => g_buffered_input_stream_new($base.GInputStream)
    );
  }

  method new_sized (GInputStream() $base, Int() $size) is also<new-sized> {
    my gsize $s = $size;

    self.bless(
      buffered-stream => g_buffered_input_stream_new_sized($base, $s)
    );
  }

  method buffer_size is rw is also<buffer-size> {
    Proxy.new(
      FETCH => sub ($) {
        g_buffered_input_stream_get_buffer_size($!bis);
      },
      STORE => sub ($, Int() $size is copy) {
        my gsize $s = $size;

        g_buffered_input_stream_set_buffer_size($!bis, $s);
      }
    );
  }

  method fill (
    Int() $count,
    GCancellable() $cancellable = GCancellable,
    CArray[Pointer[GError]] $error = gerror
  ) {
    my gsize $c = $count;

    clear_error;
    my $rv = g_buffered_input_stream_fill($!bis, $c, $cancellable, $error);
    set_error($error);
    $rv;
  }

  proto method fill_async (|)
    is also<fill-async>
  { * }

  multi method fill_async (
    Int() $count,
    Int() $io_priority,
    &callback,
    gpointer $user_data = gpointer
  ) {
    samewith($count, $io_priority, GCancellable, &callback, $user_data);
  }
  multi method fill_async (
    Int() $count,
    Int() $io_priority,
    GCancellable() $cancellable,
    &callback,
    gpointer $user_data = gpointer
  ) {
    my gsize $c = $count;
    my gint $i = $io_priority;

    g_buffered_input_stream_fill_async(
      $!bis,
      $c,
      $i,
      $cancellable,
      &callback,
      $user_data
    );
  }

  method fill_finish (
    GAsyncResult() $result,
    CArray[Pointer[GError]] $error = gerror
  )
    is also<fill-finish>
  {
    clear_error;
    my $rv = g_buffered_input_stream_fill_finish($!bis, $result, $error);
    set_error($error);
    $rv;
  }

  method get_available
    is also<
      get-available
      available
    >
  {
    g_buffered_input_stream_get_available($!bis);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &g_buffered_input_stream_get_type, $n, $t );
  }

  method peek (Blob() $buffer, Int() $offset, Int() $count) {
    my gsize ($o, $c) = ($offset, $count);

    g_buffered_input_stream_peek($!bis, $buffer, $offset, $count);
  }

  proto method peek_buffer (|)
    is also<peek-buffer>
  { * }

  multi method peek_buffer (:$all = False) {
    samewith($, :$all);
  }
  multi method peek_buffer ($count is rw, :$all = False) {
    my gsize $c = 0;

    # Minimize possibility of corruption by prepping buf in
    # stages
    my $b = g_buffered_input_stream_peek_buffer($!bis, $c);
    $count = $c;
    my $buf = Buf.allocate($count, 0);
    $buf[$_] = $b[$_] for ^$count;

    $all.not ?? $buf !! ($buf, $count);
  }

  method read_byte (
    GCancellable() $cancellable = GCancellable,
    CArray[Pointer[GError]] $error = gerror
  )
    is also<read-byte>
  {
    clear_error;
    my $rv = g_buffered_input_stream_read_byte($!bis, $cancellable, $error);
    set_error($error);
    $rv;
  }

}

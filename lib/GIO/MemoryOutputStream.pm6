use v6.c;

use Method::Also;

use NativeCall;

use GTK::Compat::Types;
use GIO::Raw::MemoryOutputStream;

use GIO::OutputStream;

use GIO::Roles::Seekable;
use GIO::Roles::PollableOutputStream;

our subset MemoryOutputStreamAncestry of Mu is export
  where GMemoryOutputStream | GSeekable | GPollableOutputStream | GOutputStream;

class GIO::MemoryOutputStream is GIO::OutputStream {
  also does GIO::Roles::Seekable;
  also does GIO::Roles::PollableOutputStream;

  has GMemoryOutputStream $!mos is implementor;

  submethod BUILD (:$memory-output) {
    do given $memory-output {
      when MemoryOutputStreamAncestry {
        self.setMemoryOutputStream($memory-output);
      }

      when GIO::MemoryOutputStream {
      }

      default {
      }
    }
  }

  method setMemoryOutputStream (MemoryOutputStreamAncestry $_) {
    my $to-parent;

    $!mos = do {
      when GMemoryOutputStream {
        $to-parent = cast(GOutputStream, $_);
        $_;
      }

      when GSeekable {
        $!s = $_;
        $to-parent = cast(GOutputStream, $_);
        cast(GMemoryOutputStream, $_);
      }

      when GPollableOutputStream {
        $!pos = $_;
        $to-parent = cast(GOutputStream, $_);
        cast(GMemoryOutputStream, $_);
      }

      default {
        $to-parent = $_;
        cast(GMemoryOutputStream, $_);
      }
    }

    self.setOuptutStream($to-parent);
    self.roleInit-Seekable             unless $!s;
    self.RoleInit-PollableOutputStream unless $!pos;
  }

  method GTK::Compat::Types::GMemoryOutputStream
    is also<GMemoryOutputStream>
  { $!mos }

  multi method new (GMemoryOutputStream :$memory-output) {
    self.bless( :$memory-output );
  }
  multi method new (
    Buf() $data,
    GReallocFunc $realloc_function   = Pointer,
    GDestroyNotify $destroy_function = Pointer
  ) {
    samewith(
      cast(Pointer, $data),
      $data.elems,
      $realloc_function,
      $destroy_function
    )
  }
  multi method new (
    gpointer $data,
    Int() $size,
    GReallocFunc $realloc_function   = Pointer,
    GDestroyNotify $destroy_function = Pointer
  ) {
    my gsize $s = $size;

    self.bless(
      memory-output => g_memory_output_stream_new(
        $data,
        $size,
        $realloc_function,
        $destroy_function
      )
    )
  }

  method new_resizable is also<new-resizable> {
    self.bless( memory-output => g_memory_output_stream_new_resizable() )
  }

  method get_data (:$raw = False) is also<get-data> {
    g_memory_output_stream_get_data($!mos);
  }

  method get_data_size is also<get-data-size> {
    g_memory_output_stream_get_data_size($!mos);
  }

  method get_size is also<get-size> {
    g_memory_output_stream_get_size($!mos);
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &g_memory_output_stream_get_type, $n, $t );
  }

  method steal_as_bytes is also<steal-as-bytes> {
    g_memory_output_stream_steal_as_bytes($!mos);
  }

  method steal_data is also<steal-data> {
    g_memory_output_stream_steal_data($!mos);
  }

}

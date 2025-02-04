use v6.c;

use Method::Also;

use NativeCall;

use GTK::Compat::Types;

use GTK::Compat::Roles::Object;
use GTK::Compat::Roles::GFile;
use GIO::Roles::Icon;
use GIO::Roles::LoadableIcon;

# Does roles so Ancestry logic?

class GIO::FileIcon {
  also does GTK::Compat::Roles::Object;
  also does GIO::Roles::Icon;
  also does GIO::Roles::LoadableIcon;

  has GFileIcon $!fi is implementor;

  submethod BUILD (:$fileicon) {
    $!fi = $fileicon;

    # See note in TODO about making this even easier!
    self.roleInit-Object;
    self.roleInit-Icon;
    self.roleInit-LoadableIcon;
    #say "FI: $!fi";
  }

  method GTK::Compat::Types::GFileIcon
    is also<GFileIcon>
  { $!fi }

  multi method new (GFileIcon $fileicon) {
    self.bless( :$fileicon );
  }
  multi method new (GFile() $icon) {
    self.bless( fileicon => g_file_icon_new($icon) );
  }

  method get_file (:$raw = False)
    is also<
      get-file
      file
    >
  {
    my $f = g_file_icon_get_file($!fi);

    $f ??
      ( $raw ?? $f !! GTK::Compat::Roles::GFile.new-file-obj($f) )
      !!
      Nil;
  }

  method get_type is also<get-type> {
    state ($n, $t);

    unstable_get_type( self.^name, &g_file_icon_get_type, $n, $t );
  }

}

sub g_file_icon_get_file (GFileIcon $icon)
  returns GFile
  is native(gio)
  is export
{ * }

sub g_file_icon_get_type ()
  returns GType
  is native(gio)
  is export
{ * }

sub g_file_icon_new (GFile $file)
  returns GFileIcon
  is native(gio)
  is export
{ * }

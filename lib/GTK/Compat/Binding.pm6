use v6.c;

use Method::Also;
use NativeCall;

use GTK::Raw::Utils;

use GTK::Compat::Types;

use GTK::Compat::Raw::Binding;

use GTK::Compat::Roles::Object;

class GTK::Compat::Binding {
  also does GTK::Compat::Roles::Object;
  
  has GBinding $!b;
  
  submethod BUILD (:$binding) {
    self!setObject($!b = $binding);
  }

  method g_object_bind_property (
    GTK::Compat::Binding:U: 
    GObject $source, 
    Str() $source_property, 
    GObject $target, 
    Str() $target_property, 
    Int() $flags
  ) 
    is also<g-object-bind-property> 
  {
    my $f = resolve-uint($flags);
    self.bless( 
      binding => g_object_bind_property(
        $source, 
        $source_property, 
        $target, 
        $target_property, 
        $f
      );
    )
  }

  method g_object_bind_property_full (
    GTK::Compat::Binding:U: 
    GObject $source, 
    Str() $source_property, 
    GObject $target, 
    Str() $target_property, 
    Int() $flags, 
    GBindingTransformFunc $transform_to   = Pointer,
    GBindingTransformFunc $transform_from = Pointer,
    gpointer $user_data                   = Pointer,
    GDestroyNotify $notify                = Pointer
  ) 
    is also<g-object-bind-property-full> 
  {
    my $f = resolve-uint($flags);
    self.bless( 
      binding => g_object_bind_property_full(
        $source, 
        $source_property, 
        $target, 
        $target_property, 
        $f, 
        $transform_to, 
        $transform_from, 
        $user_data, 
        $notify
      )
    );
  }

  method g_object_bind_property_with_closures (
    GTK::Compat::Binding:U: 
    GObject $source, 
    Str() $source_property, 
    GObject $target, 
    Str() $target_property, 
    Int() $flags, 
    GClosure $transform_to, 
    GClosure $transform_from
  ) 
    is also<g-object-bind-property-with-closures> 
  {
    my $f = resolve-uint($flags);
    self.bless( 
      binding => g_object_bind_property_with_closures(
        $source, 
        $source_property, 
        $target, 
        $target_property, 
        $f, 
        $transform_to, 
        $transform_from
      )
    );
  }

  method get_flags is also<get-flags> {
    GBindingFlags( g_binding_get_flags($!b) );
  }

  method get_source is also<get-source> {
    g_binding_get_source($!b);
  }

  method get_source_property is also<get-source-property> {
    g_binding_get_source_property($!b);
  }

  method get_target is also<get-target> {
    g_binding_get_target($!b);
  }

  method get_target_property is also<get-target-property> {
    g_binding_get_target_property($!b);
  }

  method get_type is also<get-type> {
    g_binding_get_type();
  }

  method unbind {
    g_binding_unbind($!b);
  }

}

use v6.c;

use Method::Also;
use NativeCall;

use GTK::Raw::Types;
use GTK::Raw::TreeModel;

# BOXED TYPE

class GTK::TreeIter is export {
  has GtkTreeIter $!ti is implementor;

  submethod BUILD(:$iter) {
    $!ti = $iter;
  }

  method new (GtkTreeIter $iter) {
    self.bless(:$iter);
  }

  method GTK::Raw::Types::GtkTreeIter 
    is also<TreeIter>
    { $!ti }

  # ↓↓↓↓ SIGNALS ↓↓↓↓
  # ↑↑↑↑ SIGNALS ↑↑↑↑

  # ↓↓↓↓ ATTRIBUTES ↓↓↓↓
  # ↑↑↑↑ ATTRIBUTES ↑↑↑↑

  # ↓↓↓↓ METHODS ↓↓↓↓

  method copy {
    my $iter = gtk_tree_iter_copy($!ti);
    self.bless(:$iter);
  }

  method free {
    gtk_tree_iter_free($!ti);
  }
  # ↑↑↑↑ METHODS ↑↑↑↑

}

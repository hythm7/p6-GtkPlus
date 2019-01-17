use v6.c;

unit package GTK::Builder::MRO;

# Number of times I've had to force THIS to recompile.
constant forced = 5;

our %mro is export =our %mro is export (
'GTK::Render' => ('Any', 'Mu'),
'GTK::Selection' => ('GTK::Roles::Types', 'GTK::Roles::Protection', 'Any', 'Mu'),
'GTK::SizeGroup' => ('GTK::Roles::Types', 'GTK::Roles::Protection', 'Any', 'Mu'),
'GTK::TargetEntry' => ('Any', 'Mu'),
'GTK::TargetList' => ('Any', 'Mu'),
'GTK::TextChildAnchor' => ('Any', 'Mu'),
'GTK::TextIter' => ('GTK::Roles::Types', 'GTK::Roles::Protection', 'Any', 'Mu'),
'GTK::TextMark' => ('GTK::Roles::Types', 'GTK::Roles::Protection', 'Any', 'Mu'),
'GTK::Tooltip' => ('Any', 'Mu'),
'GTK::TreeIter' => ('Any', 'Mu'),
'GTK::TreePath' => ('GTK::Roles::Types', 'GTK::Roles::Protection', 'Any', 'Mu'),
'GTK::TreeRow' => ('GTK::Roles::Types', 'GTK::Roles::Protection', 'Any', 'Mu'),
'GTK::TreeSelection' => ('GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Generic', 'Any', 'Mu'),
'GTK::WidgetPath' => ('GTK::Roles::Types', 'GTK::Roles::Protection', 'Any', 'Mu'),
'GTK::WindowGroup' => ('GTK::Roles::References', 'Any', 'Mu'),
'GTK::Adjustment' => ('Any', 'Mu'),
'GTK::CSSProvider' => ('GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::StyleProvider', 'GTK::Roles::Signals::CSSProvider', 'GTK::Roles::Signals::Generic', 'Any', 'Mu'),
'GTK::Clipboard' => ('GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Generic', 'Any', 'Mu'),
'GTK::DragContext' => ('GTK::Roles::Types', 'GTK::Roles::Protection', 'Any', 'Mu'),
'GTK::EntryBuffer' => ('GTK::Roles::Signals::Generic', 'GTK::Roles::Signals::EntryBuffer', 'Any', 'Mu'),
'GTK::FileFilter' => ('GTK::Roles::Buildable', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'Any', 'Mu'),
'GTK::IconInfo' => ('GTK::Roles::Types', 'GTK::Roles::Protection', 'Any', 'Mu'),
'GTK::IconTheme' => ('GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'Any', 'Mu'),
'GTK::PaperSize' => ('Any', 'Mu'),
'GTK::PrintSettings' => ('GTK::Roles::Types', 'GTK::Roles::Protection', 'Any', 'Mu'),
'GTK::RecentFilter' => ('GTK::Roles::Buildable', 'Any', 'Mu'),
'GTK::Settings' => ('GTK::Roles::StyleProvider', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'Any', 'Mu'),
'GTK::StyleContext' => ('GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Generic', 'Any', 'Mu'),
'GTK::TextTag' => ('GTK::Roles::Signals::TextTag', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Properties', 'Any', 'Mu'),
'GTK::TextTagTable' => ('GTK::Roles::Signals::TextTagTable', 'GTK::Roles::References', 'GTK::Roles::Buildable', 'Any', 'Mu'),
'GTK::TreeModelFilter' => ('GTK::Roles::TreeDragSource', 'GTK::Roles::TreeModel', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'Any', 'Mu'),
'GTK::TreeModelSort' => ('GTK::Roles::TreeSortable', 'GTK::Roles::TreeModel', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::TreeDragSource', 'Any', 'Mu'),
'GTK::TreeStore' => ('GTK::Roles::TreeSortable', 'GTK::Roles::TreeModel', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::TreeDragSource', 'GTK::Roles::TreeDragDest', 'GTK::Roles::Buildable', 'Any', 'Mu'),
'GTK::AccelGroup' => ('Any', 'Mu'),
'GTK::CellAreaContext' => ('Any', 'Mu'),
'GTK::CellRenderer' => ('GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::CellRenderer', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'Any', 'Mu'),
'GTK::CellRendererPixbuf' => ('GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::CellRenderer', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::CellRenderer', 'Any', 'Mu'),
'GTK::CellRendererProgress' => ('GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::CellRenderer', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::CellRenderer', 'Any', 'Mu'),
'GTK::CellRendererSpinner' => ('GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::CellRenderer', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::CellRenderer', 'Any', 'Mu'),
'GTK::CellRendererText' => ('GTK::Roles::Signals::Generic', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::CellRenderer', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::CellRenderer', 'Any', 'Mu'),
'GTK::CellRendererToggle' => ('GTK::Roles::Signals::Generic', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::CellRenderer', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::CellRenderer', 'Any', 'Mu'),
'GTK::ListStore' => ('GTK::Roles::TreeSortable', 'GTK::Roles::TreeModel', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Buildable', 'Any', 'Mu'),
'GTK::PageSetup' => ('Any', 'Mu'),
'GTK::PrintContext' => ('GTK::Roles::Types', 'GTK::Roles::Protection', 'Any', 'Mu'),
'GTK::PrintJob' => ('GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Generic', 'GTK::Roles::Properties', 'Any', 'Mu'),
'GTK::PrintOperation' => ('GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::PrintOperation', 'GTK::Roles::Signals::Generic', 'GTK::Roles::Properties', 'Any', 'Mu'),
'GTK::Printer' => ('GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Generic', 'GTK::Roles::Properties', 'Any', 'Mu'),
'GTK::TextBuffer' => ('GTK::Roles::Signals::TextBuffer', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Properties', 'Any', 'Mu'),
'GTK::CellArea' => ('GTK::Roles::Signals::CellArea', 'GTK::Roles::CellLayout', 'GTK::Roles::LatchedContents', 'GTK::Roles::Protection', 'Any', 'Mu'),
'GTK::CellAreaBox' => ('GTK::Roles::Orientable', 'GTK::Roles::Signals::CellArea', 'GTK::Roles::CellLayout', 'GTK::Roles::LatchedContents', 'GTK::Roles::Protection', 'GTK::CellArea', 'Any', 'Mu'),
'GTK::CellRendererAccel' => ('GTK::Roles::Signals::CellRendererAccel', 'GTK::Roles::Signals::Generic', 'GTK::CellRendererText', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::CellRenderer', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::CellRenderer', 'Any', 'Mu'),
'GTK::CellRendererSpin' => ('GTK::Roles::Signals::Generic', 'GTK::CellRendererText', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::CellRenderer', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::CellRenderer', 'Any', 'Mu'),
'GTK::EntryCompletion' => ('GTK::Roles::Signals::EntryCompletion', 'GTK::Roles::Signals::Generic', 'GTK::Roles::CellLayout', 'GTK::Roles::LatchedContents', 'GTK::Roles::Protection', 'Any', 'Mu'),
'GTK::TreeViewColumn' => ('GTK::Roles::CellLayout', 'GTK::Roles::LatchedContents', 'GTK::Roles::Protection', 'GTK::Roles::Buildable', 'Any', 'Mu'),
'GTK::Application' => ('GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Application', 'GTK::Roles::Signals::Generic', 'Any', 'Mu'),
'GTK::CellRendererCombo' => ('GTK::Roles::Signals::Generic', 'GTK::CellRendererText', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::CellRenderer', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::CellRenderer', 'Any', 'Mu'),
'GTK::Builder' => ('Associative', 'Any', 'Mu'),

);;

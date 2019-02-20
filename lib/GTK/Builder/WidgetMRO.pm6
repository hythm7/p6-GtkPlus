use v6.c;

unit package GTK::Builder::WidgetMRO;

# Number of times I've had to force THIS to recompile.
constant forced = 2;

our %w-mro is export = (
'GTK::Widget' => ('GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'Any', 'Mu'),
'GTK::Calendar' => ('GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::CellView' => ('GTK::Roles::Orientable', 'GTK::Roles::CellLayout', 'GTK::Roles::LatchedContents', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::Container' => ('GTK::Roles::LatchedContents', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::DrawingArea' => ('GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::Entry' => ('GTK::Roles::Signals::Entry', 'GTK::Roles::Editable', 'GTK::Roles::Signals::Editable', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::Fixed' => ('GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::Grid' => ('GTK::Roles::Orientable', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::HeaderBar' => ('GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::IconView' => ('GTK::Roles::Signals::IconView', 'GTK::Roles::Scrollable', 'GTK::Roles::CellLayout', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::Image' => ('GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::Label' => ('GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::Layout' => ('GTK::Roles::Scrollable', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::LevelBar' => ('GTK::Roles::Orientable', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::Notebook' => ('GTK::Roles::Signals::Notebook', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::Pane' => ('GTK::Roles::Orientable', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::ProgressBar' => ('GTK::Roles::Orientable', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::Range' => ('GTK::Roles::Signals::Range', 'GTK::Roles::Orientable', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::Scale' => ('GTK::Roles::Signals::Scale', 'GTK::Roles::Signals::Range', 'GTK::Roles::Orientable', 'GTK::Range', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::Scrollbar' => ('GTK::Roles::Signals::Range', 'GTK::Roles::Orientable', 'GTK::Range', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::SearchEntry' => ('GTK::Roles::Signals::Entry', 'GTK::Roles::Editable', 'GTK::Roles::Signals::Editable', 'GTK::Entry', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::Separator' => ('GTK::Roles::Orientable', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::SpinButton' => ('GTK::Roles::Signals::SpinButton', 'GTK::Roles::Orientable', 'GTK::Roles::Signals::Entry', 'GTK::Roles::Editable', 'GTK::Roles::Signals::Editable', 'GTK::Entry', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::Spinner' => ('GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::Switch' => ('GTK::Roles::Actionable', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::TextView' => ('GTK::Roles::Signals::TextView', 'GTK::Roles::Scrollable', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::ToolItemGroup' => ('GTK::Roles::ToolShell', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::Toolbar' => ('GTK::Roles::ToolShell', 'GTK::Roles::Orientable', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::AccelLabel' => ('GTK::Label', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::Bin' => ('GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::Box' => ('GTK::Roles::Orientable', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::Button' => ('GTK::Roles::Actionable', 'GTK::Bin', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::ButtonBox' => ('GTK::Roles::Orientable', 'GTK::Box', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::ColorButton' => ('GTK::Roles::ColorChooser', 'GTK::Roles::Actionable', 'GTK::Button', 'GTK::Bin', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::ColorChooser' => ('GTK::Roles::ColorChooser', 'GTK::Roles::Orientable', 'GTK::Box', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::ComboBox' => ('GTK::Roles::Signals::ComboBox', 'GTK::Roles::CellLayout', 'GTK::Roles::CellEditable', 'GTK::Bin', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::ComboBoxText' => ('GTK::Roles::Signals::ComboBox', 'GTK::Roles::CellLayout', 'GTK::Roles::CellEditable', 'GTK::ComboBox', 'GTK::Bin', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::EventBox' => ('GTK::Bin', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::Expander' => ('GTK::Bin', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::FileChooserButton' => ('GTK::Roles::FileChooser', 'GTK::Bin', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::FlowBoxChild' => ('GTK::Bin', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::FontButton' => ('GTK::Roles::FontChooser', 'GTK::Roles::Actionable', 'GTK::Button', 'GTK::Bin', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::Frame' => ('GTK::Bin', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::InfoBar' => ('GTK::Roles::Orientable', 'GTK::Box', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::LinkButton' => ('GTK::Roles::Actionable', 'GTK::Button', 'GTK::Bin', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::ListBoxRow' => ('GTK::Roles::Actionable', 'GTK::Bin', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::LockButton' => ('GTK::Roles::Actionable', 'GTK::Button', 'GTK::Bin', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::MenuItem' => ('GTK::Roles::Actionable', 'GTK::Bin', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::MenuShell' => ('GTK::Roles::Signals::MenuShell', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::Overlay' => ('GTK::Roles::Signals::Overlay', 'GTK::Bin', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::Popover' => ('GTK::Bin', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::RadioMenuItem' => ('GTK::Roles::Actionable', 'GTK::MenuItem', 'GTK::Bin', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::Revealer' => ('GTK::Bin', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::ScaleButton' => ('GTK::Roles::Orientable', 'GTK::Roles::Actionable', 'GTK::Button', 'GTK::Bin', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::ScrolledWindow' => ('GTK::Roles::Signals::ScrolledWindow', 'GTK::Bin', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::SearchBar' => ('GTK::Bin', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::SeparatorMenuItem' => ('GTK::Roles::Actionable', 'GTK::MenuItem', 'GTK::Bin', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::ShortcutsGroup' => ('GTK::Roles::Orientable', 'GTK::Box', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::ShortcutsSection' => ('GTK::Roles::Orientable', 'GTK::Box', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::ShortcutsShortcut' => ('GTK::Roles::Orientable', 'GTK::Box', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::StackSidebar' => ('GTK::Bin', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::Statusbar' => ('GTK::Roles::Signals::Statusbar', 'GTK::Roles::Orientable', 'GTK::Box', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::ToggleButton' => ('GTK::Roles::Actionable', 'GTK::Button', 'GTK::Bin', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::ToolItem' => ('GTK::Bin', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::ToolPalette' => ('GTK::Roles::Orientable', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::TreeView' => ('GTK::Roles::Signals::TreeView', 'GTK::Roles::Scrollable', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::Viewport' => ('GTK::Roles::Scrollable', 'GTK::Bin', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::VolumeButton' => ('GTK::Roles::Orientable', 'GTK::ScaleButton', 'GTK::Roles::Actionable', 'GTK::Button', 'GTK::Bin', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::Window' => ('GTK::Bin', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::ActionBar' => ('GTK::Bin', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::AppButton' => ('GTK::Roles::AppChooser', 'GTK::Roles::Signals::ComboBox', 'GTK::Roles::CellLayout', 'GTK::Roles::CellEditable', 'GTK::ComboBox', 'GTK::Bin', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::AspectFrame' => ('GTK::Frame', 'GTK::Bin', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::Assistant' => ('GTK::Window', 'GTK::Bin', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::CheckButton' => ('GTK::ToggleButton', 'GTK::Roles::Actionable', 'GTK::Button', 'GTK::Bin', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::CheckMenuItem' => ('GTK::Roles::Actionable', 'GTK::MenuItem', 'GTK::Bin', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::Dialog' => ('GTK::Window', 'GTK::Bin', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::Dialog::About' => ('GTK::Dialog', 'GTK::Window', 'GTK::Bin', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::Dialog::AppChooser' => ('GTK::Roles::AppChooser', 'GTK::Dialog', 'GTK::Window', 'GTK::Bin', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::Dialog::ColorChooser' => ('GTK::Roles::ColorChooser', 'GTK::Dialog', 'GTK::Window', 'GTK::Bin', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::Dialog::FileChooser' => ('GTK::Roles::FileChooser', 'GTK::Dialog', 'GTK::Window', 'GTK::Bin', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::Dialog::FontChooser' => ('GTK::Roles::FontChooser', 'GTK::Dialog', 'GTK::Window', 'GTK::Bin', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::Dialog::Message' => ('GTK::Dialog', 'GTK::Window', 'GTK::Bin', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::Dialog::PageSetupUnix' => ('GTK::Dialog', 'GTK::Window', 'GTK::Bin', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::Dialog::PrintUnix' => ('GTK::Dialog', 'GTK::Window', 'GTK::Bin', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::FlowBox' => ('GTK::Roles::Orientable', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::ListBox' => ('GTK::Roles::Signals::ListBox', 'GTK::Roles::Actionable', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::Menu' => ('GTK::Roles::Signals::Menu', 'GTK::Roles::Signals::MenuShell', 'GTK::MenuShell', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::MenuBar' => ('GTK::Roles::Signals::MenuShell', 'GTK::MenuShell', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::MenuButton' => ('GTK::ToggleButton', 'GTK::Roles::Actionable', 'GTK::Button', 'GTK::Bin', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::Offscreen' => ('GTK::Window', 'GTK::Bin', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::Places' => ('GTK::Roles::Signals::Places', 'GTK::Roles::Signals::ScrolledWindow', 'GTK::ScrolledWindow', 'GTK::Bin', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::RadioButton' => ('GTK::CheckButton', 'GTK::ToggleButton', 'GTK::Roles::Actionable', 'GTK::Button', 'GTK::Bin', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::SeparatorToolItem' => ('GTK::ToolItem', 'GTK::Bin', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::ShortcutsWindow' => ('GTK::Window', 'GTK::Bin', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::Stack' => ('GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::ToolButton' => ('GTK::Roles::Actionable', 'GTK::ToolItem', 'GTK::Bin', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::MenuToolButton' => ('GTK::Roles::Actionable', 'GTK::ToolButton', 'GTK::ToolItem', 'GTK::Bin', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::ToggleToolButton' => ('GTK::Roles::Actionable', 'GTK::ToolButton', 'GTK::ToolItem', 'GTK::Bin', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),
'GTK::RadioToolButton' => ('GTK::ToggleToolButton', 'GTK::Roles::Actionable', 'GTK::ToolButton', 'GTK::ToolItem', 'GTK::Bin', 'GTK::Roles::LatchedContents', 'GTK::Container', 'GTK::Roles::Types', 'GTK::Roles::Protection', 'GTK::Roles::Signals::Widget', 'GTK::Roles::Signals::Generic', 'GTK::Roles::References', 'GTK::Roles::Properties', 'GTK::Roles::Data', 'GTK::Roles::Buildable', 'GTK::Widget', 'Any', 'Mu'),

);
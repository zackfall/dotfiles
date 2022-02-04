from libqtile.widget.currentlayout import CurrentLayout
from libqtile.widget.groupbox import GroupBox
from libqtile.widget.prompt import Prompt
from libqtile.widget.windowname import WindowName
from libqtile.widget.chord import Chord
from libqtile.widget.textbox import TextBox
from libqtile.widget.textbox import TextBox
from libqtile.widget.clock import Clock
from libqtile.widget.quick_exit import QuickExit
from libqtile.widget.keyboardlayout import KeyboardLayout
from qtile_extras.widget.statusnotifier import StatusNotifier

widget_defaults = dict(
    font="UbuntuMono Nerd Font Bold",
    fontsize=14,
    padding=1,
)
extension_defaults = widget_defaults.copy()

primary_screen = [
    CurrentLayout(),
    GroupBox(),
    Prompt(),
    WindowName(),
    Chord(
        chords_colors={
            "launch": ("#ff0000", "#ffffff"),
        },
        name_transform=lambda name: name.upper(),
    ),
    TextBox("default config", name="default"),
    TextBox("Press &lt;M-r&gt; to spawn", foreground="#d75f5f"),
    StatusNotifier(icon_size=14),
    Clock(format="%Y-%m-%d %a %I:%M %p"),
    KeyboardLayout(configured_keyboards=["es"]),
]

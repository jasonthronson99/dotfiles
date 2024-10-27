from libqtile import bar, layout, qtile, widget
from libqtile.config import DropDown, Click, Drag, Group, Key, Match, ScratchPad, Screen
from libqtile.lazy import lazy
import subprocess
import os

# Autostart
def autostart():
    current_user = os.getlogin()
    subprocess.run(f'/home/{current_user}/.config/qtile/autostart.sh')
autostart()

# Important Variables
mod = "mod4"
terminal = "alacritty"
browser = "vivaldi"

keys = [
    # Switch Between Windows In Current Workspace
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move Windows Within Current Workspace
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Resize Windows Within Current Workspace
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Switch Window Layouts
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    # Window Keybindings
    Key([mod], "Q", lazy.window.kill(), desc="Kill focused window"),
    Key([mod], "f", lazy.window.toggle_fullscreen(), desc="Max"),
    Key([mod], "t", lazy.window.toggle_floating(), desc="Toggle floating"),
    # Important Qtile Keybindings
    Key([mod], "r", lazy.reload_config(), desc="Reload config"),
    Key([mod], "x", lazy.spawn("archlinux-logout"), desc="Close qtile"),
    Key([mod], "d", lazy.spawn("rofi -show drun"), desc="Open Rofi"),
    # Application Keybindings 
    Key([mod], "Return", lazy.spawn(terminal), desc="Open Terminal"),
    Key([mod], "w", lazy.spawn(browser), desc="Open Browser"), 
]

groups = [Group(i) for i in "123456789"]
for i in groups:
    keys.extend([
            # Mod + Workspace Number: Switch Workspaces
            Key([mod], i.name, lazy.group[i.name].toscreen(), desc="Switch to group {}".format(i.name), ),
            # Mod + Shift + Workspace Number = Move Apps To Workspaces
            Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True), desc="Switch to & move focused window to group {}".format(i.name), ),
        ])
# Layouts I Use
layouts = [layout.Bsp(margin = 2), layout.Matrix(margin = 2)]

# Scratchpads (Name, Launch Command)
groups.append(ScratchPad('0', [
        DropDown('Alacritty','alacritty', height = 0.8, width = 0.8, opacity = 0.6),
        DropDown('Btop', 'alacritty -e btop', height = 0.8, width = 0.8, opacity = 0.6),
    # Don't Touch The Line Below
    ]))

# Scratchpad Keybindings
keys.extend([
    Key([mod],'b',lazy.group['0'].dropdown_toggle('Alacritty')),
    
])

# Bar Configuration
widget_defaults = dict(font="sans", fontsize=15, padding=3,)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar([
            widget.CurrentLayout(padding = 5),
            widget.Sep(),
            widget.GroupBox(padding = 3),
            widget.Sep(),
            widget.Spacer(length = bar.STRETCH),
            widget.Clock(format="%m/%d/%y %H:%M", padding = 3),
            widget.Sep(),
            widget.TextBox("Battery:"),
            widget.Battery(format='{percent:1.0%}', padding = 3),
            widget.Sep(),
            widget.Systray(padding = 2),
            ], 30),
        ),
    ]

# Random Configs That You Shouldn't Touch Unless You Have To
dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True


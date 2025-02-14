from libqtile import bar, layout, qtile, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
import os
import subprocess

mod = "mod4"
session_type = os.getenv("XDG_SESSION_TYPE")
wallpaper = os.path.expanduser("~/MEGA/Pictures/Wallpapers/wall3.png")

if session_type == "wayland":
    terminal = "foot"
    subprocess.Popen(["swaybg", "-i", wallpaper, "-m", "fill"])
elif session_type == "x11":
    terminal = "alacritty"
    subprocess.Popen(["feh", "--bg-fill", wallpaper])

keys = [
    # Switch Between Windows
    Key([mod], "left", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "right", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "down", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "up", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move Windows Between Left/Right Columns OR Move Up/Down In Current Stack
    Key([mod, "shift"], "left", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "right", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "up", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "down", lazy.layout.shuffle_up(), desc="Move window up"),
    # Change Size Of Windows
    Key([mod, "control"], "left", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "right", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "up", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "down", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Launch Applications Using Specific Keys
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "d", lazy.spawn("/nix/store/infwjafl44v4gikpzjc6d15dq7lnpq5c-profile/bin/rofi -show drun"), desc="Rofi"),
    Key([mod], "w", lazy.spawn("~/.config/qtile/wallpaper.sh"), desc="Change wallpapers"),
    # Useful System-Based Keys
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([mod], "f", lazy.window.toggle_fullscreen(), desc="Toggle fullscreen on the focused window"),
    Key([mod], "t", lazy.window.toggle_floating(), desc="Toggle floating on the focused window"),
    Key([mod, "shift"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod], "x", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
]

# Uncomment All Of This If Using Wayland
for vt in range(1, 8):
    keys.append(
        Key(
            ["control", "mod1"],
            f"f{vt}",
            lazy.core.change_vt(vt).when(func=lambda: qtile.core.name == "wayland"),
            desc=f"Switch to VT{vt}",
        )
    )

groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend([
            # Mod + Group Number = Switch To Group
            Key([mod], i.name, lazy.group[i.name].toscreen(),),
            # Mod + Shift + Group Number = Move Program To Group
            Key([mod, "shift"], i.name, lazy.window.togroup(i.name),),
        ])

layouts = [layout.Columns(margin=6), layout.Matrix(margin=6),]

widget_defaults = dict(font="sans", fontsize=14, padding=5,)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.CurrentLayout(foreground="#28bbbb"),
                widget.GroupBox(),
                widget.WindowName(foreground="#28bbbb"),
                widget.Chord(
                    chords_colors={
                        "launch": ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                # Systray If X11, StatusNotifier If Wayland
                widget.StatusNotifier(),
                widget.Systray(),
                widget.Clock(format="%a %m/%d/%Y %I:%M %p", foreground="#28bbbb"),
                widget.QuickExit(default_text="[Logout]", foreground="#3328bb"),
                widget.BatteryIcon(),
                widget.Battery(format='{percent:2.0%}'),
            ],
            24,
            background="#DFBD69",
            border_width=[2, 2, 2, 2],  # Draw top and bottom borders
            border_color=["ff00ff", "ff00ff", "ff00ff", "ff00ff"]  # Borders are magenta
        ),
        # Uncomment This Variable If You See X11 Being Laggy
        # x11_drag_polling_rate = 60,
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# Should We Respect Apps That Want To Auto-Minimize When Losing Focus?
auto_minimize = True

# Use This To Configure Input Devices When Using Wayland
wl_input_rules = None

# Xcursor Theme (String Or None) & Size (Integer) For Wayland Backend
wl_xcursor_theme = None
wl_xcursor_size = 24

# Change This If You Use A Lot Of Java Applications
wmname = "LG3D"

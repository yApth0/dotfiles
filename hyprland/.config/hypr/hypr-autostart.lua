hl.on("hyprland.start", function () 
  hl.exec_cmd("hyprpaper -c ~/.config/hypr/hyprpaper.conf")
  hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme \"prefer-dark\"")
  hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme \"adw-gtk3\"")
  hl.exec_cmd("waybar &")
  hl.exec_cmd("nm-applet --indicator")
end)


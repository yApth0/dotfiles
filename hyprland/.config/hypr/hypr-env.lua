-- fixes background-blur on ghostty
hl.env("GDK_WAYLAND_DISABLE", "ext_background_effect_manager_v1") 

-- nvidia stuff
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")

-- default stuff
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- fixes keyboard not recognizing dead keys on abnt2
hl.env("GTK_IM_MODULE", "simple")
hl.env("QT_IM_MODULE", "simple")
hl.env("XMODIFIERS", "@im=null")

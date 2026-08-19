hl.config({
    general = {
        border_size = 0,
        gaps_in = 1,
        gaps_out = 0,
        float_gaps = 0,
        gaps_workspaces = 0,
        layout = "dwindle",
        no_focus_fallback = false,
        resize_on_border = false,
        extend_border_grab_area = 15,
        hover_icon_on_border = true,
        allow_tearing = false,
        resize_corner = 0,
        modal_parent_blocking = true,
        snap = {
            enabled = true,
            window_gap = 20,
            monitor_gap = 20,
            border_overlap = true,
            respect_gaps = false,
        },
        col = {
            active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
            inactive_border = "rgba(595959aa)",
            nogroup_border = "rgba(ffffaaff)",
            nogroup_border_active = "rgba(ffff00ff)",
        },
    },
})


hl.config({
    decoration = {
        rounding = 2,
        active_opacity = 0.98,
        inactive_opacity = 0.9,
        blur = {
            enabled = true,
            size = 1,
            passes = 1,
            ignore_opacity = true,
            new_optimizations = true,
            xray = true,
            brightness = 1.8,
            vibrancy = 0.18,
            vibrancy_darkness = 0.15,
            special = false,
            popups = true,
            popups_ignorealpha = 0.2,
            input_methods = false,
            input_methods_ignorealpha = 0.2,
        },
    },
})


hl.config({
    input = {
        kb_layout = "us",
        follow_mouse = 1,
        resolve_binds_by_sym = true,
        repeat_delay = 400,
        repeat_rate = 50,
        sensitivity = 0.6,
        force_no_accel = false,
        touchpad = {
            natural_scroll = true,
        },
    },
})

hl.config({
    misc = {
        disable_hyprland_logo = true,
    },
})


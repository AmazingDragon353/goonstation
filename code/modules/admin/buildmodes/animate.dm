/datum/buildmode/animate
	name = "Animate"
	desc = {"***********************************************************<br>
Right Mouse Button on buildmode button = Pick animation<br>
Left Mouse Button on turf/mob/obj      = Animate!<br>
***********************************************************"}
	icon_state = "buildmode_zap"
	var/animation = null
	var/list/animations = list( // generated by: awk -F '(' '/^\/proc/ {print "\t\t" $1 ","}'  < AnimationLibrary.dm
		/proc/animate_buff_in,
		/proc/animate_buff_out,
		/proc/animate_fade_grayscale,
		/proc/animate_fade_from_grayscale,
		/proc/animate_melt_pixel,
		/proc/animate_explode_pixel,
		/proc/animate_weird,
		/proc/animate_door_squeeze,
		/proc/animate_flockdrone_item_absorb,
		/proc/animate_flock_convert_complete,
		/proc/animate_flock_drone_split,
		/proc/animate_flock_passthrough,
		/proc/animate_flock_floorrun_start,
		/proc/animate_flock_floorrun_end,
		/proc/animate_tile_dropaway,
		/proc/attack_particle,
		/proc/interact_particle,
		/proc/pickup_particle,
		/proc/pull_particle,
		/proc/unpull_particle,
		/proc/block_begin,
		/proc/block_spark,
		/proc/sprint_particle,
		/proc/sprint_particle_small,
		/proc/sprint_particle_tiny,
		/proc/attack_twitch,
		/proc/hit_twitch,
		/proc/violent_twitch,
		/proc/violent_standup_twitch,
		/proc/violent_standup_twitch_parametrized,
		/proc/eat_twitch,
		/proc/animate_portal_appear,
		/proc/animate_portal_tele,
		/proc/animate_float,
		/proc/animate_levitate,
		/proc/animate_revenant_shockwave,
		/proc/animate_glitchy_freakout,
		/proc/animate_fading_leap_up,
		/proc/animate_fading_leap_down,
		/proc/animate_shake,
		/proc/animate_teleport,
		/proc/animate_teleport_wiz,
		/proc/animate_rainbow_glow_old,
		/proc/animate_rainbow_glow,
		/proc/animate_fade_to_color_fill,
		/proc/animate_flash_color_fill,
		/proc/animate_flash_color_fill_inherit,
		/proc/animate_clownspell,
		/proc/animate_wiggle_then_reset,
		/proc/animate_blink,
		/proc/animate_bullspellground,
		/proc/animate_spin,
		/proc/animate_peel_slip,
		/proc/animate_handspider_flipoff,
		/proc/animate_bumble,
		/proc/animate_beespin,
		/proc/animate_emote,
		/proc/animate_horizontal_wiggle,
		/proc/animate_slide,
		/proc/animate_rest,
		/proc/animate_flip,
		/proc/animate_offset_spin,
		/proc/animate_shockwave,
		/proc/animate_glitchy_fuckup1,
		/proc/animate_glitchy_fuckup2,
		/proc/animate_glitchy_fuckup3,
		/proc/showswirl,
		/proc/leaveresidual,
		/proc/leavepurge,
		/proc/leavescan,
		/proc/sponge_size,
		/proc/animate_storage_rustle,
		/proc/shrink_teleport,
		/proc/spawn_animation1,
		/proc/leaving_animation,
		/proc/heavenly_spawn,
		/proc/demonic_spawn,
		/proc/animate_scanning,
		/proc/animate_storage_thump,
		/proc/animate_turf_slideout,
		/proc/animate_turf_slideout_cleanup,
		/proc/animate_turf_slidein,
		/proc/animate_turf_slidein_cleanup,
		/proc/animate_open_from_floor,
		/proc/animate_close_into_floor,
		/proc/anim_f_ghost_blur,
		/proc/animate_bouncy,
		/proc/animate_wave,
		/proc/animate_ripple,
		/proc/animate_stomp
	)

	New()
		..()
		animation = null
		update_button_text("Animate")

	click_mode_right(var/ctrl, var/alt, var/shift)
		var/animationpick = input("Select animation.", "anim8", null) in animations
		if (animationpick)
			animation = animationpick
			update_button_text("Animate: [animationpick]")

	click_left(atom/object, var/ctrl, var/alt, var/shift)
		if (animation)
			call(animation)(object)

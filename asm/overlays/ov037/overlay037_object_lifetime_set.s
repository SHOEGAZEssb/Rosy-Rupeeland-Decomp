.text

/* Exact fallback; see src/overlays/ov037/overlay037_scene_spawn_update.c for documented portable C. */


    .global func_ov037_021fdf50
func_ov037_021fdf50:
    mov r1, r1, lsl #0x10
    mov r1, r1, asr #0x10
    str r1, [r0, #0x7c]
    mov r1, #0x0
    str r1, [r0, #0x80]
    bx lr
    .size func_ov037_021fdf50, .-func_ov037_021fdf50

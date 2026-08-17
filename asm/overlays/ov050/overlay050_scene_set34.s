.text
; Matching fallback for the portable implementation in src/overlays/ov050/overlay050_scene_helpers.c.

.global Overlay050Scene_SetChildValue34
Overlay050Scene_SetChildValue34:
    mov r3, #0x0
.L_0220e270:
    add r2, r0, r3, lsl #0x2
    ldr r2, [r2, #0x1c]
    add r3, r3, #0x1
    str r1, [r2, #0x34]
    cmp r3, #0x4
    blt .L_0220e270
    mov r1, #0x0
    str r1, [r0, #0x40]
    bx lr
.size Overlay050Scene_SetChildValue34, . - Overlay050Scene_SetChildValue34

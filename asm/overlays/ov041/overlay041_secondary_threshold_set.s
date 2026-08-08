.text

/* Exact fallback for the documented portable C implementation in
 * src/overlays/ov041/overlay041_secondary_object_helpers.c. */
.extern Sound_Play
.extern func_020594a4
.extern gSoundContext

    .global func_ov041_02200970
func_ov041_02200970: ; 0x02200970
    stmdb sp!, {r3, lr}
    ldr r2, [r0, #0x48]
    mov r1, r1, lsl #0xc
    ldr r2, [r2, #0x1f4]
    cmp r2, #0x2
    addeq r1, r1, #0x50000
    streq r1, [r0, #0x15c]
    ldmeqia sp!, {r3, pc}
    add r2, r1, #0xc0000
    ldr r1, .L_022009e0
    str r2, [r0, #0x15c]
    ldr r0, [r1, #0x0]
    ldr r1, .L_022009e4
    mov r2, #0x8
    bl func_020594a4
    cmp r0, #0x0
    ldmneia sp!, {r3, pc}
    ldr r0, .L_022009e0
    ldr r1, .L_022009e4
    ldr r0, [r0, #0x0]
    mov r2, #0x8
    bl Sound_Play
    ldr r0, .L_022009e0
    ldr r1, .L_022009e4
    ldr r0, [r0, #0x0]
    mov r2, #0xc
    bl Sound_Play
    ldmia sp!, {r3, pc}
.L_022009e0: .word gSoundContext
.L_022009e4: .word 0x12d
    .size func_ov041_02200970, . - func_ov041_02200970


.text
/* Exact fallback; see overlay039_resource_objects.c for portable C. */
    .extern Sound_Play
    .extern gSoundContext
    .global func_ov039_02204974
func_ov039_02204974:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x3a4]
    cmp r0, #0xa
    bge L_022049ac
    add r0, r0, #0x1
    str r0, [r4, #0x3a4]
    cmp r0, #0xa
    bne L_022049ac
    ldr r0, L_022049c4
    ldr r1, L_022049c8
    ldr r0, [r0, #0x0]
    mov r2, #0x9
    bl Sound_Play
L_022049ac:
    ldr r0, [r4, #0x398]
    subs r0, r0, #0xf6
    str r0, [r4, #0x398]
    movmi r0, #0x0
    strmi r0, [r4, #0x398]
    ldmia sp!, {r4, pc}
L_022049c4: .word gSoundContext
L_022049c8: .word 0x1c5
    .size func_ov039_02204974, .-func_ov039_02204974


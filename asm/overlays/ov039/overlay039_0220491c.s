.text
/* Exact fallback; see overlay039_resource_objects.c for portable C. */
    .extern Sound_StopEffect
    .extern gSoundContext
    .global func_ov039_0220491c
func_ov039_0220491c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x3a4]
    cmp r0, #0x0
    ble L_02204950
    subs r0, r0, #0x1
    str r0, [r4, #0x3a4]
    bne L_02204950
    ldr r0, L_0220496c
    ldr r1, L_02204970
    ldr r0, [r0, #0x0]
    mov r2, #0x9
    bl Sound_StopEffect
L_02204950:
    ldr r0, [r4, #0x398]
    add r0, r0, #0xf6
    str r0, [r4, #0x398]
    cmp r0, #0x1000
    movgt r0, #0x1000
    strgt r0, [r4, #0x398]
    ldmia sp!, {r4, pc}
L_0220496c: .word gSoundContext
L_02204970: .word 0x1c5
    .size func_ov039_0220491c, .-func_ov039_0220491c


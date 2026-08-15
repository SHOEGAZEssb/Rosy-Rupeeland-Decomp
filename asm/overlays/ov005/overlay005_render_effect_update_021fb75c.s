    .text
    .extern Presentation_AdvanceTransitions
    .extern func_02091c7c
    .extern func_02091b98
    .extern func_020918f4
    .extern GraphicsSpriteGroup_CreateStateFromSource
    .extern func_0209189c
    .extern func_02073e48

    /* Exact fallback; see the documented portable reconstruction in
     * src/overlays/ov005/overlay005_render_effect_update.c. */
    .global func_ov005_021fb75c
func_ov005_021fb75c: ; 0x021fb75c
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0xc
    mov r8, r0
    bl Presentation_AdvanceTransitions
    mov r5, r0
    add r0, r8, #0xb0
    mov r1, #0x2
    bl func_02091c7c
    cmp r0, #0x0
    beq L_021fb81c
    ldr r2, [r8, #0x20]
    add r0, r8, #0xb0
    mov r1, r2, asr #0xb
    add r2, r2, r1, lsr #0x14
    mov r1, #0x8
    mov r6, r2, asr #0xc
    bl func_02091b98
    add r0, r8, #0xac
    mov r1, #0x2
    bl func_020918f4
    cmp r0, #0x0
    movne r9, #0x140
    ldr r0, [r8, #0xa8]
    add r1, r8, #0x9c
    mov r2, #0x1
    moveq r9, #0x100
    ldr r7, [r8, #0x10]
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r4, r0
    add r0, r8, #0xac
    mvn r1, #0x1f
    mov r2, #0x20
    bl func_0209189c
    ldr r1, L_021fb828
    mov r2, r9, lsl #0x10
    sub r8, r1, r6
    mov r1, r2, lsr #0x10
    mov r2, #0x3
    stmia sp, {r2, r8}
    str r1, [sp, #0x8]
    mov r1, r7, asr #0xb
    mov r3, r6
    mov r6, r0
    add r1, r7, r1, lsr #0x14
    add r2, r6, r1, asr #0xc
    mov r0, r4
    mov r1, #0x0
    bl func_02073e48
L_021fb81c:
    mov r0, r5
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
L_021fb828: .word 0x7fff
    .size func_ov005_021fb75c, .-func_ov005_021fb75c

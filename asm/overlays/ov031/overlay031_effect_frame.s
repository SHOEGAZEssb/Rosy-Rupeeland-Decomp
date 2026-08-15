.text

/* Exact fallback; see src/overlays/ov031/overlay031_effect_runtime.c for documented portable C. */
.extern GraphicsSpriteGroup_AdvanceAnimations
.extern func_0209189c
.extern PresentationScalar_TransitionTo
.extern func_ov031_021fd684


    .global func_ov031_021fd5c0
func_ov031_021fd5c0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0xb4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
    cmp r0, #0x0
    beq L_021fd644
    mov r1, #0x400
    add r0, r4, #0x150
    rsb r1, r1, #0x0
    mov r2, #0x400
    bl func_0209189c
    mov r2, r0
    add r0, r4, #0xc0
    mov r1, #0x2
    bl PresentationScalar_TransitionTo
    mov r1, #0x200
    add r0, r4, #0x150
    rsb r1, r1, #0x0
    mov r2, #0x200
    bl func_0209189c
    mov r2, r0
    add r0, r4, #0xd0
    mov r1, #0x2
    bl PresentationScalar_TransitionTo
    add r0, r4, #0x150
    mov r1, #0x8
    mov r2, #0x10
    bl func_0209189c
    mov r1, r0
    add r0, r4, #0xb4
    bl func_ov031_021fd684
L_021fd644:
    ldr r2, [r4, #0xc4]
    ldr r3, [r4, #0xd4]
    mov r1, r2, asr #0x7
    mov r0, r3, asr #0x7
    add r1, r2, r1, lsr #0x18
    add r0, r3, r0, lsr #0x18
    ldr r2, [r4, #0x54]
    mov r1, r1, asr #0x8
    str r1, [r2, #0x18]
    mov r0, r0, asr #0x8
    str r0, [r2, #0x1c]
    ldr r0, [r4, #0x54]
    bl GraphicsSpriteGroup_AdvanceAnimations
    ldr r0, [r4, #0x58]
    bl GraphicsSpriteGroup_AdvanceAnimations
    ldmia sp!, {r4, pc}
.size func_ov031_021fd5c0, .-func_ov031_021fd5c0

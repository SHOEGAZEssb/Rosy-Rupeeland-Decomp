; Matching retail form; see src/game/game_phase_visual_effect_update.c.
.text
.extern gGamePhaseRuntime
.extern GamePhaseVisualEffect_ApplyBlend
.extern GraphicsResourceSet_ApplyToMainBg
.extern func_020af958
.extern func_020b581c

    .global GamePhaseVisualEffect_Update
GamePhaseVisualEffect_Update: ; 0x0200fc64
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r0, [r4, #0x94]
    mov r2, #0x4000000
    mov r0, r0, lsl #0x1f
    movs r0, r0, asr #0x1f
    beq L_0200fdd8
    ldr r1, [r2, #0x0]
    ldr r0, [r2, #0x0]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x2
    orr r0, r1, r0, lsl #0x8
    str r0, [r2, #0x0]
    ldr r0, [r4, #0x94]
    mov r1, r0, lsl #0x1e
    movs r1, r1, asr #0x1f
    beq L_0200fd08
    bic r0, r0, #0x2
    str r0, [r4, #0x94]
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq L_0200fcec
    add r0, r4, #0x4
    mov r1, #0x1
    mov r2, #0x1e0
    bl GraphicsResourceSet_ApplyToMainBg
L_0200fcec:
    ldr r2, L_0200fdfc
    ldr r0, [r4, #0x94]
    ldrh r1, [r2, #0x0]
    mov r0, r0, lsl #0x18
    bic r1, r1, #0x3
    orr r0, r1, r0, lsr #0x1c
    strh r0, [r2, #0x0]
L_0200fd08:
    ldr r1, [r4, #0x38]
    ldr r0, L_0200fe00
    ldr r3, [r4, #0x34]
    mov r2, r1, asr #0xc
    mov r1, r0, lsl #0x10
    and r3, r0, r3, asr #0xc
    and r0, r1, r2, lsl #0x10
    orr r2, r3, r0
    ldr r1, L_0200fe04
    mov r0, r4
    str r2, [r1, #0x0]
    bl GamePhaseVisualEffect_ApplyBlend
    ldr r0, L_0200fe08
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3000
    ldrb r0, [r0, #0xcc]
    tst r0, #0x4
    ldmneia sp!, {r4, pc}
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    ldrne r0, [r4, #0x98]
    cmpne r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x14]
    subs r0, r0, #0x1
    str r0, [r4, #0x14]
    ldmplia sp!, {r4, pc}
    ldr r0, [r4, #0x10]
    add r0, r4, r0, lsl #0x1
    ldrsh r0, [r0, #0x9c]
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x14
    str r0, [r4, #0x14]
    bl func_020af958
    ldr r1, [r4, #0x10]
    ldr r3, [r4, #0x4]
    add r1, r4, r1, lsl #0x1
    ldrsh r2, [r1, #0x9c]
    mov r1, r0
    ldr r3, [r3, #0x24]
    mov r0, r2, lsl #0x1c
    mov r0, r0, asr #0x1c
    add r0, r3, r0, lsl #0xb
    mov r2, #0x800
    bl func_020b581c
    ldr r0, [r4, #0x10]
    add r0, r0, #0x1
    str r0, [r4, #0x10]
    cmp r0, #0x4
    movge r0, #0x0
    strge r0, [r4, #0x10]
    ldmia sp!, {r4, pc}
L_0200fdd8:
    ldr r1, [r2, #0x0]
    ldr r0, [r2, #0x0]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    bic r0, r3, #0x2
    orr r0, r1, r0, lsl #0x8
    str r0, [r2, #0x0]
    ldmia sp!, {r4, pc}
L_0200fdfc: .word 0x400000a
L_0200fe00: .word 0x1ff
L_0200fe04: .word 0x4000014
L_0200fe08: .word gGamePhaseRuntime
    .size GamePhaseVisualEffect_Update, . - GamePhaseVisualEffect_Update


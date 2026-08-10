.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.
.extern data_021052fc
.extern func_0201e0ec
.extern ActorExtendedType2_InitializeReentryState
.extern func_020593dc
.extern func_0206e590
.extern func_020a2844
.extern func_ov095_0221ae14
.extern gSoundContext

.global func_ov095_0221ac6c
func_ov095_0221ac6c:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x8
    mov r8, r0
    bl ActorExtendedType2_InitializeReentryState
    ldr r0, [r8, #0x1fc]
    cmp r0, #0x0
    ble .L_0221acd8
    mov r0, r8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x200]
    blx r1
    ldr r1, [r8, #0x314]
    add r0, r8, #0x200
    bic r2, r1, #0x3f0000
    bic r1, r2, #0x80000000
    orr r1, r1, #0x80000000
    str r1, [r8, #0x314]
    mov r1, #0x7
    strh r1, [r0, #0xde]
    ldr r0, [r8, #0x314]
    bic r0, r0, #0x3fc00000
    orr r0, r0, #0xa000000
    str r0, [r8, #0x314]
    ldr r0, [r8, #0x260]
    bic r0, r0, #0x9
    str r0, [r8, #0x260]
    b .L_0221ae04
.L_0221acd8:
    ldr r0, .L_0221ae0c
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201e0ec
    mov r1, #0x8
    str r1, [sp, #0x0]
    ldr r1, [r8, #0x24]
    ldr r3, [r8, #0x1c]
    ldr r2, [r8, #0x20]
    mov r1, r1, asr #0xc
    rsb r1, r1, r2, asr #0xc
    mov r2, r3, asr #0xc
    sub r3, r1, #0x18
    mov r1, #0x0
    mov r6, r0
    bl func_020a2844
    ldr r0, .L_0221ae0c
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    ldr r0, [r0, #0x26c]
    cmp r0, #0x0
    beq .L_0221ad40
    mov r1, #0x1
    bl func_0206e590
.L_0221ad40:
    ldr r0, .L_0221ae0c
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea8]
    cmp r0, #0x0
    ldrne r0, [r0, #0x234]
    cmpne r0, #0x0
    beq .L_0221ad68
    mov r1, #0x1
    bl func_0206e590
.L_0221ad68:
    mov r7, #0x0
    mov r5, #0x3
    mov r4, r7
.L_0221ad74:
    add r0, r8, r7, lsl #0x2
    ldr r0, [r0, #0x304]
    bl func_ov095_0221ae14
    cmp r0, #0x0
    bne .L_0221add0
    add r0, r8, r7, lsl #0x2
    ldr r0, [r0, #0x304]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x100]
    blx r1
    add r0, r8, r7, lsl #0x2
    ldr r3, [r0, #0x304]
    mov r0, r6
    str r5, [sp, #0x0]
    ldr r1, [r3, #0x24]
    ldr r2, [r3, #0x1c]
    ldr r3, [r3, #0x20]
    mov r2, r2, asr #0xc
    mov r1, r1, asr #0xc
    rsb r3, r1, r3, asr #0xc
    mov r1, r4
    sub r3, r3, #0x18
    bl func_020a2844
.L_0221add0:
    add r7, r7, #0x1
    cmp r7, #0x4
    blt .L_0221ad74
    mov r0, #0x0
    mov r1, #0x200
    str r0, [sp, #0x0]
    ldr r0, .L_0221ae10
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r3, r8
    sub r1, r1, #0x12
    mov r2, #0xa
    bl func_020593dc
.L_0221ae04:
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_0221ae0c: .word data_021052fc
.L_0221ae10: .word gSoundContext
.size func_ov095_0221ac6c, . - func_ov095_0221ac6c

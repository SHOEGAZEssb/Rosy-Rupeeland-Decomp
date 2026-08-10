.text
; Matching fallback for the portable implementation in src/overlays/ov063/overlay063_recovery.c.
.extern data_021052fc
.extern func_0200500c
.extern func_02005058
.extern ActorMotionAreaFollower_GetPosition
.extern GamePhaseState_UpdateRenderHelpers
.extern GamePhaseAreaScene_Update
.extern func_020a6aa8

.global func_ov063_022101c4
func_ov063_022101c4:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    ldr r1, .L_02210288
    mov r4, r0
    ldr r0, [r1, #0x0]
    add r0, r0, #0x24
    bl GamePhaseState_UpdateRenderHelpers
    ldr r0, [r4, #0x4c]
    cmp r0, #0x0
    beq .L_022101f8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc0]
    blx r1
.L_022101f8:
    ldr r0, [r4, #0x50]
    mov r0, r0, lsl #0x1f
    movs r0, r0, asr #0x1f
    beq .L_02210250
    mov r1, #0x0
    add r0, sp, #0x0
    mov r2, r1
    mov r3, r1
    bl func_0200500c
    ldr r0, .L_02210288
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotionAreaFollower_GetPosition
    ldr r2, [r4, #0x50]
    mov r1, r0
    mov r2, r2, lsl #0x11
    add r0, r4, #0x28
    mov r2, r2, asr #0x12
    bl func_020a6aa8
    add r0, sp, #0x0
    bl func_02005058
.L_02210250:
    ldr r1, [r4, #0x24]
    cmp r1, #0x0
    ldrne r0, [r1, #0x20]
    eorne r0, r0, #0x1
    strne r0, [r1, #0x20]
    bne .L_0221027c
    ldr r0, .L_02210288
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xfb8]
    bl GamePhaseAreaScene_Update
.L_0221027c:
    mov r0, #0x0
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.L_02210288: .word data_021052fc
.size func_ov063_022101c4, . - func_ov063_022101c4

.text
; Matching fallback for the portable implementation in src/overlays/ov062/overlay062_recovery.c.
.extern SceneManager_GetCurrent
.extern data_020c9670
.extern data_021052fc
.extern func_02005058
.extern func_020050a4
.extern VecFx32Bezier_Evaluate3D
.extern func_02008e10
.extern func_02009d78
.extern Actor_RefreshTerrainHeight
.extern func_020befec
.extern gSceneManager

.global func_ov062_022109d4
func_ov062_022109d4:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x1c
    ldr r1, .L_02210b08
    mov r4, r0
    ldr r0, [r1, #0x0]
    bl SceneManager_GetCurrent
    cmp r0, r4
    movne r0, #0x0
    bne .L_02210b00
    ldr r0, .L_02210b0c
    mov r1, #0x2
    ldr r0, [r0, #0x0]
    bl func_02008e10
    ldr r0, [r4, #0x2c]
    add r1, r0, #0x1
    str r1, [r4, #0x2c]
    ldr r0, [r4, #0x30]
    cmp r1, r0
    strgt r0, [r4, #0x2c]
    ldr r0, [r4, #0x2c]
    ldr r1, [r4, #0x30]
    mov r0, r0, lsl #0xc
    bl func_020befec
    mov r2, r0
    ldr r1, [r4, #0x28]
    add r0, sp, #0xc
    bl VecFx32Bezier_Evaluate3D
    ldr r0, [r4, #0x2c]
    ldr r1, [r4, #0x30]
    mov r0, r0, lsl #0xf
    bl func_020befec
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r0, asr #0x4
    ldr r0, .L_02210b10
    mov r1, r1, lsl #0x2
    ldrsh r0, [r0, r1]
    ldr r3, [sp, #0x18]
    ldr r2, [r4, #0x34]
    add r1, sp, #0xc
    mla r0, r2, r0, r3
    str r0, [sp, #0x18]
    ldr r0, [r4, #0x24]
    add r0, r0, #0x18
    bl func_020050a4
    ldr r0, [r4, #0x24]
    bl Actor_RefreshTerrainHeight
    ldr r0, .L_02210b0c
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl func_02009d78
    ldr r1, [r4, #0x24]
    mov r2, r0
    ldr r3, [r1, #0x0]
    add r0, sp, #0x0
    ldr r3, [r3, #0x58]
    blx r3
    ldr r1, [r4, #0x2c]
    ldr r0, [r4, #0x30]
    cmp r1, r0
    bne .L_02210af4
    cmp r4, #0x0
    beq .L_02210ae4
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02210ae4:
    add r0, sp, #0xc
    bl func_02005058
    mov r0, #0x1
    b .L_02210b00
.L_02210af4:
    add r0, sp, #0xc
    bl func_02005058
    mov r0, #0x0
.L_02210b00:
    add sp, sp, #0x1c
    ldmia sp!, {r3, r4, pc}
.L_02210b08: .word gSceneManager
.L_02210b0c: .word data_021052fc
.L_02210b10: .word data_020c9670
.size func_ov062_022109d4, . - func_ov062_022109d4

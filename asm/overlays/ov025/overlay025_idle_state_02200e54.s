.text

/* Exact fallback; see src/overlays/ov025/overlay025_idle_state.c. */
.extern data_ov025_02202e18
.extern data_ov025_02202e28
.extern TitleInterpolatedValue_Configure
.extern func_02091c7c
.extern func_02091cf0
.extern SceneSound_PlayPackedEffect
.extern func_ov025_021ff254
.extern func_ov025_02200178
.extern func_ov025_022001f4
.extern func_ov025_02200824
.extern GameWork_SetFlag
.extern gGameWork


    .global func_ov025_02200e54
func_ov025_02200e54:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    ldr r1, [r4, #0x4]
    cmp r1, #0x0
    beq L_02200e80
    cmp r1, #0x1
    beq L_02200ec0
    cmp r1, #0x2
    beq L_02200f0c
    b L_02200fbc
L_02200e80:
    ldr r3, [r4, #0xbc]
    add r0, r4, #0x1fc
    ldrh r1, [r3, #0x24]
    mov r2, #0x10
    add r0, r0, #0x400
    bic r1, r1, #0x4
    strh r1, [r3, #0x24]
    str r2, [sp, #0x0]
    mov r1, #0x1
    mov r3, #0x100
    bl TitleInterpolatedValue_Configure
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_02200ec0:
    add r0, r4, #0x1fc
    add r0, r0, #0x400
    mov r1, #0x1
    bl func_02091c7c
    ldr r2, [r4, #0xbc]
    mov r1, #0x100
    strh r1, [r2, #0x32]
    add r1, r4, #0x1fc
    strh r0, [r2, #0x34]
    add r0, r1, #0x400
    bl func_02091cf0
    cmp r0, #0x0
    beq L_02200fbc
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_02200fbc
L_02200f0c:
    mov r1, #0x4
    bl func_ov025_02200824
    ldr r0, [r4, #0x20]
    mov r0, r0, lsl #0x1a
    movs r0, r0, asr #0x1f
    beq L_02200f88
    ldr r1, L_02200fd0
    mov r0, r4
    bl SceneSound_PlayPackedEffect
    ldr r1, [r4, #0xbc]
    mov r2, #0x0
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x4
    strh r0, [r1, #0x24]
    mov r1, #0x1
L_02200f48:
    add r0, r4, r2, lsl #0x2
    ldr r0, [r0, #0xe4]
    add r2, r2, #0x1
    ldr r0, [r0, #0xc]
    cmp r2, #0x3
    str r1, [r0, #0x20]
    blt L_02200f48
    mov r0, r4
    bl func_ov025_022001f4
    mov r0, #0x0
    ldr r1, L_02200fd4
    str r0, [r4, #0x5bc]
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov025_021ff254
    b L_02200fbc
L_02200f88:
    ldr r0, [r4, #0x5bc]
    add r0, r0, #0x1
    str r0, [r4, #0x5bc]
    cmp r0, #0x960
    ble L_02200fbc
    ldr r0, L_02200fd8
    ldr r1, L_02200fdc
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    ldr r1, L_02200fe0
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov025_021ff254
L_02200fbc:
    mov r0, r4
    bl func_ov025_02200178
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
L_02200fd0: .word 0x2d01
L_02200fd4: .word data_ov025_02202e18
L_02200fd8: .word gGameWork
L_02200fdc: .word 0x3d6
L_02200fe0: .word data_ov025_02202e28
.size func_ov025_02200e54, .-func_ov025_02200e54


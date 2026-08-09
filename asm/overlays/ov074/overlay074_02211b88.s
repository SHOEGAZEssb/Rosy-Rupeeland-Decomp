.text
; Matching fallback for the portable implementation in src/overlays/ov074/overlay074_recovery.c.
.extern data_021052fc
.extern func_02010104

.global func_ov074_02211b88
func_ov074_02211b88:
    stmdb sp!, {r4, lr}
    ldr r1, [r0, #0x14]
    mov r4, #0x0
    add ip, r1, #0x1
    str ip, [r0, #0x14]
    cmp ip, #0x7
    ble .L_02211bc8
    ldr r0, .L_02211c04
    mov r1, r4
    ldr r0, [r0, #0x0]
    mov r2, #0x10
    add r0, r0, #0x2d8
    add r0, r0, #0x2c00
    bl func_02010104
    mov r4, #0x1
    b .L_02211bfc
.L_02211bc8:
    ldr r3, [r0, #0x4]
    ldr r2, [r0, #0x8]
    ldr r1, [r0, #0xc]
    ldr r0, [r0, #0x10]
    mla r3, r2, ip, r3
    mla r2, r0, ip, r1
    ldr r0, .L_02211c04
    mov r1, r3, asr #0xc
    ldr r0, [r0, #0x0]
    mov r2, r2, asr #0xc
    add r0, r0, #0x2d8
    add r0, r0, #0x2c00
    bl func_02010104
.L_02211bfc:
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02211c04: .word data_021052fc
.size func_ov074_02211b88, . - func_ov074_02211b88

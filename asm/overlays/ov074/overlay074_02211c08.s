.text
; Matching fallback for the portable implementation in src/overlays/ov074/overlay074_recovery.c.
.extern data_021052fc
.extern func_02010104

.global func_ov074_02211c08
func_ov074_02211c08:
    stmdb sp!, {r4, lr}
    ldr r1, [r0, #0x14]
    mov r4, #0x0
    add r1, r1, #0x1
    cmp r1, #0x7
    str r1, [r0, #0x14]
    movgt r1, #0x7
    strgt r1, [r0, #0x14]
    ldr r1, .L_02211c6c
    ldr lr, [r0, #0x14]
    ldr ip, [r1, #0x0]
    ldr r3, [r0, #0x4]
    ldr r2, [r0, #0x8]
    ldr r1, [r0, #0x10]
    mla r3, r2, lr, r3
    ldr r2, [r0, #0xc]
    add r0, ip, #0x2d8
    mla r2, r1, lr, r2
    add r0, r0, #0x2c00
    mov r1, r3, asr #0xc
    mov r2, r2, asr #0xc
    movgt r4, #0x1
    bl func_02010104
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02211c6c: .word data_021052fc
.size func_ov074_02211c08, . - func_ov074_02211c08

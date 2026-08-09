.text
; Matching fallback for the portable implementation in src/overlays/ov079/overlay079_recovery.c.
.extern data_021052fc
.extern data_ov079_02213b08
.extern func_02007f0c
.extern func_020bf1f8
.extern func_ov079_02213458
.extern genrand_int32

.global func_ov079_0221323c
func_ov079_0221323c:
    stmdb sp!, {r4, lr}
    ldr r1, .L_02213294
    mov r4, r0
    ldr r2, [r1, #0x68]
    ldr r1, [r1, #0x6c]
    ldr r0, .L_02213298
    str r2, [r4, #0x298]
    str r1, [r4, #0x29c]
    ldr r0, [r0, #0x0]
    mov r1, #0x1
    bl func_02007f0c
    add r0, r0, #0x2000
    ldr r1, [r0, #0xe7c]
    mov r0, r4
    str r1, [r4, #0x228]
    bl func_ov079_02213458
    bl genrand_int32
    mov r1, #0x3c
    bl func_020bf1f8
    add r0, r1, #0xb4
    str r0, [r4, #0x2a0]
    ldmia sp!, {r4, pc}
.L_02213294: .word data_ov079_02213b08
.L_02213298: .word data_021052fc
.size func_ov079_0221323c, . - func_ov079_0221323c

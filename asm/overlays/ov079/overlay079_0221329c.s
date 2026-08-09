.text
; Matching fallback for the portable implementation in src/overlays/ov079/overlay079_recovery.c.
.extern data_ov079_02213b08
.extern func_020bf1f8
.extern genrand_int32

.global func_ov079_0221329c
func_ov079_0221329c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    cmp r1, #0x0
    beq .L_022132dc
    ldr r0, .L_0221330c
    ldr r2, [r0, #0x88]
    ldr r0, [r0, #0x8c]
    str r2, [r4, #0x298]
    str r0, [r4, #0x29c]
    str r1, [r4, #0x228]
    bl genrand_int32
    mov r1, #0x78
    bl func_020bf1f8
    add r0, r1, #0x78
    str r0, [r4, #0x2a0]
    ldmia sp!, {r4, pc}
.L_022132dc:
    ldr r0, .L_0221330c
    mov r1, #0xb4
    ldr r3, [r0, #0x0]
    ldr r2, [r0, #0x4]
    str r3, [r4, #0x298]
    str r2, [r4, #0x29c]
    ldr r2, [r0, #0xa8]
    ldr r0, [r0, #0xac]
    str r2, [r4, #0x220]
    str r0, [r4, #0x224]
    str r1, [r4, #0x2a4]
    ldmia sp!, {r4, pc}
.L_0221330c: .word data_ov079_02213b08
.size func_ov079_0221329c, . - func_ov079_0221329c

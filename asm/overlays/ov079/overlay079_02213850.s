.text
; Matching fallback for the portable implementation in src/overlays/ov079/overlay079_recovery.c.
.extern data_021052fc
.extern data_ov079_02213b08
.extern func_02007f0c
.extern func_0204cfa4
.extern func_ov079_0221329c

.global func_ov079_02213850
func_ov079_02213850:
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r0, #0x3
    strh r0, [r4, #0xd6]
    mov r0, #0x9
    strb r0, [r4, #0x24c]
    ldr r0, [r4, #0x2a0]
    cmp r0, #0x0
    bne .L_02213890
    ldr r0, [r4, #0x228]
    mov r1, #0x0
    bl func_ov079_0221329c
    mov r0, r4
    mov r1, #0x0
    bl func_ov079_0221329c
    ldmia sp!, {r4, pc}
.L_02213890:
    sub r1, r0, #0x1
    str r1, [r4, #0x2a0]
    ldr r0, .L_02213900
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl func_02007f0c
    ldr r1, [r4, #0x228]
    ldr r0, [r4, #0x1c]
    ldr r3, [r1, #0x1c]
    ldr r2, [r1, #0x20]
    ldr r1, [r4, #0x20]
    sub r0, r3, r0
    sub r1, r2, r1
    bl func_0204cfa4
    cmp r0, #0x40000
    ldmleia sp!, {r4, pc}
    ldr r0, .L_02213904
    mov r1, #0xb4
    ldr r3, [r0, #0x60]
    ldr r2, [r0, #0x64]
    str r3, [r4, #0x298]
    str r2, [r4, #0x29c]
    ldr r2, [r0, #0x58]
    ldr r0, [r0, #0x5c]
    str r2, [r4, #0x220]
    str r0, [r4, #0x224]
    str r1, [r4, #0x2a4]
    ldmia sp!, {r4, pc}
.L_02213900: .word data_021052fc
.L_02213904: .word data_ov079_02213b08
.size func_ov079_02213850, . - func_ov079_02213850

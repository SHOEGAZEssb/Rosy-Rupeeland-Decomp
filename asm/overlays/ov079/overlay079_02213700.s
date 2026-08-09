.text
; Matching fallback for the portable implementation in src/overlays/ov079/overlay079_recovery.c.
.extern data_ov079_02213b08
.extern func_02005030
.extern func_02005058
.extern func_0204cfa4
.extern func_ov079_0221340c
.extern func_ov079_02213458

.global func_ov079_02213700
func_ov079_02213700:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    mov r4, r0
    bl func_ov079_0221340c
    cmp r0, #0x0
    bne .L_02213844
    ldr r2, [r4, #0x2a0]
    cmp r2, #0x0
    bne .L_0221374c
    ldr r0, .L_0221384c
    ldr r2, [r0, #0x80]
    ldr r1, [r0, #0x84]
    str r2, [r4, #0x298]
    str r1, [r4, #0x29c]
    ldr r1, [r0, #0x78]
    ldr r0, [r0, #0x7c]
    str r1, [r4, #0x220]
    str r0, [r4, #0x224]
    b .L_02213834
.L_0221374c:
    ldr r1, [r4, #0x24]
    ldr r0, [r4, #0x1dc]
    cmp r1, r0
    bne .L_022137d4
    sub r0, r2, #0x1
    str r0, [r4, #0x2a0]
    ldr r1, [r4, #0x228]
    ldr r0, [r4, #0x1c]
    ldr r3, [r1, #0x1c]
    ldr r2, [r1, #0x20]
    ldr r1, [r4, #0x20]
    sub r0, r3, r0
    sub r1, r2, r1
    bl func_0204cfa4
    cmp r0, #0x50000
    ble .L_022137bc
    ldr r0, .L_0221384c
    mov r1, #0xb4
    ldr r3, [r0, #0x70]
    ldr r2, [r0, #0x74]
    str r3, [r4, #0x298]
    str r2, [r4, #0x29c]
    ldr r2, [r0, #0x8]
    ldr r0, [r0, #0xc]
    str r2, [r4, #0x220]
    str r0, [r4, #0x224]
    str r1, [r4, #0x2a4]
    b .L_02213834
.L_022137bc:
    cmp r0, #0x14000
    bge .L_02213834
    ldr r1, [r4, #0x228]
    mov r0, r4
    bl func_ov079_02213458
    b .L_02213834
.L_022137d4:
    add r0, sp, #0x0
    add r1, r4, #0x18
    bl func_02005030
    ldr r0, [r4, #0x228]
    ldr r1, [r4, #0x1c]
    ldr r0, [r0, #0x1c]
    ldr r2, [sp, #0x4]
    sub r0, r1, r0
    add r0, r2, r0
    str r0, [sp, #0x4]
    ldr r0, [r4, #0x228]
    ldr r1, [r4, #0x20]
    ldr r0, [r0, #0x20]
    ldr r2, [sp, #0x8]
    sub r0, r1, r0
    add r1, r2, r0
    str r1, [sp, #0x8]
    mov r0, r4
    ldr r2, [r0, #0x0]
    add r1, sp, #0x0
    ldr r2, [r2, #0xd0]
    blx r2
    add r0, sp, #0x0
    bl func_02005058
.L_02213834:
    mov r0, #0x4
    strh r0, [r4, #0xd6]
    mov r0, #0xa
    strb r0, [r4, #0x24c]
.L_02213844:
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.L_0221384c: .word data_ov079_02213b08
.size func_ov079_02213700, . - func_ov079_02213700

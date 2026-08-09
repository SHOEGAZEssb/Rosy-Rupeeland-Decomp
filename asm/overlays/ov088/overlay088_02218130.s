.text
; Matching fallback for the portable implementation in src/overlays/ov088/overlay088_recovery.c.
.extern Heap_Alloc
.extern data_ov088_0221ba04
.extern func_02005030
.extern func_02005058
.extern func_0201f864
.extern func_02033828
.extern func_02034b60
.extern func_ov088_02218280
.extern func_ov088_02219960
.extern func_ov088_0221ad9c
.extern gHeapContext

.global func_ov088_02218130
func_ov088_02218130:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x28
    mov r4, r0
    add r0, r4, #0x18
    mov r1, r1, lsl #0xc
    mov r2, r2, lsl #0xc
    mov r3, #0x0
    bl func_ov088_02218280
    mov r0, r4
    bl func_02033828
    mov r0, r4
    mov r1, #0x1
    bl func_ov088_02219960
    ldr r1, [r4, #0x238]
    mov r0, #0x3c
    ldrsh r3, [r1, #0x16]
    add r2, r4, #0x200
    mov r1, #0x0
    smulbb r0, r3, r0
    strh r0, [r2, #0x1c]
    strh r1, [r4, #0xda]
    str r1, [r4, #0x208]
    strh r1, [r2, #0x14]
    strh r1, [r2, #0x16]
    bic r0, r1, #0x20
    strh r0, [r2, #0x1a]
    strh r1, [r2, #0x1e]
    strh r1, [r2, #0x30]
    strh r1, [r2, #0x34]
    strh r1, [r2, #0x36]
    strh r1, [r2, #0x40]
    strh r1, [r2, #0x42]
    mov r0, #0x8000
    str r0, [r4, #0x23c]
    mov r0, r4
    mov r2, #0x1000
    bl func_02034b60
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x5c]
    blx r1
    ldr r1, [r4, #0x14]
    mov r0, r4
    bic r1, r1, #0x2
    bic r1, r1, #0x4
    str r1, [r4, #0x14]
    mov r1, #0x0
    bl func_ov088_0221ad9c
    add r0, sp, #0x18
    add r1, r4, #0x18
    bl func_02005030
    ldr r1, [sp, #0x20]
    ldr r3, .L_02218274
    sub r1, r1, #0x8000
    str r1, [sp, #0x20]
    ldr r1, .L_02218278
    mov r0, #0x14
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02218264
    ldr r3, .L_0221827c
    mov r2, #0x0
    str r3, [sp, #0x0]
    add r1, r3, #0x3
    stmib sp, {r1, r2}
    sub r1, r2, #0x28
    str r1, [sp, #0xc]
    sub r1, r2, #0x1
    str r1, [sp, #0x10]
    mov r1, #0x1
    str r1, [sp, #0x14]
    ldr r2, [r4, #0x54]
    add r1, sp, #0x18
    ldr r2, [r2, #0x0]
    add r3, r3, #0x2
    bl func_0201f864
.L_02218264:
    add r0, sp, #0x18
    bl func_02005058
    add sp, sp, #0x28
    ldmia sp!, {r4, pc}
.L_02218274: .word gHeapContext
.L_02218278: .word data_ov088_0221ba04
.L_0221827c: .word 0x221d
.size func_ov088_02218130, . - func_ov088_02218130

.text

/* Exact fallback; see src/overlays/ov032/overlay032_dialog_children.c for documented portable C. */
.extern Heap_Alloc
.extern data_020f4e14
.extern data_020f4e18
.extern data_ov032_02202340
.extern func_02071980
.extern func_02092cc0
.extern func_ov032_021fce08
.extern gHeapContext

    .global func_ov032_021fe6b0
func_ov032_021fe6b0:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    ldr r1, L_021fe7bc
    mov r4, r0
    ldr r0, [r1, #0x0]
    ldr r1, L_021fe7c0
    bl func_02071980
    str r0, [r4, #0xc]
    ldr r1, L_021fe7c4
    ldr r3, L_021fe7c8
    mov r0, #0xec
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fe6fc
    ldr r1, L_021fe7cc
    ldr r2, [r4, #0xc]
    ldr r1, [r1, #0x0]
    bl func_02092cc0
L_021fe6fc:
    str r0, [r4, #0x18]
    mov r0, #0x1e
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x18]
    mov r1, #0x40
    mov r2, #0x1a
    mov r3, #0xa0
    bl func_ov032_021fce08
    ldr r0, [r4, #0x18]
    mov lr, #0x0
    str lr, [r0, #0xb4]
    ldr r1, [r4, #0x18]
    mov r0, #0xd
    str lr, [r1, #0xbc]
    ldr ip, [r4, #0x18]
    ldr r1, L_021fe7c4
    str r0, [ip, #0xd0]
    ldr r3, L_021fe7c8
    mov r0, #0xec
    mov r2, #0x4
    str lr, [ip, #0xd4]
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fe76c
    ldr r1, L_021fe7cc
    ldr r2, [r4, #0x8]
    ldr r1, [r1, #0x0]
    bl func_02092cc0
L_021fe76c:
    str r0, [r4, #0x14]
    mov r0, #0x1e
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x14]
    mov r1, #0x5c
    mov r2, #0x98
    mov r3, #0x8c
    bl func_ov032_021fce08
    mov r3, #0x0
    ldr r0, [r4, #0x14]
    sub r2, r3, #0x2
    str r3, [r0, #0xb4]
    ldr r1, [r4, #0x14]
    mov r0, #0xd
    str r2, [r1, #0xbc]
    ldr r1, [r4, #0x14]
    str r0, [r1, #0xd0]
    str r3, [r1, #0xd4]
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
L_021fe7bc: .word data_020f4e18
L_021fe7c0: .word 0x7006
L_021fe7c4: .word data_ov032_02202340
L_021fe7c8: .word gHeapContext
L_021fe7cc: .word data_020f4e14
.size func_ov032_021fe6b0, .-func_ov032_021fe6b0


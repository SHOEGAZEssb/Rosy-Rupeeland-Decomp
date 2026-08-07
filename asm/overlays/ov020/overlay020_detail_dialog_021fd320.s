    .text
/* Exact fallback; see src/overlays/ov020/overlay020_detail_dialog.c. */
    .extern Heap_Alloc
    .extern data_020f4e18
    .extern data_ov020_021fe528
    .extern func_02071ea4
    .extern func_02071ee0
    .extern func_020742cc
    .extern func_02092798
    .extern func_02092814
    .extern func_02092cc0
    .extern func_ov020_021fd308
    .extern gHeapContext

.global func_ov020_021fd320
func_ov020_021fd320:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    add r0, r5, #0x10
    mov r4, r1
    bl func_02071ea4
    add r0, r5, #0x1c
    bl func_02071ea4
    add r0, r5, #0x28
    bl func_02092798
    mvn r0, #0x0
    str r0, [r5, #0x0]
    str r4, [r5, #0x8]
    mov r0, r4
    bl func_020742cc
    str r0, [r5, #0xc]
    add r0, r5, #0x28
    mov r1, #0x7000
    bl func_02092814
    add r0, r5, #0x28
    ldr r1, L_021fd3f0
    bl func_02092814
    add r0, r5, #0x28
    ldr r1, L_021fd3f4
    bl func_02092814
    mov r0, #0xec
    ldr r1, L_021fd3f8
    mov r2, #0x4
    ldr r3, L_021fd3fc
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fd3a8
    ldr r1, [r5, #0x8]
    ldr r2, [r5, #0x28]
    bl func_02092cc0
L_021fd3a8:
    str r0, [r5, #0x4c]
    mov r0, #0x30
    str r0, [sp, #0x0]
    ldr r0, [r5, #0x4c]
    mov r1, #0x22
    mov r2, #0x87
    mov r3, #0xc0
    bl func_ov020_021fd308
    mov r1, #0x4e
    ldr r0, L_021fd400
    str r1, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r5, #0x1c
    mov r2, #0x4c
    mov r3, #0x4d
    bl func_02071ee0
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
L_021fd3f0: .word 0x7005
L_021fd3f4: .word 0x7007
L_021fd3f8: .word data_ov020_021fe528
L_021fd3fc: .word gHeapContext
L_021fd400: .word data_020f4e18
    .size func_ov020_021fd320, . - func_ov020_021fd320

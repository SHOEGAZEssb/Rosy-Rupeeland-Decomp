    .text
/* Exact fallback; see src/overlays/ov022/overlay022_menu_collection.c. */
    .extern data_020f4e14
    .extern data_ov022_022006c4
    .extern data_ov022_022006cc
    .extern func_02003e20
    .extern GraphicsSpriteGroup_ReleaseIndexedEntries
    .extern func_02092798
    .extern func_02092814
    .extern func_02094154
    .extern func_02094550
    .extern func_02094574
    .extern func_020c09cc
    .extern func_ov022_021fd894
    .extern gHeapContext
    .extern gSystemState
    .extern Heap_Alloc

.global func_ov022_021fd8a4
func_ov022_021fd8a4:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    mov r4, r0
    mov r5, r1
    bl func_02092798
    str r5, [r4, #0x28]
    mov ip, #0x0
    str ip, [r4, #0x2c]
    ldr r5, [r4, #0x28]
    mov r2, #0x4
    cmp r5, #0x0
    beq L_021fd964
    mov r0, r5, lsl #0x3
    ldr r1, L_021fda08
    ldr r3, L_021fda0c
    add r0, r0, #0x8
    bl func_02003e20
    cmp r0, #0x0
    beq L_021fd910
    ldr ip, L_021fda10
    mov r2, #0x8
    mov r1, r5
    mov r3, r2
    str ip, [sp, #0x0]
    mov ip, #0x0
    str ip, [sp, #0x4]
    bl func_020c09cc
L_021fd910:
    ldr r1, L_021fda14
    str r0, [r4, #0x24]
    ldr r3, L_021fda0c
    mov r0, #0x80
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fd95c
    mov r2, #0xda
    mov r1, #0x18
    str r2, [sp, #0x0]
    str r1, [sp, #0x4]
    sub r1, r1, #0x24
    str r1, [sp, #0x8]
    ldr r1, L_021fda18
    ldr r2, [r4, #0x28]
    ldr r1, [r1, #0x0]
    mov r3, #0x4
    bl func_02094154
L_021fd95c:
    str r0, [r4, #0x30]
    b L_021fd9b0
L_021fd964:
    ldr r1, L_021fda14
    ldr r3, L_021fda0c
    mov r0, #0x80
    str ip, [r4, #0x24]
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fd9ac
    mov r1, #0xda
    str r1, [sp, #0x0]
    mov r1, #0x18
    str r1, [sp, #0x4]
    mov r3, #0xc
    mov r2, #0x1
    ldr r1, L_021fda18
    str r3, [sp, #0x8]
    ldr r1, [r1, #0x0]
    mov r3, r2
    bl func_02094154
L_021fd9ac:
    str r0, [r4, #0x30]
L_021fd9b0:
    ldr r0, [r4, #0x30]
    mov r1, #0x0
    bl func_02094550
    ldr r0, [r4, #0x30]
    bl func_02094574
    ldr r0, [r4, #0x30]
    ldr r0, [r0, #0x50]
    bl GraphicsSpriteGroup_ReleaseIndexedEntries
    ldr r0, L_021fda1c
    ldrb r0, [r0, #0x5f]
    cmp r0, #0x0
    beq L_021fd9f0
    ldr r1, L_021fda20
    mov r0, r4
    bl func_02092814
    b L_021fd9fc
L_021fd9f0:
    ldr r1, L_021fda24
    mov r0, r4
    bl func_02092814
L_021fd9fc:
    mov r0, r4
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
L_021fda08: .word data_ov022_022006c4
L_021fda0c: .word gHeapContext
L_021fda10: .word func_ov022_021fd894
L_021fda14: .word data_ov022_022006cc
L_021fda18: .word data_020f4e14
L_021fda1c: .word gSystemState
L_021fda20: .word 0x7006
L_021fda24: .word 0x7007
.size func_ov022_021fd8a4, . - func_ov022_021fd8a4

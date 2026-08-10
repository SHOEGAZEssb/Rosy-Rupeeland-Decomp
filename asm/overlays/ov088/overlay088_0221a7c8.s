.text
; Matching fallback for the portable implementation in src/overlays/ov088/overlay088_recovery.c.
.extern Heap_Alloc
.extern data_ov088_0221ba04
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern func_0201f864
.extern func_02034a60
.extern func_ov088_02218280
.extern gHeapContext

.global func_ov088_0221a7c8
func_ov088_0221a7c8:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x28
    mov r4, r0
    add ip, r4, #0x200
    ldrh r0, [ip, #0x1a]
    mov r1, #0x0
    mov r2, r1
    orr lr, r0, #0x1
    mov r3, r1
    add r0, r4, #0x38
    strh lr, [ip, #0x1a]
    bl func_ov088_02218280
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x88
    bl func_ov088_02218280
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x98
    bl func_ov088_02218280
    ldr r1, .L_0221a8b4
    mov r0, r4
    mov r2, #0x0
    bl func_02034a60
    add r0, sp, #0x18
    add r1, r4, #0x18
    bl VecFx32Object_InitCopy
    ldr r2, [sp, #0x24]
    ldr r1, [r4, #0x23c]
    ldr r3, .L_0221a8b8
    add r1, r2, r1
    str r1, [sp, #0x24]
    ldr r1, .L_0221a8bc
    mov r0, #0x14
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0221a8a4
    ldr r3, .L_0221a8c0
    mov r2, #0x1
    str r3, [sp, #0x0]
    add r1, r3, #0x3
    stmib sp, {r1, r2}
    sub r1, r2, #0x29
    str r1, [sp, #0xc]
    sub r1, r2, #0x2
    str r1, [sp, #0x10]
    str r2, [sp, #0x14]
    ldr r2, [r4, #0x54]
    add r1, sp, #0x18
    ldr r2, [r2, #0x0]
    add r3, r3, #0x2
    bl func_0201f864
.L_0221a8a4:
    add r0, sp, #0x18
    bl VecFx32Object_Destroy
    add sp, sp, #0x28
    ldmia sp!, {r4, pc}
.L_0221a8b4: .word 0xfd89
.L_0221a8b8: .word gHeapContext
.L_0221a8bc: .word data_ov088_0221ba04
.L_0221a8c0: .word 0x221d
.size func_ov088_0221a7c8, . - func_ov088_0221a7c8

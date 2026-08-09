.text
; Matching fallback for the portable implementation in src/overlays/ov097/overlay097_recovery.c.
.extern Heap_Alloc
.extern data_ov097_0221a4a4
.extern data_ov097_0221aa1c
.extern func_0201f864
.extern gHeapContext

.global func_ov097_0221951c
func_ov097_0221951c:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x24
    ldr r5, .L_022195cc
    add r3, sp, #0x18
    mov r4, r0
    mov r2, #0x6
.L_02219534:
    ldrh r0, [r5], #0x2
    subs r2, r2, #0x1
    strh r0, [r3], #0x2
    bne .L_02219534
    cmp r1, #0x0
    moveq r6, #0x1
    ldr r1, .L_022195d0
    ldr r3, .L_022195d4
    mov r0, #0x14
    mov r2, #0x4
    movne r6, #0x0
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_022195c4
    mov r1, #0x6
    mul r5, r6, r1
    add r2, sp, #0x1a
    ldrh r2, [r2, r5]
    add r1, sp, #0x1c
    mov ip, #0x0
    str r2, [sp, #0x0]
    ldrh lr, [r1, r5]
    mov r3, #0x80
    mov r2, #0x2
    str lr, [sp, #0x4]
    str ip, [sp, #0x8]
    str r3, [sp, #0xc]
    mov r1, #0x1
    str r2, [sp, #0x10]
    str r1, [sp, #0x14]
    add r1, sp, #0x18
    ldr r2, [r4, #0x54]
    ldrh r3, [r1, r5]
    ldr r2, [r2, #0x0]
    add r1, r4, #0x18
    bl func_0201f864
.L_022195c4:
    add sp, sp, #0x24
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_022195cc: .word data_ov097_0221a4a4
.L_022195d0: .word data_ov097_0221aa1c
.L_022195d4: .word gHeapContext
.size func_ov097_0221951c, . - func_ov097_0221951c

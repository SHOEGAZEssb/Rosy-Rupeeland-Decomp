.text
; Matching fallback for the portable implementation in src/overlays/ov062/overlay062_recovery.c.
.extern Heap_Alloc
.extern Scene_Init
.extern Scene_SetFlags03
.extern data_ov062_02211ba4
.extern data_ov062_02211bd0
.extern data_ov062_02211bd8
.extern func_02005058
.extern func_0201f864
.extern func_02032d64
.extern func_ov062_0220fd20
.extern func_ov062_0220fd50
.extern func_ov062_0220fdbc
.extern func_ov062_0220fdf4
.extern gHeapContext

.global func_ov062_02210674
func_ov062_02210674:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x48
    mov r5, r0
    mov r7, r1
    mov r4, r2
    mov r6, r3
    bl Scene_Init
    ldr r2, .L_02210840
    mov r1, #0x0
    str r2, [r5, #0x0]
    str r7, [r5, #0x24]
    ldr r0, [sp, #0x60]
    str r1, [r5, #0x2c]
    str r0, [r5, #0x30]
    ldr r2, [sp, #0x64]
    str r6, [r5, #0x34]
    str r2, [r5, #0x38]
    ldr r0, [sp, #0x68]
    mov r2, r1
    str r0, [r5, #0x3c]
    mov r0, #0xf
    str r0, [r5, #0x4]
    ldr r6, [r5, #0x24]
    mov r3, r1
    add r0, r6, #0x38
    bl func_ov062_0220fd20
    mov r1, #0x0
    add r0, r6, #0x88
    mov r2, r1
    mov r3, r1
    bl func_ov062_0220fd20
    mov r1, #0x0
    add r0, r6, #0x98
    mov r2, r1
    mov r3, r1
    bl func_ov062_0220fd20
    ldr r1, [r5, #0x24]
    ldr r2, .L_02210844
    add r0, sp, #0x28
    add r1, r1, #0x18
    bl func_ov062_0220fd50
    ldr r2, .L_02210848
    add r0, sp, #0x18
    mov r1, r4
    bl func_ov062_0220fd50
    add r0, sp, #0x38
    add r1, sp, #0x28
    add r2, sp, #0x18
    bl func_ov062_0220fdbc
    add r0, sp, #0x18
    bl func_02005058
    add r0, sp, #0x28
    bl func_02005058
    ldr r1, .L_0221084c
    ldr r3, .L_02210850
    mov r0, #0x30
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02210778
    ldr r1, [r5, #0x24]
    add r3, sp, #0x38
    mov r2, r4
    add r1, r1, #0x18
    bl func_ov062_0220fdf4
.L_02210778:
    str r0, [r5, #0x28]
    ldr r0, [r5, #0x24]
    ldrb r1, [r0, #0xe6]
    cmp r1, #0x1
    beq .L_022107a4
    ldrb r1, [r0, #0x4d]
    cmp r1, #0x7
    moveq r1, #0x1
    movne r1, #0x0
    cmp r1, #0x0
    beq .L_022107c0
.L_022107a4:
    ldr ip, [r4, #0x4]
    ldr r1, [r0, #0x1c]
    ldr r3, [r4, #0x8]
    ldr r2, [r0, #0x20]
    sub r1, ip, r1
    sub r2, r3, r2
    bl func_02032d64
.L_022107c0:
    ldr r1, .L_02210854
    ldr r3, .L_02210850
    mov r0, #0x14
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02210824
    ldr r3, .L_02210858
    ldr r4, [r5, #0x24]
    add r2, r3, #0x1
    str r3, [sp, #0x0]
    mov r1, #0x4
    str r2, [sp, #0x4]
    mov r2, #0x0
    str r2, [sp, #0x8]
    str r1, [sp, #0xc]
    sub r1, r1, #0x5
    str r1, [sp, #0x10]
    mov r1, #0x1
    str r1, [sp, #0x14]
    ldr r2, [r4, #0x54]
    add r1, r4, #0x18
    ldr r2, [r2, #0x0]
    sub r3, r3, #0x1
    bl func_0201f864
.L_02210824:
    mov r0, r5
    bl Scene_SetFlags03
    add r0, sp, #0x38
    bl func_02005058
    mov r0, r5
    add sp, sp, #0x48
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02210840: .word data_ov062_02211ba4
.L_02210844: .word 0x266
.L_02210848: .word 0xd9a
.L_0221084c: .word data_ov062_02211bd0
.L_02210850: .word gHeapContext
.L_02210854: .word data_ov062_02211bd8
.L_02210858: .word 0x162c
.size func_ov062_02210674, . - func_ov062_02210674

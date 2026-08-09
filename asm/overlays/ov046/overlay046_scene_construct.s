.text
; Matching fallback for the portable implementation in src/overlays/ov046/overlay046_scene_construct.c.
.extern Heap_Alloc
.extern data_020d780c
.extern data_020f4e18
.extern data_ov046_0220ccf8
.extern data_ov046_0220cf28
.extern data_ov046_0220cf3c
.extern data_ov046_0220cf44
.extern func_02027fe8
.extern func_02071ea4
.extern func_02071ee0
.extern func_02073e48
.extern func_02073ffc
.extern func_020742cc
.extern func_02091e28
.extern func_ov046_0220b740
.extern func_ov046_0220b77c
.extern func_ov046_0220b7bc
.extern func_ov046_0220c7b0
.extern gDebugFont
.extern gHeapContext

.global func_ov046_0220c7d8
func_ov046_0220c7d8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0xc
    mov r5, r0
    mov r4, r1
    bl func_02091e28
    ldr r1, .L_0220ca0c
    add r0, r5, #0x54
    str r1, [r5, #0x0]
    bl func_02071ea4
    str r4, [r5, #0x68]
    mvn r0, #0x0
    str r0, [r5, #0x6c]
    mov r3, #0x0
    ldr r2, .L_0220ca10
    mov r0, #0x34
    b .L_0220c858
.L_0220c818:
    mla r1, r3, r0, r2
    ldr r1, [r1, #0x28]
    str r1, [r5, #0x78]
    b .L_0220c844
.L_0220c828:
    ldrh r1, [r6, #0xa]
    cmp r1, r4
    streq r3, [r5, #0x6c]
    beq .L_0220c854
    ldr r1, [r5, #0x78]
    add r1, r1, #0xc
    str r1, [r5, #0x78]
.L_0220c844:
    ldr r6, [r5, #0x78]
    ldrsh r1, [r6, #0x0]
    cmp r1, #0x3
    bne .L_0220c828
.L_0220c854:
    add r3, r3, #0x1
.L_0220c858:
    cmp r3, #0xb
    ldrlt r1, [r5, #0x6c]
    cmplt r1, #0x0
    blt .L_0220c818
    ldr r1, .L_0220ca14
    cmp r4, r1
    bne .L_0220c898
    ldr r3, .L_0220ca18
    ldr r0, .L_0220ca1c
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r5, #0x54
    sub r2, r3, #0x3
    sub r3, r3, #0x9
    bl func_02071ee0
    b .L_0220c918
.L_0220c898:
    sub r0, r1, #0x1
    cmp r4, r0
    bne .L_0220c8c8
    add r1, r1, #0x2dc0
    ldr r2, .L_0220ca20
    ldr r0, .L_0220ca1c
    str r1, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r5, #0x54
    sub r3, r2, #0x6
    bl func_02071ee0
    b .L_0220c918
.L_0220c8c8:
    sub r0, r1, #0x2
    cmp r4, r0
    bne .L_0220c8f8
    ldr r3, .L_0220ca24
    ldr r0, .L_0220ca1c
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r5, #0x54
    sub r2, r3, #0x1
    sub r3, r3, #0x7
    bl func_02071ee0
    b .L_0220c918
.L_0220c8f8:
    ldr r3, .L_0220ca28
    ldr r0, .L_0220ca1c
    str r3, [sp, #0x0]
    ldr r1, [r0, #0x0]
    add r0, r5, #0x54
    sub r2, r3, #0x1
    sub r3, r3, #0x3
    bl func_02071ee0
.L_0220c918:
    ldr r0, .L_0220ca2c
    ldr r0, [r0, #0x0]
    bl func_020742cc
    str r0, [r5, #0x60]
    ldr r0, [r5, #0x6c]
    bl func_ov046_0220b740
    mov r8, r0
    ldr r1, [r5, #0x78]
    ldr r0, [r5, #0x6c]
    ldrsh r7, [r1, #0x6]
    bl func_ov046_0220b77c
    mov r6, r0
    ldr r1, [r5, #0x78]
    ldr r0, [r5, #0x60]
    ldrsh r4, [r1, #0x8]
    add r1, r5, #0x54
    mov r2, #0x1
    bl func_02073ffc
    add r2, r7, r8
    add r3, r4, r6
    str r0, [r5, #0x64]
    mov r1, #0x0
    str r1, [sp, #0x0]
    str r1, [sp, #0x4]
    mov r0, #0x4
    str r0, [sp, #0x8]
    ldr r0, [r5, #0x64]
    bl func_02073e48
    mov r0, #0x118
    ldr r1, .L_0220ca30
    mov r2, #0x4
    ldr r3, .L_0220ca34
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0220c9b4
    ldr r1, .L_0220ca2c
    mov r2, #0x0
    ldr r1, [r1, #0x0]
    bl func_ov046_0220b7bc
.L_0220c9b4:
    ldr r1, .L_0220ca38
    str r0, [r5, #0x70]
    ldr r3, .L_0220ca34
    mov r0, #0x3c
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0220c9e0
    ldr r1, .L_0220ca2c
    ldr r1, [r1, #0x0]
    bl func_02027fe8
.L_0220c9e0:
    str r0, [r5, #0x74]
    ldr r0, [r5, #0x20]
    ldr r1, .L_0220ca3c
    orr r0, r0, #0x400
    str r0, [r5, #0x20]
    mov r0, r5
    ldmia r1, {r1, r2}
    bl func_ov046_0220c7b0
    mov r0, r5
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_0220ca0c: .word data_ov046_0220cf28
.L_0220ca10: .word data_020d780c
.L_0220ca14: .word 0x503
.L_0220ca18: .word 0x32c4
.L_0220ca1c: .word data_020f4e18
.L_0220ca20: .word 0x32c1
.L_0220ca24: .word 0x32c2
.L_0220ca28: .word 0x32be
.L_0220ca2c: .word gDebugFont
.L_0220ca30: .word data_ov046_0220cf3c
.L_0220ca34: .word gHeapContext
.L_0220ca38: .word data_ov046_0220cf44
.L_0220ca3c: .word data_ov046_0220ccf8
.size func_ov046_0220c7d8, . - func_ov046_0220c7d8

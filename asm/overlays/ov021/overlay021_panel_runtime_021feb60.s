    .text
/* Exact fallback; see src/overlays/ov021/overlay021_panel_runtime.c. */
    .extern Heap_Alloc
    .extern data_020f4e14
    .extern data_021e9ac0
    .extern data_ov021_02202fa8
    .extern func_020062a0
    .extern func_0206563c
    .extern func_ov000_021fcab4
    .extern func_ov000_021fcb64
    .extern func_ov001_021fbabc
    .extern func_ov001_021fc3b4
    .extern func_ov001_021fc3dc
    .extern func_ov001_021fc7c0
    .extern func_ov001_021fca38
    .extern func_ov001_021fcaac
    .extern func_ov021_021fea50
    .extern gHeapContext

.global func_ov021_021feb60
func_ov021_021feb60:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
    mov r10, r0
    ldr r0, [r10, #0x358]
    cmp r0, #0x0
    bne L_021fecac
    ldr r0, L_021fecbc
    ldr r1, [r10, #0x54]
    ldr r0, [r0, #0x0]
    add r0, r0, #0x34
    bl func_0206563c
    add r0, r10, #0x1c
    ldr r1, L_021fecc0
    add r0, r0, #0x400
    bl func_020062a0
    ldr r1, L_021fecc4
    ldr r3, L_021fecc8
    mov r0, #0x210
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021febc0
    ldr r1, L_021feccc
    ldr r1, [r1, #0x0]
    bl func_ov001_021fbabc
L_021febc0:
    mov r8, #0x1
    mov r9, #0x0
    str r0, [r10, #0x358]
    mov r6, r9
    mov r7, r8
    mov r4, r8
    mov r5, r9
    b L_021fec38
L_021febe0:
    mov r1, r9
    bl func_ov001_021fc7c0
    ldr r1, [r0, #0xc]
    cmp r1, #0x0
    beq L_021fec34
    ldr r1, [r1, #0xc]
    cmp r1, #0x0
    movne r1, r7
    moveq r1, r6
    cmp r1, #0x0
    beq L_021fec2c
    cmp r8, #0x0
    beq L_021fec34
    ldr r0, [r10, #0x358]
    mov r2, r9
    add r1, r10, #0x368
    mov r8, r5
    bl func_ov001_021fcaac
    b L_021fec34
L_021fec2c:
    mov r1, r4
    bl func_ov021_021fea50
L_021fec34:
    add r9, r9, #0x1
L_021fec38:
    ldr r0, [r10, #0x358]
    ldr r1, [r0, #0x1a4]
    cmp r9, r1
    blt L_021febe0
    ldr r1, [r10, #0x374]
    cmp r1, #0x0
    blt L_021fec8c
    ldr r0, [r10, #0x354]
    bl func_ov000_021fcab4
    cmp r0, #0x0
    ldrne r0, [r0, #0xc]
    cmpne r0, #0x0
    beq L_021fec8c
    ldrh r0, [r0, #0x0]
    ldr r1, [r10, #0x378]
    cmp r1, r0
    bne L_021fec8c
    ldr r0, [r10, #0x354]
    ldr r2, [r10, #0x374]
    add r1, r10, #0x35c
    bl func_ov000_021fcb64
L_021fec8c:
    ldr r0, [r10, #0x358]
    add r1, r10, #0x368
    mov r2, #0x0
    bl func_ov001_021fca38
    ldr r0, [r10, #0x358]
    bl func_ov001_021fc3b4
    ldr r0, [r10, #0x358]
    bl func_ov001_021fc3dc
L_021fecac:
    mvn r0, #0x0
    str r0, [r10, #0x374]
    str r0, [r10, #0x378]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, pc}
L_021fecbc: .word data_021e9ac0
L_021fecc0: .word 0x1
L_021fecc4: .word data_ov021_02202fa8
L_021fecc8: .word gHeapContext
L_021feccc: .word data_020f4e14
    .size func_ov021_021feb60, . - func_ov021_021feb60


.text

/* Exact fallback; see src/overlays/ov031/overlay031_effect_runtime.c for documented portable C. */
.extern data_ov031_021fe790
.extern GraphicsSpriteState_SetAnimationIndex
.extern func_02073ffc
.extern func_0209189c
.extern func_ov031_021fd19c
.extern gHeapContext
.extern Heap_Alloc


    .global func_ov031_021fd684
func_ov031_021fd684:
    mov r1, r1, lsl #0x10
    mov r1, r1, asr #0x10
    str r1, [r0, #0x7c]
    mov r1, #0x0
    str r1, [r0, #0x80]
    bx lr
.size func_ov031_021fd684, .-func_ov031_021fd684
    .global func_ov031_021fd69c
func_ov031_021fd69c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r7, r0
    mov r6, #0x0
    b L_021fd784
L_021fd6ac:
    add r0, r7, r6, lsl #0x2
    ldr r0, [r0, #0x74]
    cmp r0, #0x0
    bne L_021fd780
    ldr r0, [r7, #0x54]
    add r1, r7, #0x5c
    mov r2, #0x1
    bl func_02073ffc
    mov r5, r0
    add r0, r7, #0x150
    mov r1, #0x4
    mov r2, #0x7
    bl func_0209189c
    mov r1, r0
    mov r0, r5
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    mov r0, #0x3
    strb r0, [r5, #0x3a]
    sub r1, r0, #0x2b
    mov r0, #0x500
    strh r0, [r5, #0x28]
    add r0, r7, #0x150
    mov r2, #0x28
    bl func_0209189c
    mov r4, r0
    ldr r1, [r7, #0x70]
    add r0, r7, #0x150
    ldr r2, [r1, #0x9c]
    ldrsh r1, [r2, #0x2c]
    ldrsh r2, [r2, #0x2e]
    add r1, r4, r1
    mov r8, r1, lsl #0x8
    sub r1, r2, #0x30
    add r2, r2, #0x30
    bl func_0209189c
    mov r9, r0, lsl #0x8
    mov r0, #0x18
    ldr r1, L_021fd790
    mov r2, #0x4
    ldr r3, L_021fd794
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fd774
    mov r4, r4, lsl #0x1
    mov r1, r5
    mov r2, r8
    mov r3, r9
    str r4, [sp, #0x0]
    bl func_ov031_021fd19c
L_021fd774:
    add r1, r7, r6, lsl #0x2
    str r0, [r1, #0x74]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
L_021fd780:
    add r6, r6, #0x1
L_021fd784:
    cmp r6, #0x10
    blt L_021fd6ac
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
L_021fd790: .word data_ov031_021fe790
L_021fd794: .word gHeapContext
.size func_ov031_021fd69c, .-func_ov031_021fd69c

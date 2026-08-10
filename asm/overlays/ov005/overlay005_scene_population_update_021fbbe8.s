    .text
    .extern func_02091c7c
    .extern func_02091bac
    .extern func_020afca0
    .extern func_02091b98
    .extern Heap_Alloc
    .extern func_ov005_021fb6e4
    .extern func_0209189c
    .extern func_020948d4
    .extern func_020948f8
    .extern func_02095274
    .extern func_02095360
    .extern GraphicsSpriteGroup_AdvanceAnimations
    .extern data_020f4e14
    .extern data_ov005_021fcb04
    .extern gHeapContext
    .extern data_ov005_021fc8f0

    /* Exact fallback; see the documented portable reconstruction in
     * src/overlays/ov005/overlay005_scene_population_update.c. */
    .global func_ov005_021fbbe8
func_ov005_021fbbe8: ; 0x021fbbe8
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    add r0, r4, #0x110
    mov r1, #0x2
    bl func_02091c7c
    cmp r0, #0x0
    beq L_021fbc40
    ldr r0, [r4, #0x11c]
    mov ip, #0x1e
    cmp r0, #0x0
    mov r1, #0x2
    add r0, r4, #0x110
    bne L_021fbc30
    mov r2, #0x0
    mov r3, #0xa000
    str ip, [sp, #0x0]
    bl func_02091bac
    b L_021fbc40
L_021fbc30:
    mov r2, #0xa000
    mov r3, #0x0
    str ip, [sp, #0x0]
    bl func_02091bac
L_021fbc40:
    ldr r2, [r4, #0x120]
    ldr r1, L_021fbd4c
    mov r0, r2, asr #0xb
    add r0, r2, r0, lsr #0x14
    ldr r3, [r4, #0x0]
    ldr r2, [r1, #0x0]
    mov r1, r0, asr #0xc
    cmp r3, r2
    bne L_021fbc70
    ldr r0, L_021fbd50
    bl func_020afca0
    b L_021fbc78
L_021fbc70:
    ldr r0, L_021fbd54
    bl func_020afca0
L_021fbc78:
    ldr r0, [r4, #0x158]
    cmp r0, #0x0
    beq L_021fbd38
    add r0, r4, #0x12c
    mov r1, #0x2
    bl func_02091c7c
    cmp r0, #0x0
    beq L_021fbd38
    add r0, r4, #0x12c
    mov r1, #0x10
    bl func_02091b98
    ldr r1, L_021fbd58
    ldr r3, L_021fbd5c
    mov r0, #0xcc
    mov r2, #0x4
    bl Heap_Alloc
    movs r5, r0
    beq L_021fbccc
    ldr r1, [r4, #0x4]
    bl func_ov005_021fb6e4
    mov r5, r0
L_021fbccc:
    add r0, r4, #0x10c
    mov r1, #0x0
    mov r2, #0x100
    bl func_0209189c
    mov r1, r0, lsl #0xc
    add r0, r5, #0xc
    bl func_020948d4
    ldr r2, [r4, #0x100]
    ldr r1, L_021fbd60
    add r0, r4, #0x10c
    ldr r1, [r1, r2, lsl #0x2]
    add r2, r1, #0xc0
    bl func_0209189c
    mov r1, r0, lsl #0xc
    add r0, r5, #0x1c
    bl func_020948d4
    add r0, r5, #0x1c
    mov r1, #0x2
    mov r2, #0x18000
    bl func_020948f8
    mov r0, #0x40
    str r0, [r5, #0x7c]
    mov r0, #0x0
    str r0, [r5, #0x80]
    mov r1, r5
    add r0, r4, #0x148
    bl func_02095274
L_021fbd38:
    add r0, r4, #0x148
    bl func_02095360
    ldr r0, [r4, #0x4]
    bl GraphicsSpriteGroup_AdvanceAnimations
    ldmia sp!, {r3, r4, r5, pc}
L_021fbd4c: .word data_020f4e14
L_021fbd50: .word 0x4000050
L_021fbd54: .word 0x4001050
L_021fbd58: .word data_ov005_021fcb04
L_021fbd5c: .word gHeapContext
L_021fbd60: .word data_ov005_021fc8f0

    .size func_ov005_021fbbe8, .-func_ov005_021fbbe8

.text
/* Exact fallback; see overlay039_scene_construct.c for portable C. */
    .extern func_ov039_021fce00
    .extern data_ov039_022083d0
    .extern func_ov069_0220fd40
    .extern func_ov049_0220c124
    .extern func_ov069_022109c4
    .extern __construct_array
    .extern func_ov039_021fce40
    .extern func_ov039_021fce5c
    .extern VecFx32Object_Init
    .extern func_ov039_021fd070
    .extern func_ov039_021fd254
    .extern Heap_Alloc
    .extern func_ov039_021fce60
    .extern data_ov039_02208404
    .extern gHeapContext

    .global func_ov039_021fce84
func_ov039_021fce84:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r7, r0
    mov r6, r1
    mov r5, r2
    mov r4, r3
    bl func_ov039_021fce00
    ldr r1, L_021fd008
    add r0, r7, #0x118
    str r1, [r7, #0x0]
    bl func_ov069_0220fd40 ; func_ov074_0220fd40
    add r0, r7, #0x54
    add r0, r0, #0x400
    bl func_ov049_0220c124
    add r0, r7, #0x2fc
    add r0, r0, #0x800
    bl func_ov069_022109c4
    ldr r1, L_021fd00c
    add r0, r7, #0x118
    str r1, [sp, #0x0]
    ldr r3, L_021fd010
    add r0, r0, #0x1c00
    mov r1, #0xa
    mov r2, #0xc
    bl __construct_array
    add r0, r7, #0xd90
    add r0, r0, #0x1000
    bl func_ov039_021fce40
    add r0, r7, #0xda0
    add r0, r0, #0x1000
    bl VecFx32Object_Init
    str r6, [r7, #0x48]
    str r6, [r7, #0x118]
    str r6, [r7, #0xafc]
    mov r0, #0x1e
    add r2, r7, #0x1c00
    strh r0, [r2, #0xa8]
    strh r4, [r2, #0xb2]
    mov r3, #0x0
    strh r3, [r2, #0x94]
    strh r3, [r2, #0x96]
    strh r3, [r2, #0xa0]
    add r1, r7, #0x1000
    str r3, [r1, #0xc98]
    str r3, [r1, #0xc9c]
    strh r3, [r2, #0xaa]
    strh r3, [r2, #0xac]
    strh r3, [r2, #0xae]
    str r3, [r1, #0xdb0]
    strh r3, [r2, #0xb4]
    strh r3, [r2, #0xb8]
    strh r3, [r2, #0xb6]
    strh r3, [r2, #0xba]
    str r3, [r1, #0xca4]
    strh r3, [r2, #0xc2]
    strh r3, [r2, #0xc0]
    strh r3, [r2, #0xbe]
    add r0, r7, #0x1d00
    strh r3, [r0, #0x9c]
    mov r0, #0x200000
    str r0, [r7, #0x30]
    mov r0, #0x118000
    str r0, [r7, #0x34]
    str r3, [r7, #0x38]
    mov r0, #0x100
    strh r0, [r7, #0x3c]
    strh r0, [r7, #0x3e]
    strh r3, [r7, #0x40]
    str r3, [r1, #0xd98]
    str r3, [r1, #0xd94]
    ldrh r0, [r2, #0xb2]
    mov r1, r5
    cmp r0, #0x0
    mov r0, r7
    bne L_021fcfb4
    bl func_ov039_021fd070
    b L_021fcfb8
L_021fcfb4:
    bl func_ov039_021fd254
L_021fcfb8:
    mov r0, #0x1e
    ldr r6, L_021fd014
    ldr r4, L_021fd018
    sub r9, r0, #0x1
    mov r8, #0x20
    mov r5, #0x4
L_021fcfd0:
    mov r0, r8
    mov r1, r6
    mov r2, r5
    mov r3, r4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fcff0
    bl func_ov039_021fce60
L_021fcff0:
    add r1, r7, r9, lsl #0x2
    str r0, [r1, #0xa0]
    subs r9, r9, #0x1
    bpl L_021fcfd0
    mov r0, r7
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
L_021fd008: .word data_ov039_022083d0
L_021fd00c: .word func_ov039_021fce5c
L_021fd010: .word func_ov039_021fce40
L_021fd014: .word data_ov039_02208404
L_021fd018: .word gHeapContext
    .size func_ov039_021fce84, .-func_ov039_021fce84

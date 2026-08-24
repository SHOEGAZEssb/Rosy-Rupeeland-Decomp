.text

/* Exact fallback; see src/overlays/ov026/overlay026_effect_container.c. */
.extern gFx32CosSinTable
.extern data_020f4e18
.extern data_ov026_022040cc
.extern data_ov026_0220426c
.extern data_ov026_02204960
.extern data_ov026_02204a40
.extern data_ov026_02204a50
.extern data_ov026_02204a58
.extern data_ov026_02204a60
.extern data_ov026_02204a68
.extern GraphicsArchive_AcquireOwlvResource
.extern Graphics3DResourceBinding_Init
.extern PresentationScalar_SetImmediate
.extern Presentation_Init
.extern Presentation_SetPosition
.extern func_ov026_021fce54
.extern func_ov026_021fd9c4
.extern func_ov026_021fdd84
.extern func_ov026_021fe2c8
.extern gHeapContext
.extern Heap_Alloc


    .global func_ov026_021fef9c
func_ov026_021fef9c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r10, r0
    mov r9, r1
    bl Presentation_Init
    ldr r0, L_021ff298
    ldr r5, L_021ff29c
    ldr r6, L_021ff2a0
    ldr r4, L_021ff2a4
    mov r8, #0x0
    str r0, [r10, #0x0]
    mov r7, #0x18
    mov r11, #0x4
L_021fefcc:
    ldr r3, L_021ff2a8
    mov r0, r7
    mov r1, r6
    mov r2, r11
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021ff008
    add r1, r5, r8, lsl #0x2
    ldrh r1, [r1, #0x2]
    mov r3, r8, lsl #0x2
    mov r2, r9
    str r1, [sp, #0x0]
    ldrh r3, [r5, r3]
    ldr r1, [r4, #0x0]
    bl Graphics3DResourceBinding_Init
L_021ff008:
    add r1, r10, r8, lsl #0x2
    add r8, r8, #0x1
    str r0, [r1, #0xfc]
    cmp r8, #0x8
    blt L_021fefcc
    mov r1, #0x0
    mov r4, #0x9
    mov r0, r10
    mov r3, r1
    mov r2, #0x8
    str r4, [r10, #0x9c]
    bl Presentation_SetPosition
    mov r1, #0x0
    mov r8, r1
L_021ff040:
    add r0, r10, r1, lsl #0x2
    add r1, r1, #0x1
    str r8, [r0, #0xa0]
    cmp r1, #0x10
    blt L_021ff040
    str r8, [r10, #0x13c]
    ldr r4, L_021ff2ac
    mov r7, #0x2c
    ldr r6, L_021ff2b0
    mov r5, #0x4
    ldr r11, L_021ff2a8
    b L_021ff0d0
L_021ff070:
    mov r0, r7
    mov r1, r6
    mov r2, r5
    mov r3, r11
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021ff0b0
    ldr r2, [r4, r8, lsl #0x3]
    ldr r1, [r10, #0x13c]
    add ip, r10, r2, lsl #0x2
    add r2, r4, r8, lsl #0x3
    mov r3, r1, lsl #0xa
    ldr r1, [ip, #0xfc]
    ldr r2, [r2, #0x4]
    rsb r3, r3, #0x0
    bl func_ov026_021fd9c4
L_021ff0b0:
    add r1, r10, r8, lsl #0x2
    str r0, [r1, #0xa0]
    add r0, r4, r8, lsl #0x3
    ldr r1, [r10, #0x13c]
    ldr r0, [r0, #0x4]
    add r8, r8, #0x1
    add r0, r1, r0
    str r0, [r10, #0x13c]
L_021ff0d0:
    ldr r0, [r10, #0x9c]
    cmp r8, r0
    blt L_021ff070
    ldr r1, L_021ff2b4
    ldr r3, L_021ff2a8
    mov r0, #0x20
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021ff100
    mov r1, r9
    bl func_ov026_021fdd84
L_021ff100:
    ldr r1, L_021ff2b8
    str r0, [r10, #0xe0]
    ldr r3, L_021ff2a8
    mov r0, #0x20
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021ff130
    ldr r1, [r10, #0x13c]
    mov r1, r1, lsl #0xa
    rsb r1, r1, #0x0
    bl func_ov026_021fe2c8
L_021ff130:
    ldr r1, L_021ff2a4
    str r0, [r10, #0xe4]
    ldr r0, [r1, #0x0]
    mov r1, #0x5000
    bl GraphicsArchive_AcquireOwlvResource
    str r0, [r10, #0x11c]
    ldr r1, L_021ff2bc
    ldr r3, L_021ff2a8
    mov r0, #0xb0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021ff174
    ldr r1, [r10, #0x11c]
    ldr r3, L_021ff2c0
    mov r2, #0x0
    bl func_ov026_021fce54
L_021ff174:
    mov r1, #0x0
    ldr r3, L_021ff2c4
    str r0, [r10, #0xe8]
    mov r2, r1
    bl Presentation_SetPosition
    ldr r0, [r10, #0xe8]
    mov r1, #0x8000
    add r0, r0, #0x4c
    bl PresentationScalar_SetImmediate
    ldr r0, [r10, #0xe8]
    mov r1, #0xcd
    add r0, r0, #0x6c
    bl PresentationScalar_SetImmediate
    mov r7, #0x0
    ldr r6, L_021ff2c8
    ldr r4, L_021ff2cc
    mov r5, r7
    mov r11, #0xb0
L_021ff1bc:
    mov r1, r7, lsl #0x10
    mov r0, r1, asr #0x1
    add r0, r1, r0, lsr #0x1e
    mov r0, r0, lsl #0xe
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r2, r0, lsl #0x1
    mov r0, r2, lsl #0x1
    ldrsh r1, [r6, r0]
    add r0, r6, r2, lsl #0x1
    ldrsh r0, [r0, #0x2]
    smulbb r2, r1, r4
    smulbb r1, r0, r4
    mov r0, r2, asr #0xb
    add r0, r2, r0, lsr #0x14
    mov r8, r0, asr #0xc
    mov r0, r1, asr #0xb
    add r0, r1, r0, lsr #0x14
    mov r9, r0, asr #0xc
    ldr r1, L_021ff2bc
    ldr r3, L_021ff2a8
    mov r0, r11
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021ff234
    ldr r1, [r10, #0x11c]
    ldr r3, L_021ff2c0
    mov r2, #0x2
    bl func_ov026_021fce54
L_021ff234:
    add r2, r10, r7, lsl #0x2
    str r0, [r2, #0xec]
    ldr r2, [r10, #0x13c]
    mov r1, r8
    mov r2, r2, lsl #0xa
    mov r3, r9
    rsb r2, r2, #0x0
    bl Presentation_SetPosition
    add r0, r10, r7, lsl #0x2
    ldr r0, [r0, #0xec]
    mov r1, #0x29
    add r0, r0, #0x6c
    bl PresentationScalar_SetImmediate
    add r0, r10, r7, lsl #0x2
    ldr r0, [r0, #0xec]
    add r7, r7, #0x1
    str r5, [r0, #0xac]
    cmp r7, #0x4
    blt L_021ff1bc
    str r5, [r10, #0x120]
    str r5, [r10, #0x124]
    str r5, [r10, #0x12c]
    mov r0, r10
    str r5, [r10, #0x130]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_021ff298: .word data_ov026_02204960
L_021ff29c: .word data_ov026_022040cc
L_021ff2a0: .word data_ov026_02204a40
L_021ff2a4: .word data_020f4e18
L_021ff2a8: .word gHeapContext
L_021ff2ac: .word data_ov026_0220426c
L_021ff2b0: .word data_ov026_02204a58
L_021ff2b4: .word data_ov026_02204a60
L_021ff2b8: .word data_ov026_02204a68
L_021ff2bc: .word data_ov026_02204a50
L_021ff2c0: .word 0x7fff
L_021ff2c4: .word 0xfffffd9a
L_021ff2c8: .word gFx32CosSinTable
L_021ff2cc: .word 0x266
.size func_ov026_021fef9c, .-func_ov026_021fef9c


.text
; Matching fallback for the portable implementation in src/overlays/ov065/overlay065_recovery.c.
.extern Heap_Alloc
.extern Scene_Init
.extern Scene_SetFlags03
.extern data_020f4e14
.extern data_ov065_02210bb8
.extern data_ov065_02210be4
.extern data_ov065_02210c00
.extern func_02005030
.extern AnimationResource_Init
.extern GraphicsSpriteState_Create
.extern GraphicsSpriteGroupOwner_CreateGroup
.extern func_020befec
.extern func_ov065_0220fd20
.extern gHeapContext

.global func_ov065_022101bc
func_ov065_022101bc:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xc
    mov r10, r0
    mov r6, r1
    mov r5, r2
    mov r4, r3
    bl Scene_Init
    ldr r0, .L_022103a8
    add r2, r10, #0x100
    str r0, [r10, #0x0]
    mov r3, #0x0
    strh r3, [r2, #0x18]
    strh r3, [r2, #0x1a]
    str r6, [r10, #0x11c]
    strh r3, [r2, #0x20]
    mov r1, r5
    add r0, r10, #0x124
    strh r3, [r2, #0x22]
    bl func_02005030
    mov r1, r4
    add r0, r10, #0x134
    bl func_02005030
    ldr r1, [sp, #0x30]
    ldr r0, [sp, #0x34]
    str r1, [r10, #0x144]
    str r0, [r10, #0x148]
    mov r0, #0x11
    str r0, [r10, #0x4]
    mov r0, #0x0
    str r0, [r10, #0x8]
    ldr r1, .L_022103ac
    ldr r0, .L_022103b0
    str r10, [r1, #0x0]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    str r0, [r10, #0x24]
    mov r0, #0x10
    ldr r1, .L_022103b4
    mov r2, #0x4
    ldr r3, .L_022103b8
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02210278
    ldr r1, .L_022103bc
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl AnimationResource_Init
.L_02210278:
    ldr r1, .L_022103b4
    str r0, [r10, #0x14c]
    ldr r3, .L_022103b8
    mov r0, #0x10
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_022102a8
    ldr r1, .L_022103c0
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl AnimationResource_Init
.L_022102a8:
    ldr r1, .L_022103b4
    str r0, [r10, #0x150]
    ldr r3, .L_022103b8
    mov r0, #0x10
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_022102d8
    ldr r1, .L_022103c4
    sub r2, r1, #0xe
    add r3, r1, #0x1
    bl AnimationResource_Init
.L_022102d8:
    str r0, [r10, #0x154]
    mov r3, #0x0
    str r3, [sp, #0x0]
    mov r0, #0x6
    stmib sp, {r0, r3}
    ldr r0, [r10, #0x24]
    ldr r1, [r10, #0x154]
    mov r2, #0xc
    bl GraphicsSpriteState_Create
    mov r8, #0x0
    ldr r11, .L_022103b4
    str r0, [r10, #0x158]
    mov r6, #0x14
    mov r7, r8
    mov r4, #0x78
.L_02210314:
    mul r0, r8, r4
    mov r9, r7
    add r5, r0, r10
.L_02210320:
    ldr r3, .L_022103b8
    mov r0, r6
    mov r1, r11
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02210344
    mov r1, #0x10
    bl func_ov065_0220fd20
.L_02210344:
    add r1, r5, r9, lsl #0x2
    add r9, r9, #0x1
    str r0, [r1, #0x28]
    cmp r9, #0x1e
    blt .L_02210320
    add r8, r8, #0x1
    cmp r8, #0x2
    blt .L_02210314
    ldr r0, [r10, #0x11c]
    cmp r0, #0x3e8
    movlt r1, #0x3
    blt .L_02210380
    cmp r0, #0x7d0
    movlt r1, #0x4
    movge r1, #0x5
.L_02210380:
    bl func_020befec
    str r0, [r10, #0x15c]
    cmp r0, #0x1e
    movlt r0, #0x1e
    strlt r0, [r10, #0x15c]
    mov r0, r10
    bl Scene_SetFlags03
    mov r0, r10
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_022103a8: .word data_ov065_02210bb8
.L_022103ac: .word data_ov065_02210c00
.L_022103b0: .word data_020f4e14
.L_022103b4: .word data_ov065_02210be4
.L_022103b8: .word gHeapContext
.L_022103bc: .word 0x1714
.L_022103c0: .word 0x1625
.L_022103c4: .word 0x100f
.size func_ov065_022101bc, . - func_ov065_022101bc

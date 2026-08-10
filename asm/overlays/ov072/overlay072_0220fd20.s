.text
; Matching fallback for the portable implementation in src/overlays/ov072/overlay072_recovery.c.
.extern Heap_Alloc
.extern Scene_Init
.extern Scene_SetFlags03
.extern data_021052fc
.extern data_ov072_02210b0c
.extern data_ov072_02210b38
.extern AnimationResource_Init
.extern GraphicsSpriteState_Create
.extern Type7Actor_EnterSpecialPresentationState
.extern gHeapContext

.global func_ov072_0220fd20
func_ov072_0220fd20:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0xc
    mov r6, r0
    mov r4, r1
    bl Scene_Init
    ldr r0, .L_0220fee4
    mov r1, #0x0
    str r0, [r6, #0x0]
    str r1, [r6, #0x70]
    str r4, [r6, #0x74]
    sub r0, r1, #0x1
    str r0, [r6, #0x78]
    ldr r0, .L_0220fee8
    str r1, [r6, #0x7c]
    ldr r0, [r0, #0x0]
    cmp r4, #0x0
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    mov r2, #0x4
    ldr r5, [r0, #0x54]
    mov r0, #0x10
    ldrsh r7, [r5, #0x2c]
    ldrsh r8, [r5, #0x2e]
    bne .L_0220fdac
    ldr r1, .L_0220feec
    ldr r3, .L_0220fef0
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0220fda4
    ldr r1, .L_0220fef4
    sub r2, r1, #0xc7
    add r3, r1, #0x1
    bl AnimationResource_Init
.L_0220fda4:
    str r0, [r6, #0x24]
    b .L_0220fdd4
.L_0220fdac:
    ldr r1, .L_0220feec
    ldr r3, .L_0220fef0
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0220fdd0
    ldr r1, .L_0220fef8
    sub r2, r1, #0xc9
    add r3, r1, #0x1
    bl AnimationResource_Init
.L_0220fdd0:
    str r0, [r6, #0x24]
.L_0220fdd4:
    ldrh r1, [r5, #0x28]
    mov r0, #0x6
    mov r2, #0x0
    str r1, [sp, #0x0]
    stmib sp, {r0, r2}
    ldrb r3, [r5, #0x3a]
    ldr r0, [r5, #0x0]
    ldr r1, [r6, #0x24]
    bl GraphicsSpriteState_Create
    str r0, [r6, #0x2c]
    strh r7, [r0, #0x2c]
    strh r8, [r0, #0x2e]
    cmp r4, #0x0
    mov r0, #0x10
    mov r2, #0x4
    bne .L_0220fe40
    ldr r1, .L_0220feec
    ldr r3, .L_0220fef0
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0220fe38
    ldr r1, .L_0220fefc
    sub r2, r1, #0x54
    add r3, r1, #0x1
    bl AnimationResource_Init
.L_0220fe38:
    str r0, [r6, #0x28]
    b .L_0220fe68
.L_0220fe40:
    ldr r1, .L_0220feec
    ldr r3, .L_0220fef0
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0220fe64
    ldr r1, .L_0220ff00
    sub r2, r1, #0x56
    add r3, r1, #0x1
    bl AnimationResource_Init
.L_0220fe64:
    str r0, [r6, #0x28]
.L_0220fe68:
    mov r4, #0x0
    mov r9, #0x6
    mov r8, r4
    mov r7, r4
.L_0220fe78:
    ldrh r0, [r5, #0x28]
    mov r2, r8
    sub r0, r0, #0x1
    stmia sp, {r0, r9}
    str r8, [sp, #0x8]
    ldrb r3, [r5, #0x3a]
    ldr r0, [r5, #0x0]
    ldr r1, [r6, #0x28]
    bl GraphicsSpriteState_Create
    add r1, r6, r4, lsl #0x2
    str r0, [r1, #0x30]
    add r4, r4, #0x1
    str r7, [r1, #0x50]
    cmp r4, #0x8
    blt .L_0220fe78
    ldr r0, .L_0220fee8
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea8]
    cmp r0, #0x0
    beq .L_0220fed0
    bl Type7Actor_EnterSpecialPresentationState
.L_0220fed0:
    mov r0, r6
    bl Scene_SetFlags03
    mov r0, r6
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_0220fee4: .word data_ov072_02210b0c
.L_0220fee8: .word data_021052fc
.L_0220feec: .word data_ov072_02210b38
.L_0220fef0: .word gHeapContext
.L_0220fef4: .word 0x10c8
.L_0220fef8: .word 0x10ca
.L_0220fefc: .word 0x10cc
.L_0220ff00: .word 0x10ce
.size func_ov072_0220fd20, . - func_ov072_0220fd20

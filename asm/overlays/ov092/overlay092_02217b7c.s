.text
; Matching fallback for the portable implementation in src/overlays/ov092/overlay092_recovery.c.
.extern Heap_Alloc
.extern data_021052fc
.extern data_ov092_0221c818
.extern AnimationResource_Init
.extern GraphicsSpriteState_Create
.extern ActorCollection_GetSpriteOwner
.extern Actor_GetCollection
.extern Type7Actor_SetActorEnabled
.extern func_0204d3d8
.extern GraphicsSpriteState_SetAnimationIndex
.extern gHeapContext

.global func_ov092_02217b7c
func_ov092_02217b7c:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0xc
    mov r4, r0
    bl func_0204d3d8
    ldr r1, .L_02217c98
    ldr r3, .L_02217c9c
    mov r0, #0x10
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02217bb8
    ldr r1, .L_02217ca0
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl AnimationResource_Init
.L_02217bb8:
    str r0, [r4, #0x244]
    mov r0, r4
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    mov r2, #0x0
    str r2, [sp, #0x0]
    mov r1, #0x6
    stmib sp, {r1, r2}
    ldr r1, [r4, #0x244]
    mov r3, r2
    bl GraphicsSpriteState_Create
    str r0, [r4, #0x248]
    mov r1, #0x7d
    strh r1, [r0, #0x2c]
    mov r1, #0x9a
    strh r1, [r0, #0x2e]
    ldr r0, [r4, #0x248]
    mov r1, #0x3
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, .L_02217c98
    ldr r3, .L_02217c9c
    mov r0, #0x10
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02217c30
    ldr r1, .L_02217ca4
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl AnimationResource_Init
.L_02217c30:
    str r0, [r4, #0x24c]
    mov r0, r4
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    mov r2, #0x0
    str r2, [sp, #0x0]
    mov r1, #0x6
    stmib sp, {r1, r2}
    ldr r1, [r4, #0x24c]
    mov r3, r2
    bl GraphicsSpriteState_Create
    str r0, [r4, #0x250]
    mov r1, #0x80
    strh r1, [r0, #0x2c]
    mov r2, #0x60
    ldr r1, .L_02217ca8
    strh r2, [r0, #0x2e]
    ldr r0, [r1, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea8]
    cmp r0, #0x0
    beq .L_02217c90
    mov r1, #0x0
    bl Type7Actor_SetActorEnabled
.L_02217c90:
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, pc}
.L_02217c98: .word data_ov092_0221c818
.L_02217c9c: .word gHeapContext
.L_02217ca0: .word 0x32c8
.L_02217ca4: .word 0x32f2
.L_02217ca8: .word data_021052fc
.size func_ov092_02217b7c, . - func_ov092_02217b7c

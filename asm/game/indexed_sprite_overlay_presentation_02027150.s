; Matching retail form; see src/game/indexed_sprite_overlay_presentation.c.
.text
.extern Heap_Alloc
.extern data_020c370c
.extern data_020c3734
.extern gIndexedSpriteOverlayPresentationVtable
.extern gSpriteOverlayControllerAllocationTag
.extern data_020f4e14
.extern data_020f4e18
.extern func_0201e250
.extern func_02071ea4
.extern func_02071ee0
.extern GraphicsSpriteState_SetAnimationIndex
.extern GraphicsSpriteGroup_CreateStateFromSource
.extern GraphicsSpriteGroupOwner_CreateGroup
.extern func_02094cf0
.extern func_020953f4
.extern gHeapContext

    .global IndexedSpriteOverlayPresentation_Init
    .type IndexedSpriteOverlayPresentation_Init, @function
IndexedSpriteOverlayPresentation_Init: ; 0x02027150
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl func_0201e250
    ldr r1, .L_02027200
    add r0, r5, #0x8
    str r1, [r5, #0x0]
    bl func_02071ea4
    ldr ip, .L_02027204
    mov r3, r4, lsl #0x3
    add lr, ip, r4, lsl #0x3
    ldrh r2, [lr, #0x4]
    ldr r1, .L_02027208
    add r0, r5, #0x8
    str r2, [sp, #0x0]
    ldrh r2, [ip, r3]
    ldrh r3, [lr, #0x2]
    ldr r1, [r1, #0x0]
    bl func_02071ee0
    ldr r0, .L_0202720c
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_CreateGroup
    add r1, r5, #0x8
    mov r2, #0x2
    str r0, [r5, #0x14]
    bl GraphicsSpriteGroup_CreateStateFromSource
    and r1, r4, #0xff
    mov r4, r0
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, .L_02027210
    ldr r3, .L_02027214
    mov r0, #0xa0
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_020271e8
    mov r1, r4
    bl func_020953f4
.L_020271e8:
    ldr r1, .L_02027218
    mov r2, #0x1
    str r0, [r5, #0x18]
    bl func_02094cf0
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
.L_02027200: .word gIndexedSpriteOverlayPresentationVtable
.L_02027204: .word data_020c370c
.L_02027208: .word data_020f4e18
.L_0202720c: .word data_020f4e14
.L_02027210: .word gSpriteOverlayControllerAllocationTag
.L_02027214: .word gHeapContext
.L_02027218: .word data_020c3734
    .size IndexedSpriteOverlayPresentation_Init, . - IndexedSpriteOverlayPresentation_Init

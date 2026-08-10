.text
; Matching fallback for the portable implementation in src/overlays/ov088/overlay088_recovery.c.
.extern Heap_Alloc
.extern data_021052fc
.extern data_ov088_0221b6ec
.extern data_ov088_0221b6f0
.extern data_ov088_0221b9fc
.extern OverlayManager_LoadOverlay
.extern OverlayManager_GetGlobal
.extern func_02005058
.extern AnimationResource_Init
.extern ActorCollection_GetSpriteOwner
.extern Actor_GetCollection
.extern func_02034a60
.extern Type7Actor_EnterFlag40000State
.extern GraphicsSpriteGroup_CreateState
.extern func_ov062_02210674
.extern func_ov088_0221a98c
.extern gHeapContext

.global func_ov088_0221af2c
func_ov088_0221af2c:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x1c
    ldr r2, .L_0221b07c
    mov r5, r1
    ldr r2, [r2, #0x0]
    ldr r1, .L_0221b080
    mov r6, r0
    add r4, r2, #0x2000
    ldr r3, .L_0221b084
    mov r0, #0x10
    mov r2, #0x4
    ldr r4, [r4, #0xea8]
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0221af7c
    ldr r3, [r4, #0x29c]
    ldrh r1, [r3, #0x14]
    ldrh r2, [r3, #0x16]
    ldrh r3, [r3, #0x18]
    bl AnimationResource_Init
.L_0221af7c:
    mov r7, r0
    str r0, [r6, #0x24c]
    mov r0, r6
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    mov r1, #0x2
    str r1, [sp, #0x0]
    ldmib r7, {r1, r2, r3}
    bl GraphicsSpriteGroup_CreateState
    str r0, [r6, #0x250]
    ldrh r1, [r0, #0x24]
    cmp r5, #0x0
    orr r1, r1, #0x6
    strh r1, [r0, #0x24]
    ble .L_0221b05c
    ldr r1, .L_0221b088
    mov r0, r6
    mov r2, #0x0
    bl func_02034a60
    add r0, sp, #0xc
    mov r1, r6
    bl func_ov088_0221a98c
    ldrb r1, [r6, #0xd4]
    ldr r0, .L_0221b08c
    ldr r2, [sp, #0x10]
    ldr r1, [r0, r1, lsl #0x3]
    ldr r0, .L_0221b090
    add r1, r2, r1
    str r1, [sp, #0x10]
    ldrb r1, [r6, #0xd4]
    ldr r2, [sp, #0x14]
    ldr r0, [r0, r1, lsl #0x3]
    add r0, r2, r0
    str r0, [sp, #0x14]
    bl OverlayManager_GetGlobal
    ldr r2, .L_0221b094
    mov r1, #0x2
    bl OverlayManager_LoadOverlay
    ldr r1, .L_0221b080
    ldr r3, .L_0221b084
    mov r0, #0x40
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0221b054
    str r5, [sp, #0x0]
    mov r3, #0x1
    str r3, [sp, #0x4]
    mov r5, #0x0
    add r2, sp, #0xc
    mov r1, r4
    mov r3, #0x20
    str r5, [sp, #0x8]
    bl func_ov062_02210674
.L_0221b054:
    add r0, sp, #0xc
    bl func_02005058
.L_0221b05c:
    add r1, r6, #0x200
    ldrh r2, [r1, #0x1a]
    mov r0, r4
    orr r2, r2, #0x40
    strh r2, [r1, #0x1a]
    bl Type7Actor_EnterFlag40000State
    add sp, sp, #0x1c
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_0221b07c: .word data_021052fc
.L_0221b080: .word data_ov088_0221b9fc
.L_0221b084: .word gHeapContext
.L_0221b088: .word 0xfd86
.L_0221b08c: .word data_ov088_0221b6ec
.L_0221b090: .word data_ov088_0221b6f0
.L_0221b094: .word 0x3e
.size func_ov088_0221af2c, . - func_ov088_0221af2c

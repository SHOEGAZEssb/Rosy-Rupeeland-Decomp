.text
; Matching fallback for the portable implementation in src/overlays/ov088/overlay088_recovery.c.
.extern Heap_Alloc
.extern data_021052fc
.extern data_ov088_0221b9fc
.extern VecFx32Object_Assign
.extern AnimationResource_Init
.extern Actor_AdjustPositionForTerrainHeight
.extern Actor_GetCachedTerrainHeight
.extern func_02034568
.extern GraphicsSpriteState_SetAnimationIndex
.extern GraphicsSpriteGroup_ReplaceStateResources
.extern func_ov088_02218280
.extern func_ov088_0221ad6c
.extern func_ov088_0221ad84
.extern gHeapContext

.global func_ov088_0221aaac
func_ov088_0221aaac:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #0x4
    mov r4, r0
    ldr r1, [r4, #0x10]
    bic r1, r1, #0x1000000
    str r1, [r4, #0x10]
    bl Actor_AdjustPositionForTerrainHeight
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x38
    bl func_ov088_02218280
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x88
    bl func_ov088_02218280
    mov r1, #0x0
    add r0, r4, #0x98
    mov r2, r1
    mov r3, r1
    bl func_ov088_02218280
    ldr r0, [r4, #0x20]
    ldr r5, [r4, #0x1c]
    mov r9, r0, asr #0xc
    add r0, r4, #0x4
    mov r8, r5, asr #0xc
    bl func_ov088_0221ad6c
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    add r6, r0, #0x2
    add r0, r4, #0x4
    bl func_ov088_0221ad84
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    add r7, r0, #0x2
    mov r0, r4
    bl Actor_GetCachedTerrainHeight
    add r2, r6, r5, asr #0xc
    mov r5, r0, asr #0x10
    mov r0, r9, asr #0x3
    add r0, r9, r0, lsr #0x1c
    mov r1, r2, asr #0x3
    mov r10, r0, asr #0x4
    add r1, r2, r1, lsr #0x1c
    mov r0, r4
    mov r1, r1, asr #0x4
    mov r2, r10
    mov r3, r5
    bl func_02034568
    cmp r0, #0x0
    ldreq r0, [r4, #0x8c]
    sub r1, r8, r6
    subeq r0, r0, #0x2000
    streq r0, [r4, #0x8c]
    mov r0, r1, asr #0x3
    add r1, r1, r0, lsr #0x1c
    mov r0, r4
    mov r2, r10
    mov r3, r5
    mov r1, r1, asr #0x4
    bl func_02034568
    cmp r0, #0x0
    ldreq r0, [r4, #0x8c]
    add r2, r9, r7
    addeq r0, r0, #0x2000
    streq r0, [r4, #0x8c]
    mov r0, r8, asr #0x3
    add r0, r8, r0, lsr #0x1c
    mov r1, r2, asr #0x3
    mov r6, r0, asr #0x4
    add r2, r2, r1, lsr #0x1c
    mov r0, r4
    mov r1, r6
    mov r3, r5
    mov r2, r2, asr #0x4
    bl func_02034568
    cmp r0, #0x0
    ldreq r0, [r4, #0x90]
    sub r1, r9, r7
    subeq r0, r0, #0x2000
    streq r0, [r4, #0x90]
    mov r0, r1, asr #0x3
    add r2, r1, r0, lsr #0x1c
    mov r0, r4
    mov r1, r6
    mov r3, r5
    mov r2, r2, asr #0x4
    bl func_02034568
    cmp r0, #0x0
    ldreq r0, [r4, #0x8c]
    addeq r0, r0, #0x2000
    streq r0, [r4, #0x8c]
    ldr r0, .L_0221ad60
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, r1
    add r0, r0, #0x2000
    ldr r5, [r0, #0xea4]
    mov r3, r1
    add r0, r5, #0x38
    bl func_ov088_02218280
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r5, #0x88
    bl func_ov088_02218280
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r5, #0x98
    bl func_ov088_02218280
    ldr r1, [r5, #0x14]
    add r0, r5, #0x18
    orr r1, r1, #0x2
    str r1, [r5, #0x14]
    add r1, r4, #0x18
    bl VecFx32Object_Assign
    ldr r0, .L_0221ad60
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r7, [r0, #0xea8]
    cmp r7, #0x0
    ldrne r0, [r4, #0x24c]
    cmpne r0, #0x0
    beq .L_0221ad58
    ldr r6, [r7, #0x54]
    ldr r1, .L_0221ad64
    ldrh r2, [r6, #0x24]
    ldr r3, .L_0221ad68
    mov r0, #0x10
    orr r5, r2, #0x4
    mov r2, #0x4
    strh r5, [r6, #0x24]
    bl Heap_Alloc
    movs r5, r0
    beq .L_0221ace8
    ldr r3, [r7, #0x29c]
    ldrh r1, [r3, #0x14]
    ldrh r2, [r3, #0x16]
    ldrh r3, [r3, #0x18]
    bl AnimationResource_Init
    mov r5, r0
.L_0221ace8:
    ldr r1, [r4, #0x250]
    ldr r0, [r5, #0xc]
    ldrb r7, [r1, #0x38]
    ldrh r6, [r1, #0x24]
    str r0, [sp, #0x0]
    ldr r0, [r1, #0x0]
    ldmib r5, {r2, r3}
    bl GraphicsSpriteGroup_ReplaceStateResources
    ldr r0, [r4, #0x24c]
    cmp r0, #0x0
    beq .L_0221ad20
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0221ad20:
    ldr r0, [r4, #0x250]
    and r1, r7, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r2, [r4, #0x250]
    mov r0, #0x10000
    ldrh r1, [r2, #0x24]
    rsb r0, r0, #0x0
    and r0, r1, r0
    strh r0, [r2, #0x24]
    ldr r1, [r4, #0x250]
    ldrh r0, [r1, #0x24]
    orr r0, r0, r6
    strh r0, [r1, #0x24]
    str r5, [r4, #0x24c]
.L_0221ad58:
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, pc}
.L_0221ad60: .word data_021052fc
.L_0221ad64: .word data_ov088_0221b9fc
.L_0221ad68: .word gHeapContext
.size func_ov088_0221aaac, . - func_ov088_0221aaac

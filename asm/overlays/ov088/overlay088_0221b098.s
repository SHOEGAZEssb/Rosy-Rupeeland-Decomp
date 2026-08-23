.text
; Matching fallback for the portable implementation in src/overlays/ov088/overlay088_recovery.c.
.extern Heap_Alloc
.extern data_021052fc
.extern data_ov088_0221b6ec
.extern data_ov088_0221b6f0
.extern data_ov088_0221b9fc
.extern OverlayManager_LoadOverlay
.extern OverlayManager_GetGlobal
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern Actor_PlayRadialSpatialSound
.extern Type7Actor_ResetMotionAndCooldown
.extern GraphicsSpriteState_ReleaseFromGroup
.extern func_ov062_02210674
.extern func_ov088_0221a98c
.extern func_ov088_0221a9c0
.extern gHeapContext

.global func_ov088_0221b098
func_ov088_0221b098:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x2c
    ldr r1, .L_0221b1fc
    mov r5, r0
    ldr r1, [r1, #0x0]
    ldr r0, [r5, #0x250]
    add r1, r1, #0x2000
    ldr r4, [r1, #0xea8]
    bl GraphicsSpriteState_ReleaseFromGroup
    mov r0, #0x0
    str r0, [r5, #0x250]
    ldr r0, [r5, #0x24c]
    cmp r0, #0x0
    beq .L_0221b0dc
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0221b0dc:
    ldr r1, .L_0221b200
    mov r2, #0x0
    mov r0, r5
    str r2, [r5, #0x24c]
    bl Actor_PlayRadialSpatialSound
    add r0, sp, #0x1c
    mov r1, r5
    bl func_ov088_0221a98c
    ldrb r1, [r5, #0xd4]
    ldr r0, .L_0221b204
    ldr r2, [sp, #0x20]
    ldr r1, [r0, r1, lsl #0x3]
    ldr r0, .L_0221b208
    add r1, r2, r1
    str r1, [sp, #0x20]
    ldrb r2, [r5, #0xd4]
    ldr r3, [sp, #0x24]
    add r1, sp, #0x1c
    ldr r2, [r0, r2, lsl #0x3]
    add r0, r4, #0x28
    add r2, r3, r2
    str r2, [sp, #0x24]
    bl VecFx32Object_Assign
    mov r1, r0
    add r0, r4, #0x18
    bl VecFx32Object_Assign
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x4
    strh r0, [r1, #0x24]
    bl OverlayManager_GetGlobal
    ldr r2, .L_0221b20c
    mov r1, #0x2
    bl OverlayManager_LoadOverlay
    ldr r1, .L_0221b210
    ldr r3, .L_0221b214
    mov r0, #0x40
    mov r2, #0x4
    mov r7, #0x0
    bl Heap_Alloc
    movs r6, r0
    beq .L_0221b1bc
    add r0, sp, #0xc
    mov r1, r5
    bl func_ov088_0221a9c0
    mov r0, #0x1e
    str r0, [sp, #0x0]
    mov r0, r7
    str r0, [sp, #0x4]
    add r2, sp, #0xc
    mov r0, r6
    mov r1, r4
    mov r3, #0x20
    str r4, [sp, #0x8]
    mov r7, #0x1
    bl func_ov062_02210674
.L_0221b1bc:
    cmp r7, #0x0
    beq .L_0221b1cc
    add r0, sp, #0xc
    bl VecFx32Object_Destroy
.L_0221b1cc:
    ldr r1, [r4, #0x14]
    mov r0, r4
    bic r1, r1, #0x10000000
    str r1, [r4, #0x14]
    ldr r1, [r4, #0x268]
    bic r1, r1, #0x40000
    str r1, [r4, #0x268]
    bl Type7Actor_ResetMotionAndCooldown
    add r0, sp, #0x1c
    bl VecFx32Object_Destroy
    add sp, sp, #0x2c
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_0221b1fc: .word data_021052fc
.L_0221b200: .word 0xfd86
.L_0221b204: .word data_ov088_0221b6ec
.L_0221b208: .word data_ov088_0221b6f0
.L_0221b20c: .word 0x3e
.L_0221b210: .word data_ov088_0221b9fc
.L_0221b214: .word gHeapContext
.size func_ov088_0221b098, . - func_ov088_0221b098

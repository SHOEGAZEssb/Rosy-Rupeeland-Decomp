.text

/* Exact fallback; see src/overlays/ov025/overlay025_record_select_state.c. */
.extern data_020f4e14
.extern data_ov025_02202de8
.extern data_ov025_02202df8
.extern data_ov025_02202e08
.extern data_ov025_02202e40
.extern data_ov025_02202ec8
.extern data_ov025_02202ed8
.extern GraphicsSpriteGroup_ReleaseIndexedEntries
.extern GraphicsSpriteRenderer_ClearTextBuffer
.extern TitleInterpolatedValue_Configure
.extern func_02091c7c
.extern func_02091cf0
.extern SceneSound_PlayPackedEffect
.extern GraphicsSpriteState_TestTouchPoint
.extern SpriteMotionController_BeginHitResponse
.extern func_ov025_021fd9e4
.extern func_ov025_021fdc4c
.extern func_ov025_021fdea0
.extern func_ov025_021ff0b0
.extern func_ov025_021ff254
.extern func_ov025_02200178
.extern func_ov025_022001f4
.extern func_ov025_02200564
.extern func_ov025_02200648
.extern func_ov025_02200824


    .global func_ov025_02200fe4
func_ov025_02200fe4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #0x4
    mov r5, r0
    ldr r1, [r5, #0x4]
    cmp r1, #0xa
    bgt L_02201028
    bge L_0220126c
    cmp r1, #0x2
    bgt L_02201314
    cmp r1, #0x0
    blt L_02201314
    beq L_02201034
    cmp r1, #0x1
    beq L_02201068
    cmp r1, #0x2
    beq L_022011f4
    b L_02201314
L_02201028:
    cmp r1, #0xb
    beq L_022012a0
    b L_02201314
L_02201034:
    mov r1, #0x4
    bl func_ov025_02200824
    ldr r0, [r5, #0x8]
    add r0, r0, #0x1
    str r0, [r5, #0x8]
    cmp r0, #0x14
    ble L_02201314
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
    b L_02201314
L_02201068:
    mov r1, #0x4
    bl func_ov025_02200824
    ldr r0, [r5, #0x20]
    mov r0, r0, lsl #0x1a
    movs r0, r0, asr #0x1f
    beq L_02201314
    mov r4, #0x0
    mov r6, r4
    b L_0220110c
L_0220108c:
    add r0, r5, r6, lsl #0x2
    ldr r0, [r0, #0xe4]
    add r1, r5, #0x30
    ldr r0, [r0, #0x10]
    bl GraphicsSpriteState_TestTouchPoint
    cmp r0, #0x0
    beq L_02201108
    ldr r0, [r5, #0x54]
    mov r4, #0x1
    cmp r6, r0
    bne L_022010d8
    mov r0, r5
    mov r1, #0x2
    bl SceneSound_PlayPackedEffect
    mov r0, #0xa
    str r0, [r5, #0x4]
    mov r0, #0x0
    str r0, [r5, #0x8]
    b L_02201114
L_022010d8:
    ldr r1, L_02201328
    mov r0, r5
    bl SceneSound_PlayPackedEffect
    mov r0, r5
    mov r1, r6
    bl func_ov025_02200648
    mov r0, r5
    bl func_ov025_022001f4
    mov r0, #0x0
    str r0, [r5, #0x4]
    str r0, [r5, #0x8]
    b L_02201114
L_02201108:
    add r6, r6, #0x1
L_0220110c:
    cmp r6, #0x3
    blt L_0220108c
L_02201114:
    cmp r4, #0x0
    bne L_02201188
    mov r10, #0x0
    add r9, r5, #0x2f4
    mov r8, r10
    mov r7, #0x4
    mov r6, #0xac
    b L_02201180
L_02201134:
    mla r0, r10, r6, r9
    mov r2, r8
    mov r3, r7
    add r1, r5, #0x30
    bl SpriteMotionController_BeginHitResponse
    cmp r0, #0x0
    beq L_0220117c
    mov r0, r5
    str r10, [r5, #0x5b8]
    mov r1, #0x2
    bl SceneSound_PlayPackedEffect
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
    mov r4, #0x1
    b L_02201188
L_0220117c:
    add r10, r10, #0x1
L_02201180:
    cmp r10, #0x3
    blt L_02201134
L_02201188:
    cmp r4, #0x0
    bne L_02201314
    ldr r0, L_0220132c
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteRenderer_ClearTextBuffer
    mov r6, #0x0
    mov r4, r6
L_022011a4:
    add r0, r5, r6, lsl #0x2
    ldr r0, [r0, #0xe4]
    ldr r0, [r0, #0xc]
    bl GraphicsSpriteGroup_ReleaseIndexedEntries
    add r0, r5, r6, lsl #0x2
    ldr r0, [r0, #0xe4]
    mov r1, r4
    bl func_ov025_021fd9e4
    add r6, r6, #0x1
    cmp r6, #0x3
    blt L_022011a4
    mvn r1, #0x0
    mov r0, r5
    str r1, [r5, #0x54]
    bl func_ov025_02200564
    ldr r1, L_02201330
    mov r0, r5
    ldmia r1, {r1, r2}
    bl func_ov025_021ff254
    b L_02201314
L_022011f4:
    ldr r1, [r5, #0x5b8]
    add r2, r5, #0x2f4
    mov r0, #0xac
    mla r0, r1, r0, r2
    bl func_ov025_021ff0b0
    cmp r0, #0x0
    beq L_02201314
    ldr r0, [r5, #0x5b8]
    cmp r0, #0x0
    beq L_02201230
    cmp r0, #0x1
    beq L_02201244
    cmp r0, #0x2
    beq L_02201258
    b L_02201314
L_02201230:
    ldr r1, L_02201334
    mov r0, r5
    ldmia r1, {r1, r2}
    bl func_ov025_021ff254
    b L_02201314
L_02201244:
    ldr r1, L_02201338
    mov r0, r5
    ldmia r1, {r1, r2}
    bl func_ov025_021ff254
    b L_02201314
L_02201258:
    ldr r1, L_0220133c
    mov r0, r5
    ldmia r1, {r1, r2}
    bl func_ov025_021ff254
    b L_02201314
L_0220126c:
    add r0, r5, #0x1fc
    mov r1, #0x6
    str r1, [sp, #0x0]
    add r0, r0, #0x400
    mov r1, #0x3
    mov r2, #0x0
    mov r3, #0x4
    bl TitleInterpolatedValue_Configure
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
L_022012a0:
    add r0, r5, #0x1fc
    add r0, r0, #0x400
    mov r1, #0x1
    bl func_02091c7c
    ldr r2, [r5, #0x54]
    mov r1, r0
    add r0, r5, r2, lsl #0x2
    ldr r0, [r0, #0xe4]
    bl func_ov025_021fdea0
    add r0, r5, #0x1fc
    add r0, r0, #0x400
    bl func_02091cf0
    cmp r0, #0x0
    beq L_02201314
    ldr r0, [r5, #0x54]
    add r0, r5, r0, lsl #0x2
    ldr r0, [r0, #0xe4]
    bl func_ov025_021fdc4c
    cmp r0, #0x0
    beq L_02201304
    ldr r1, L_02201340
    mov r0, r5
    ldmia r1, {r1, r2}
    bl func_ov025_021ff254
    b L_02201314
L_02201304:
    ldr r1, L_02201344
    mov r0, r5
    ldmia r1, {r1, r2}
    bl func_ov025_021ff254
L_02201314:
    mov r0, r5
    bl func_ov025_02200178
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, pc}
L_02201328: .word 0x2d02
L_0220132c: .word data_020f4e14
L_02201330: .word data_ov025_02202df8
L_02201334: .word data_ov025_02202ec8
L_02201338: .word data_ov025_02202e40
L_0220133c: .word data_ov025_02202e08
L_02201340: .word data_ov025_02202de8
L_02201344: .word data_ov025_02202ed8
.size func_ov025_02200fe4, .-func_ov025_02200fe4


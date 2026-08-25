    .text

/* Exact fallback; see src/overlays/ov016/overlay016_state_list_alt.c. */
    .extern data_ov016_02201480
    .extern SceneSound_PlayPackedEffect
    .extern SceneSound_StopPackedEffect
    .extern InventoryScroll_SaveOrigins
    .extern InventoryScroll_UpdateInterpolation
    .extern InventoryScroll_BeginMarkerDrag
    .extern InventoryScroll_UpdateMarkerDrag
    .extern InventoryScroll_EndMarkerDrag
    .extern func_ov016_021fd640
    .extern Overlay016ActorValue_Init
    .extern func_ov016_021ff7bc
    .extern func_ov016_021ffba4
    .extern Overlay016_SyncSelectedPanel
.global func_ov016_02200488
func_ov016_02200488:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r1, [r5, #0x444]
    ldr r0, [r5, #0x4]
    ldr r4, [r1, #0x58]
    cmp r0, #0x0
    beq L_022004b8
    cmp r0, #0x1
    beq L_022004d8
    cmp r0, #0x2
    beq L_0220054c
    b L_022005b4
L_022004b8:
    mov r0, r4
    mov r1, #0x4
    bl InventoryScroll_BeginMarkerDrag
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
L_022004d8:
    mov r0, r4
    bl InventoryScroll_UpdateInterpolation
    cmp r0, #0x0
    beq L_02200530
    ldr r1, [r4, #0xc]
    ldr r0, [r4, #0x10]
    cmp r1, r0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne L_02200518
    mov r0, r5
    bl Overlay016_SyncSelectedPanel
    mov r0, r5
    mov r1, #0x8
    bl SceneSound_StopPackedEffect
L_02200518:
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
    b L_0220054c
L_02200530:
    ldr r0, [r5, #0x444]
    bl func_ov016_021fd640
    cmp r0, #0x0
    beq L_022005b4
    mov r0, r5
    bl func_ov016_021ffba4
    b L_022005b4
L_0220054c:
    mov r0, r4
    bl InventoryScroll_SaveOrigins
    ldr r0, [r5, #0x20]
    mov r0, r0, lsl #0x1b
    movs r0, r0, asr #0x1f
    mov r0, r4
    beq L_0220059c
    add r1, r5, #0x30
    bl InventoryScroll_UpdateMarkerDrag
    cmp r0, #0x0
    beq L_022005b4
    mov r0, r5
    mov r1, #0x8
    bl SceneSound_PlayPackedEffect
    ldr r1, [r5, #0x4]
    mov r0, #0x0
    sub r1, r1, #0x1
    str r1, [r5, #0x4]
    str r0, [r5, #0x8]
    b L_022005b4
L_0220059c:
    mov r1, #0x6
    bl InventoryScroll_EndMarkerDrag
    ldr r1, L_022005c4
    mov r0, r5
    ldmia r1, {r1, r2}
    bl Overlay016ActorValue_Init
L_022005b4:
    mov r0, r5
    bl func_ov016_021ff7bc
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_022005c4: .word data_ov016_02201480
    .size func_ov016_02200488, . - func_ov016_02200488


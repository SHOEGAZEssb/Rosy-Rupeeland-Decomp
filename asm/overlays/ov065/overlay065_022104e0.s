.text
; Matching fallback for the portable implementation in src/overlays/ov065/overlay065_recovery.c.
.extern Heap_Free
.extern Scene_ClearFlags03
.extern Scene_Destroy
.extern data_020f4e14
.extern data_ov065_02210bb8
.extern data_ov065_02210c00
.extern OverlayManager_UnloadOverlay
.extern OverlayManager_GetGlobal
.extern VecFx32Object_Destroy
.extern VecFx32Triple_Destroy
.extern GraphicsSpriteGroup_Clear
.extern GraphicsSpriteGroupOwner_DestroyGroup

.global Overlay065Scene_Delete
Overlay065Scene_Delete:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    ldr r1, .L_022105f4
    mov r10, r0
    str r1, [r10, #0x0]
    bl Scene_ClearFlags03
    mov r5, #0x0
    mov r11, r5
    mov r4, #0x78
.L_02210500:
    mla r9, r5, r4, r10
    mov r6, r11
.L_02210508:
    add r0, r9, r6, lsl #0x2
    ldr r7, [r0, #0x28]
    cmp r7, #0x0
    beq .L_0221053c
    ldr r8, [r7, #0x10]
    cmp r8, #0x0
    beq .L_02210534
    mov r0, r8
    bl VecFx32Triple_Destroy
    mov r0, r8
    bl Heap_Free
.L_02210534:
    mov r0, r7
    bl Heap_Free
.L_0221053c:
    add r6, r6, #0x1
    cmp r6, #0x1e
    blt .L_02210508
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_02210500
    ldr r0, [r10, #0x24]
    bl GraphicsSpriteGroup_Clear
    ldr r0, .L_022105f8
    ldr r1, [r10, #0x24]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_DestroyGroup
    ldr r0, [r10, #0x14c]
    cmp r0, #0x0
    beq .L_02210584
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02210584:
    ldr r0, [r10, #0x150]
    cmp r0, #0x0
    beq .L_0221059c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0221059c:
    ldr r0, [r10, #0x154]
    cmp r0, #0x0
    beq .L_022105b4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_022105b4:
    ldr r0, .L_022105fc
    mov r1, #0x0
    str r1, [r0, #0x0]
    bl OverlayManager_GetGlobal
    mov r1, #0x2
    bl OverlayManager_UnloadOverlay
    add r0, r10, #0x134
    bl VecFx32Object_Destroy
    add r0, r10, #0x124
    bl VecFx32Object_Destroy
    mov r0, r10
    bl Scene_Destroy
    mov r0, r10
    bl Heap_Free
    mov r0, r10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_022105f4: .word data_ov065_02210bb8
.L_022105f8: .word data_020f4e14
.L_022105fc: .word data_ov065_02210c00
.size Overlay065Scene_Delete, . - Overlay065Scene_Delete

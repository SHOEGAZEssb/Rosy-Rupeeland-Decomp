.text
; Matching fallback for the portable implementation in src/overlays/ov062/overlay062_recovery.c.
.extern GameWork_TestFlag
.extern Heap_Free
.extern Scene_ClearFlags03
.extern Scene_Destroy
.extern data_021052fc
.extern data_ov062_02211b34
.extern OverlayManager_UnloadOverlay
.extern OverlayManager_GetGlobal
.extern func_020050a4
.extern func_0200637c
.extern Actor_SetDirectionFromVector
.extern ActorDerivedType1_ResetToBaseState
.extern func_02073ef8
.extern func_ov062_0220fd20
.extern gGameWork

.global func_ov062_02210180
func_ov062_02210180:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_02210318
    mov r4, r0
    str r1, [r4, #0x0]
    bl Scene_ClearFlags03
    ldr r0, [r4, #0x28]
    bl func_02073ef8
    ldr r0, [r4, #0x2c]
    cmp r0, #0x0
    beq .L_022101b4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_022101b4:
    ldr r0, [r4, #0x3c]
    cmp r0, #0x0
    bne .L_022102b0
    ldr r3, [r4, #0x24]
    ldr r0, .L_0221031c
    ldr r2, [r3, #0x14]
    mov r1, #0x3ec
    bic r2, r2, #0x2
    str r2, [r3, #0x14]
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    ldrne r1, [r4, #0x24]
    ldrne r0, [r1, #0x230]
    orrne r0, r0, #0x4
    strne r0, [r1, #0x230]
    ldr r0, [r4, #0x24]
    ldr r1, [r0, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x4
    strh r0, [r1, #0x24]
    ldr r1, [r4, #0x24]
    ldr r0, [r1, #0x230]
    bic r0, r0, #0x100
    str r0, [r1, #0x230]
    ldr r0, [r4, #0x24]
    ldr r1, [r4, #0x30]
    add r0, r0, #0x18
    add r1, r1, #0x10
    bl func_020050a4
    ldr r1, [r4, #0x24]
    add r0, r1, #0x28
    add r1, r1, #0x18
    bl func_020050a4
    mov r1, #0x0
    ldr r0, [r4, #0x24]
    mov r2, r1
    mov r3, r1
    add r0, r0, #0x38
    bl func_ov062_0220fd20
    mov r1, #0x0
    ldr r0, [r4, #0x24]
    mov r2, r1
    add r0, r0, #0x88
    mov r3, r1
    bl func_ov062_0220fd20
    mov r1, #0x0
    ldr r0, [r4, #0x24]
    mov r2, r1
    add r0, r0, #0x98
    mov r3, r1
    bl func_ov062_0220fd20
    ldr ip, [r4, #0x30]
    ldr r0, [r4, #0x24]
    ldr r2, [ip, #0x14]
    ldr r1, [ip, #0x4]
    ldr r3, [ip, #0x18]
    sub r1, r2, r1
    ldr r2, [ip, #0x8]
    sub r2, r3, r2
    bl Actor_SetDirectionFromVector
    ldr r0, [r4, #0x24]
    bl ActorDerivedType1_ResetToBaseState
.L_022102b0:
    ldr r5, [r4, #0x30]
    cmp r5, #0x0
    beq .L_022102cc
    mov r0, r5
    bl func_0200637c
    mov r0, r5
    bl Heap_Free
.L_022102cc:
    ldr r0, [r4, #0x44]
    cmp r0, #0x0
    beq .L_022102e4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x5c]
    blx r1
.L_022102e4:
    ldr r0, .L_02210320
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r1, [r0, #0xfec]
    bic r1, r1, #0x8
    str r1, [r0, #0xfec]
    bl OverlayManager_GetGlobal
    mov r1, #0x2
    bl OverlayManager_UnloadOverlay
    mov r0, r4
    bl Scene_Destroy
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
.L_02210318: .word data_ov062_02211b34
.L_0221031c: .word gGameWork
.L_02210320: .word data_021052fc
.size func_ov062_02210180, . - func_ov062_02210180

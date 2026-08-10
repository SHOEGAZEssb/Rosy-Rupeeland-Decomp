.text
; Matching fallback for the portable implementation in src/overlays/ov064/overlay064_recovery.c.
.extern GameWork_SetFlag
.extern Heap_Free
.extern Scene_Destroy
.extern data_020f4e14
.extern data_021052fc
.extern data_ov064_02211e98
.extern OverlayManager_UnloadOverlay
.extern OverlayManager_GetGlobal
.extern VecFx32Triple_Destroy
.extern func_02007f24
.extern func_020084b8
.extern ActorDerivedType1_ResetRuntimeState
.extern Type7Actor_LeaveSpecialPresentationState
.extern func_020597fc
.extern func_02073ef8
.extern func_02074330
.extern gDebugFont
.extern gGameWork
.extern gSoundContext

.global func_ov064_02210658
func_ov064_02210658:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    ldr r1, .L_02210884
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x30]
    bl func_02073ef8
    ldr r1, [r4, #0x3c]
    cmp r1, #0x0
    beq .L_0221068c
    ldr r0, .L_02210888
    ldr r0, [r0, #0x0]
    bl func_02074330
.L_0221068c:
    ldr r1, [r4, #0x40]
    cmp r1, #0x0
    beq .L_022106a4
    ldr r0, .L_0221088c
    ldr r0, [r0, #0x0]
    bl func_02074330
.L_022106a4:
    ldr r0, [r4, #0x28]
    cmp r0, #0x0
    beq .L_022106bc
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_022106bc:
    ldr r0, [r4, #0x2c]
    cmp r0, #0x0
    beq .L_022106d4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_022106d4:
    ldr r0, [r4, #0x24]
    cmp r0, #0x0
    beq .L_022106ec
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_022106ec:
    ldr r5, [r4, #0x84]
    cmp r5, #0x0
    beq .L_02210708
    mov r0, r5
    bl VecFx32Triple_Destroy
    mov r0, r5
    bl Heap_Free
.L_02210708:
    ldr r0, .L_02210890
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    ldr r2, [r0, #0x54]
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x4
    strh r1, [r2, #0x24]
    bl ActorDerivedType1_ResetRuntimeState
    ldrb r0, [r4, #0x77]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_02210848
.L_0221073c:
    b .L_0221074c
    b .L_0221076c
    b .L_022107c0
    b .L_02210814
.L_0221074c:
    ldrsh r1, [r4, #0x78]
    ldrsh r2, [r4, #0x7a]
    ldr r0, .L_02210890
    mov r1, r1, lsl #0x10
    ldr r0, [r0, #0x0]
    mov r2, r2, lsl #0x10
    bl func_020084b8
    b .L_02210848
.L_0221076c:
    ldr r0, .L_02210894
    mov r1, #0x52
    ldr r0, [r0, #0x0]
    bl func_020597fc
    ldr r0, .L_02210898
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    ldr ip, .L_02210890
    str r1, [sp, #0x0]
    str r1, [sp, #0x4]
    add r0, r0, #0x100
    ldrsh r1, [r0, #0x88]
    ldrsh r2, [r0, #0x8a]
    ldrsh r3, [r0, #0x8c]
    ldr r0, [ip, #0x0]
    bl func_02007f24
    ldr r0, .L_02210898
    mov r1, #0x3f8
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    b .L_02210848
.L_022107c0:
    ldr r0, .L_02210894
    mov r1, #0x53
    ldr r0, [r0, #0x0]
    bl func_020597fc
    ldr r0, .L_02210898
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    ldr ip, .L_02210890
    str r1, [sp, #0x0]
    str r1, [sp, #0x4]
    add r0, r0, #0x100
    ldrsh r1, [r0, #0x88]
    ldrsh r2, [r0, #0x8a]
    ldrsh r3, [r0, #0x8c]
    ldr r0, [ip, #0x0]
    bl func_02007f24
    ldr r0, .L_02210898
    mov r1, #0x3f8
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    b .L_02210848
.L_02210814:
    mov r1, #0x0
    str r1, [sp, #0x0]
    ldr r0, .L_02210890
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r1, #0xc6
    mov r2, #0x100
    mov r3, #0xc0
    bl func_02007f24
    ldr r0, .L_02210898
    mov r1, #0x3f8
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
.L_02210848:
    ldr r0, .L_02210890
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea8]
    cmp r0, #0x0
    beq .L_02210864
    bl Type7Actor_LeaveSpecialPresentationState
.L_02210864:
    bl OverlayManager_GetGlobal
    mov r1, #0x2
    bl OverlayManager_UnloadOverlay
    mov r0, r4
    bl Scene_Destroy
    mov r0, r4
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
.L_02210884: .word data_ov064_02211e98
.L_02210888: .word data_020f4e14
.L_0221088c: .word gDebugFont
.L_02210890: .word data_021052fc
.L_02210894: .word gSoundContext
.L_02210898: .word gGameWork
.size func_ov064_02210658, . - func_ov064_02210658

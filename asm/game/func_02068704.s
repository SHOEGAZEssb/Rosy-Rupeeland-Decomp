.text
; Matching fallback for the portable implementation in src/game/inventory_scene_controller.c.
.extern DisplayBrightness_IsMainTransitionComplete
.extern DisplayBrightness_StartMainTransition
.extern DisplayBrightness_StartSubTransition
.extern GameWork_ClearFlag
.extern GameWork_TestFlag
.extern OverlaySlot_UnloadOverlay
.extern data_020e55a4
.extern func_0206841c
.extern func_02068630
.extern func_02068698
.extern func_02068938
.extern func_02091fb0
.extern func_ov000_021fcb4c
.extern func_ov001_021fca94
.extern gGameWork

.global func_02068704
func_02068704:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x18
    mov r4, r0
    ldr r0, [r4, #0x4]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_02068920
.L_02068720:
    b .L_02068730
    b .L_02068754
    b .L_020687e4
    b .L_02068900
.L_02068730:
    ldr r1, [r4, #0x20]
    mov r0, #0x0
    bic r1, r1, #0x1
    orr r1, r1, #0x1
    str r1, [r4, #0x20]
    ldr r1, [r4, #0x4]
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
.L_02068754:
    ldr r1, [r4, #0x20]
    ldr r0, [r4, #0x54]
    mov r1, r1, lsl #0x1e
    mov r1, r1, asr #0x1f
    bl func_02091fb0
    cmp r0, #0x0
    beq .L_02068920
    ldr r0, .L_0206892c
    ldr r1, .L_02068930
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    bne .L_020687a0
    ldr r0, .L_0206892c
    mov r1, #0x388
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq .L_020687d0
.L_020687a0:
    mov r0, #0x2
    mov r1, #0x10
    bl DisplayBrightness_StartMainTransition
    mov r0, #0x2
    mov r1, #0x10
    bl DisplayBrightness_StartSubTransition
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b .L_02068920
.L_020687d0:
    ldr r1, .L_02068934
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_0206841c
    b .L_02068920
.L_020687e4:
    ldr r0, [r4, #0x54]
    mov r1, #0x0
    bl func_02091fb0
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    beq .L_02068920
    ldr r0, .L_0206892c
    ldr r1, .L_02068930
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    ldr r1, [r4, #0x54]
    beq .L_02068834
    ldr r1, [r1, #0xdc]
    add r0, sp, #0xc
    bl func_ov001_021fca94
    add r1, sp, #0xc
    add r0, r4, #0x7c
    bl func_02068938
    b .L_0206884c
.L_02068834:
    ldr r1, [r1, #0x78]
    add r0, sp, #0x0
    bl func_ov000_021fcb4c
    add r1, sp, #0x0
    add r0, r4, #0x70
    bl func_02068938
.L_0206884c:
    ldr r0, [r4, #0x20]
    bic r0, r0, #0x400
    str r0, [r4, #0x20]
    ldr r0, [r4, #0x54]
    cmp r0, #0x0
    beq .L_02068870
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_02068870:
    mov r1, #0x0
    add r0, r4, #0x58
    str r1, [r4, #0x54]
    bl OverlaySlot_UnloadOverlay
    add r0, r4, #0x64
    bl OverlaySlot_UnloadOverlay
    ldr r0, .L_0206892c
    ldr r1, .L_02068930
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    mov r0, r4
    beq .L_020688ac
    bl func_02068630
    b .L_020688b0
.L_020688ac:
    bl func_02068698
.L_020688b0:
    ldr r0, .L_0206892c
    ldr r1, .L_02068930
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r0, .L_0206892c
    mov r1, #0x388
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    mov r0, #0x1
    mov r1, #0x10
    bl DisplayBrightness_StartMainTransition
    mov r0, #0x1
    mov r1, #0x10
    bl DisplayBrightness_StartSubTransition
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b .L_02068920
.L_02068900:
    ldr r0, [r4, #0x54]
    mov r1, #0x0
    bl func_02091fb0
    bl DisplayBrightness_IsMainTransitionComplete
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r4, #0x4]
    strne r0, [r4, #0x8]
.L_02068920:
    mov r0, #0x0
    add sp, sp, #0x18
    ldmia sp!, {r4, pc}
.L_0206892c: .word gGameWork
.L_02068930: .word 0x387
.L_02068934: .word data_020e55a4
.size func_02068704, . - func_02068704

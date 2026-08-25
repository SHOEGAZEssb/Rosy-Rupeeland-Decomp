.text

/* Exact fallback; see src/overlays/ov024/overlay024_scene_lifecycle.c. */
.extern __destroy_arr
.extern data_ov024_021fe338
.extern AreaInfoPanelPresentation_Destroy
.extern AnimationResourceState_Destroy
.extern GraphicsSpriteGroup_Destroy
.extern func_ov005_021fbb78
.extern func_ov024_021fce00
.extern func_ov046_0220ba80
.extern Heap_Free


    .global func_ov024_021fd214
func_ov024_021fd214:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, L_021fd2ec
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x20]
    bic r0, r0, #0x400
    str r0, [r4, #0x20]
    ldr r5, [r4, #0x2c4]
    cmp r5, #0x0
    beq L_021fd24c
    mov r0, r5
    bl AreaInfoPanelPresentation_Destroy
    mov r0, r5
    bl Heap_Free
L_021fd24c:
    ldr r5, [r4, #0x2c0]
    cmp r5, #0x0
    beq L_021fd268
    mov r0, r5
    bl func_ov046_0220ba80
    mov r0, r5
    bl Heap_Free
L_021fd268:
    ldr r5, [r4, #0x2bc]
    cmp r5, #0x0
    beq L_021fd284
    mov r0, r5
    bl func_ov005_021fbb78
    mov r0, r5
    bl Heap_Free
L_021fd284:
    ldr r0, [r4, #0x7c]
    bl GraphicsSpriteGroup_Destroy
    ldr r0, L_021fd2f0
    mov r1, #0x0
    strh r1, [r0, #0x0]
    add r0, r0, #0x1000
    strh r1, [r0, #0x0]
    mov ip, #0x4000000
    ldr r0, [ip, #0x0]
    ldr r3, L_021fd2f4
    bic lr, r0, #0xe000
    add r0, r4, #0x12c
    mov r1, #0x2
    mov r2, #0xac
    str lr, [ip, #0x0]
    bl __destroy_arr
    add r0, r4, #0x80
    bl func_ov024_021fce00
    add r0, r4, #0x70
    bl AnimationResourceState_Destroy
    add r0, r4, #0x64
    bl AnimationResourceState_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
L_021fd2ec: .word data_ov024_021fe338
L_021fd2f0: .word 0x4000050
L_021fd2f4: .word func_ov024_021fce00
.size func_ov024_021fd214, .-func_ov024_021fd214


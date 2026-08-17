    .text
/* Exact fallback; see src/overlays/ov022/overlay022_status_widget.c. */
    .extern data_ov022_02200608
    .extern AnimationResourceState_Destroy
    .extern GraphicsSpriteGroup_Destroy

.global func_ov022_021fd458
func_ov022_021fd458:
    stmdb sp!, {r4, lr}
    ldr r1, L_021fd488
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x1c]
    bl GraphicsSpriteGroup_Destroy
    add r0, r4, #0x10
    bl AnimationResourceState_Destroy
    add r0, r4, #0x4
    bl AnimationResourceState_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
L_021fd488: .word data_ov022_02200608
.size func_ov022_021fd458, . - func_ov022_021fd458

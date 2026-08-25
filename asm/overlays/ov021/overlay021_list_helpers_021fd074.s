    .text
/* Exact fallback; see src/overlays/ov021/overlay021_list_helpers.c. */
    .extern AnimationResourceState_Destroy
    .extern GraphicsSpriteGroup_Destroy
    .extern func_020927b8
    .extern CxxArray_DestroyAndFree
    .extern Overlay021Row_DestroyNoOp

.global func_ov021_021fd074
func_ov021_021fd074:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x1c]
    bl GraphicsSpriteGroup_Destroy
    ldr r0, [r4, #0x20]
    bl GraphicsSpriteGroup_Destroy
    ldr r0, [r4, #0x58]
    cmp r0, #0x0
    beq L_021fd0a4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fd0a4:
    ldr r0, [r4, #0x4c]
    cmp r0, #0x0
    beq L_021fd0c0
    ldr r3, L_021fd0e0
    mov r1, #0xc
    mov r2, #0x8
    bl CxxArray_DestroyAndFree
L_021fd0c0:
    add r0, r4, #0x28
    bl func_020927b8
    add r0, r4, #0x10
    bl AnimationResourceState_Destroy
    add r0, r4, #0x4
    bl AnimationResourceState_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
L_021fd0e0: .word Overlay021Row_DestroyNoOp
    .size func_ov021_021fd074, . - func_ov021_021fd074


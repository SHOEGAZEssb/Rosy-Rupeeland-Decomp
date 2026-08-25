.text

/* Exact fallback; see src/overlays/ov023/overlay023_pointer_collection.c. */
.extern AnimationResourceState_Destroy
.extern GraphicsSpriteGroup_Destroy
.extern func_020927b8
.extern CxxArray_DestroyAndFree
.extern func_ov023_021fd630


    .global func_ov023_021fd5d0
func_ov023_021fd5d0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    bl GraphicsSpriteGroup_Destroy
    ldr r0, [r4, #0x48]
    cmp r0, #0x0
    beq L_021fd5f8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fd5f8:
    ldr r0, [r4, #0x3c]
    cmp r0, #0x0
    beq L_021fd614
    ldr r3, L_021fd62c
    mov r1, #0x4
    mov r2, #0x8
    bl CxxArray_DestroyAndFree
L_021fd614:
    add r0, r4, #0x18
    bl func_020927b8
    add r0, r4, #0x8
    bl AnimationResourceState_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
L_021fd62c: .word func_ov023_021fd630
.size func_ov023_021fd5d0, .-func_ov023_021fd5d0


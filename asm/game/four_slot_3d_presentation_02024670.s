; Matching retail form; see src/game/four_slot_3d_presentation.c.
.text
.extern __destroy_arr
.extern func_0201e28c
.extern DisplayControlElement_NoOp

    .global FourSlot3DPresentation_Destroy
    .type FourSlot3DPresentation_Destroy, @function
FourSlot3DPresentation_Destroy: ; 0x02024670
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r3, .L_0202469c
    add r0, r4, #0x1c
    mov r1, #0x4
    mov r2, #0x1c
    bl __destroy_arr
    mov r0, r4
    bl func_0201e28c
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0202469c: .word DisplayControlElement_NoOp
    .size FourSlot3DPresentation_Destroy, . - FourSlot3DPresentation_Destroy

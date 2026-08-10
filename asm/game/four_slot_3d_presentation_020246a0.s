; Matching retail form; see src/game/four_slot_3d_presentation.c.
.text
.extern Heap_Free
.extern __destroy_arr
.extern func_0201e28c
.extern DisplayControlElement_NoOp

    .global FourSlot3DPresentation_DestroyAndFree
    .type FourSlot3DPresentation_DestroyAndFree, @function
FourSlot3DPresentation_DestroyAndFree: ; 0x020246a0
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r3, .L_020246d4
    add r0, r4, #0x1c
    mov r1, #0x4
    mov r2, #0x1c
    bl __destroy_arr
    mov r0, r4
    bl func_0201e28c
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_020246d4: .word DisplayControlElement_NoOp
    .size FourSlot3DPresentation_DestroyAndFree, . - FourSlot3DPresentation_DestroyAndFree

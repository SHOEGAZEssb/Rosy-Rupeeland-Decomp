; Matching retail form; see src/game/dual_screen_ui_presentation_base.c.
.text
.extern Heap_Free
.extern data_020d6b3c
.extern func_02026514
.extern AnimationResourceState_Destroy
.extern GraphicsSpriteGroupOwner_DestroyGroup
.extern gDebugFont

    .global func_02025b94
    .type func_02025b94, @function
func_02025b94: ; 0x02025b94
    stmdb sp!, {r4, lr}
    ldr r1, .L_02025bd4
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, .L_02025bd8
    ldr r1, [r4, #0xa8]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_DestroyGroup
    add r0, r4, #0xb8
    bl AnimationResourceState_Destroy
    add r0, r4, #0x4
    bl func_02026514
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02025bd4: .word data_020d6b3c
.L_02025bd8: .word gDebugFont
    .size func_02025b94, . - func_02025b94

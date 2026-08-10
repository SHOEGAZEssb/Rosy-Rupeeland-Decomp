; Matching retail form; see src/game/game_phase_currency_hud_lifecycle.c.
.text
.extern gAnimationResourceVTable
.extern func_02071e90

    .global AnimationResource_InitEmpty
AnimationResource_InitEmpty: ; 0x02010854
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x4
    bl func_02071e90
    ldr r1, L_02010874
    mov r0, r4
    str r1, [r4, #0x0]
    ldmia sp!, {r4, pc}
L_02010874: .word gAnimationResourceVTable
    .size AnimationResource_InitEmpty, . - AnimationResource_InitEmpty


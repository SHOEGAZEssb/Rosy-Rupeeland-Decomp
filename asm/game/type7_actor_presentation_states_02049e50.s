; Matching retail form; see src/game/type7_actor_presentation_states.c.
.extern data_021052fc
.extern gSoundContext
.extern Type7Actor_DispatchCurrentCallback
.extern func_020593dc
.text
    .global func_02049e50
.type func_02049e50, @function
func_02049e50: ; 0x02049e50
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0x268]
    mov r2, #0x11
    bic r1, r1, #0x8000
    str r1, [r0, #0x268]
    ldr r3, [r0, #0xd0]
    ldr r1, .L_02049e9c
    bic r3, r3, #0x2
    str r3, [r0, #0xd0]
    strh r2, [r0, #0xd6]
    ldr r1, [r1, #0x0]
    add r1, r1, #0x2000
    ldr r1, [r1, #0xea4]
    ldr r1, [r1, #0x270]
    cmp r1, #0x0
    bne .L_02049e94
    bl Type7Actor_DispatchCurrentCallback
.L_02049e94:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_02049e9c: .word data_021052fc
.size func_02049e50, . - func_02049e50

    .global func_02049ea0
.type func_02049ea0, @function
func_02049ea0: ; 0x02049ea0
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    mov r4, r0
    add r0, r4, #0x200
    ldrsh r0, [r0, #0x48]
    cmp r0, #0x1
    bne .L_02049ee0
    mov r1, #0x0
    str r1, [sp, #0x0]
    mov r2, #0x100
    ldr r0, .L_02049f0c
    str r2, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r3, r4
    mov r2, #0x7e
    bl func_020593dc
.L_02049ee0:
    ldr r0, [r4, #0x268]
    mov r1, #0x12
    bic r0, r0, #0x8000
    str r0, [r4, #0x268]
    ldr r2, [r4, #0xd0]
    mov r0, #0x0
    bic r2, r2, #0x2
    str r2, [r4, #0xd0]
    strh r1, [r4, #0xd6]
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
.L_02049f0c: .word gSoundContext
.size func_02049ea0, . - func_02049ea0


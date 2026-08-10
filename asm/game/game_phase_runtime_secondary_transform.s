; Matching retail form; see src/game/game_phase_runtime_secondary_transform.c for
; the documented portable implementation and recovered behavior.
.text
.extern func_02004fe0
.extern func_0200500c
.extern func_02005058
.extern func_020050a4
.extern func_02008378
.extern func_02008740
.extern GamePhaseRuntime_GetActiveAreaPlacementVariant
.extern func_02009d0c
.extern OS_Halt

    .global func_0200875c
.type func_0200875c, @function
func_0200875c:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x50
    mov r5, r0
    add r0, sp, #0x40
    mov r4, r1
    bl func_02004fe0
    add r0, r4, #0x3000
    ldr r0, [r0, #0xfc]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b L_0200887c
L_02008788: ; jump table
    b L_02008880 ; case 0
    b L_02008798 ; case 1
    b L_02008830 ; case 2
    b L_0200884c ; case 3
L_02008798:
    mov r0, r4
    bl GamePhaseRuntime_GetActiveAreaPlacementVariant
    cmp r0, #0x0
    beq L_020087b8
    cmp r0, #0x1
    cmpne r0, #0x2
    beq L_0200880c
    b L_02008828
L_020087b8:
    mov r1, #0x10000
    rsb r1, r1, #0x0
    add r0, sp, #0x30
    sub r2, r1, #0x18000
    mov r3, #0x0
    bl func_0200500c
    add r0, r4, #0x44
    add r0, r0, #0x3000
    bl func_02009d0c
    mov r1, r0
    add r0, sp, #0x20
    add r2, sp, #0x30
    bl func_02008378
    add r0, sp, #0x40
    add r1, sp, #0x20
    bl func_020050a4
    add r0, sp, #0x20
    bl func_02005058
    add r0, sp, #0x30
    bl func_02005058
    b L_02008880
L_0200880c:
    add r0, r4, #0x44
    add r0, r0, #0x3000
    bl func_02009d0c
    mov r1, r0
    add r0, sp, #0x40
    bl func_020050a4
    b L_02008880
L_02008828:
    bl OS_Halt
    b L_02008880
L_02008830:
    add r0, r4, #0x44
    add r0, r0, #0x3000
    bl func_02009d0c
    mov r1, r0
    add r0, sp, #0x40
    bl func_020050a4
    b L_02008880
L_0200884c:
    mov r1, #0x10000
    rsb r1, r1, #0x0
    add r0, sp, #0x10
    sub r2, r1, #0x20000
    mov r3, #0x0
    bl func_0200500c
    add r0, sp, #0x40
    add r1, sp, #0x10
    bl func_020050a4
    add r0, sp, #0x10
    bl func_02005058
    b L_02008880
L_0200887c:
    bl OS_Halt
L_02008880:
    add r1, r4, #0x88
    add r0, sp, #0x0
    add r1, r1, #0x3000
    bl func_02008740
    add r1, sp, #0x40
    add r2, sp, #0x0
    mov r0, r5
    bl func_02008378
    add r0, sp, #0x0
    bl func_02005058
    add r0, sp, #0x40
    bl func_02005058
    add sp, sp, #0x50
    ldmia sp!, {r3, r4, r5, pc}
    .size func_0200875c, .-func_0200875c


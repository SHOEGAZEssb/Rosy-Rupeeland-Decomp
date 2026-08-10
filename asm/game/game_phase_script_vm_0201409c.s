; Matching retail form; see src/game/game_phase_script_vm_actor_position_opcodes.c.
.text
.extern func_0200500c
.extern func_02005058
.extern func_020050a4
.extern func_02012704
.extern Actor_AdjustPositionForTerrainHeight

    .global func_0201409c
func_0201409c: ; 0x0201409c
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    mov r5, r0
    bl func_02012704
    mov r4, r0
    mov r0, r5
    bl func_02012704
    mov r1, r0
    add r0, sp, #0x0
    mov r1, r1, lsl #0xc
    mov r2, r4, lsl #0xc
    mov r3, #0x0
    bl func_0200500c
    ldr r0, [r5, #0x84]
    add r1, sp, #0x0
    add r0, r0, #0x28
    bl func_020050a4
    ldr r2, [r5, #0x84]
    mov r1, r0
    add r0, r2, #0x18
    bl func_020050a4
    add r0, sp, #0x0
    bl func_02005058
    ldr r0, [r5, #0x84]
    bl Actor_AdjustPositionForTerrainHeight
    mov r0, #0x0
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
    .size func_0201409c, . - func_0201409c

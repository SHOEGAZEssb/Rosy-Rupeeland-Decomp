; Matching retail form; see src/game/game_phase_area_scene_runtime.c.
.text
.extern func_ov056_0220ef34

    .global func_02012150
func_02012150: ; 0x02012150
    stmdb sp!, {r3, lr}
    ldr r2, [r0, #0x4]
    cmp r2, #0x0
    beq L_02012174
    mov r0, r2
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x18]
    blx r2
    ldmia sp!, {r3, pc}
L_02012174:
    add r0, r0, #0x2000
    ldr r0, [r0, #0xed0]
    cmp r0, #0x0
    ldmeqia sp!, {r3, pc}
    bl func_ov056_0220ef34
    ldmia sp!, {r3, pc}
    .size func_02012150, . - func_02012150


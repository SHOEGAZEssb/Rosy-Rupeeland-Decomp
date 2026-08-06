; Matching retail form; see src/game/ballistic_sprite_particle.c.
.text
.extern func_02005058
.extern func_02074038

.global func_020239e8
    .type func_020239e8, @function
func_020239e8: ; 0x020239e8
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x20]
    ldr r0, [r1, #0x0]
    bl func_02074038
    add r0, r4, #0x10
    bl func_02005058
    mov r0, r4
    bl func_02005058
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_020239e8, . - func_020239e8

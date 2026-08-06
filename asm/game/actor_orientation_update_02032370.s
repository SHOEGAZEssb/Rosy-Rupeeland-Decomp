; Matching retail form; see src/game/actor_orientation_update.c.
.text
.extern func_02032228

    .global func_02032370
    .type func_02032370, @function
func_02032370: ; 0x02032370
    stmdb sp!, {r3, r4, r5, lr}
    ldr r4, [r0, #0x1c]
    ldr ip, [r0, #0x20]
    ldmib r1, {r5, lr}
    mov r3, r2
    sub r1, r5, r4
    sub r2, lr, ip
    bl func_02032228
    ldmia sp!, {r3, r4, r5, pc}
    .size func_02032370, . - func_02032370


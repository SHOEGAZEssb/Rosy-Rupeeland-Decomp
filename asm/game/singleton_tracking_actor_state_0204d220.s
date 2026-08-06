; Matching retail form; see src/game/singleton_tracking_actor_state.c.
.extern func_0203b65c
.text
    .global func_0204d220
.type func_0204d220, @function
func_0204d220: ; 0x0204d220
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0203b65c
    mov r0, r4
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0x54]
    blx r2
    ldmia sp!, {r4, pc}
.size func_0204d220, . - func_0204d220

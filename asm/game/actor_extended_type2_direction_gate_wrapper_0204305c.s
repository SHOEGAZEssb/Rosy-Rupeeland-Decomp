; Matching retail wrapper; see src/game/actor_extended_type2_direction_gate.c.
.text
.extern func_02043080
.global func_0204305c
.type func_0204305c, @function
func_0204305c: ; 0x0204305c
    stmdb sp!, {r4, lr}
    ldr r4, [r2, #0x1c]
    ldr lr, [r0, #0x1c]
    ldr ip, [r2, #0x20]
    ldr r3, [r0, #0x20]
    sub r2, r4, lr
    sub r3, ip, r3
    bl func_02043080
    ldmia sp!, {r4, pc}
.size func_0204305c, . - func_0204305c

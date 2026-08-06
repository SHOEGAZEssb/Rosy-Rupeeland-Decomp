; Matching retail form; see src/game/actor_auxiliary_collision_resource.c.
.text
.extern Heap_Free
.extern func_02057184

    .global func_02034320
    .type func_02034320, @function
func_02034320: ; 0x02034320
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r4, [r5, #0x1e0]
    cmp r4, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    beq .L_02034348
    mov r0, r4
    bl func_02057184
    mov r0, r4
    bl Heap_Free
.L_02034348:
    mov r0, #0x0
    str r0, [r5, #0x1e0]
    ldmia sp!, {r3, r4, r5, pc}
    .size func_02034320, . - func_02034320

    .global func_02034354


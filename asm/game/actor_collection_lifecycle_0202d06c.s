; Matching retail form; see src/game/actor_collection_lifecycle.c.
.text
.extern func_0202d094
.extern func_02006280

    .global func_0202d06c
    .type func_0202d06c, @function
func_0202d06c: ; 0x0202d06c
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0202d094
    add r0, r4, #0xe10
    bl func_02006280
    add r0, r4, #0x204
    add r0, r0, #0xc00
    bl func_02006280
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_0202d06c, . - func_0202d06c

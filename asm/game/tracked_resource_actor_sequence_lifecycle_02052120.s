; Matching retail form; see src/game/tracked_resource_actor_sequence_lifecycle.c.
.extern Heap_Free
.extern data_020e321c
.extern func_0204fdc0
.extern func_02051cdc
.text
    .global func_02052120
func_02052120:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02051cdc
    ldr r1, .L_0205213c
    mov r0, r4
    str r1, [r4, #0x0]
    ldmia sp!, {r4, pc}
.L_0205213c: .word data_020e321c
    .size func_02052120, . - func_02052120

    .global func_02052140
func_02052140:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0204fdc0
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_02052140, . - func_02052140

    .global func_02052154
func_02052154:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0204fdc0
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_02052154, . - func_02052154

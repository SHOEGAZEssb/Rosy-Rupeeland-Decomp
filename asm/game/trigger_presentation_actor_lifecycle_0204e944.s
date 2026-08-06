; Matching retail form; see src/game/trigger_presentation_actor_lifecycle.c.
.extern Heap_Free
.extern data_020e2560
.extern func_02030f98
.extern func_0203130c
.extern func_02031488
.text

func_0204e944: ; 0x0204e944
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02030f98
    ldr r0, .L_0204e96c
    add r1, r4, #0x100
    str r0, [r4, #0x0]
    mov r2, #0x0
    mov r0, r4
    strh r2, [r1, #0xec]
    ldmia sp!, {r4, pc}
.L_0204e96c: .word data_020e2560
.size func_0204e944, . - func_0204e944

    .global func_0204e970

func_0204e970: ; 0x0204e970
    stmdb sp!, {r4, lr}
    ldr r1, .L_0204e9a4
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xbc]
    blx r1
    mov r0, r4
    bl func_02031488
    mov r0, r4
    bl func_0203130c
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0204e9a4: .word data_020e2560
.size func_0204e970, . - func_0204e970

    .global func_0204e9a8

func_0204e9a8: ; 0x0204e9a8
    stmdb sp!, {r4, lr}
    ldr r1, .L_0204e9e4
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xbc]
    blx r1
    mov r0, r4
    bl func_02031488
    mov r0, r4
    bl func_0203130c
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0204e9e4: .word data_020e2560
.size func_0204e9a8, . - func_0204e9a8


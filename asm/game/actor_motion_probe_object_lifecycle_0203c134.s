; Matching retail form; see src/game/actor_motion_probe_object_lifecycle.c.
.text
.extern Heap_Free
.extern data_020df61c
.extern func_02004fe0
.extern func_02005058
.extern func_02033b38
.extern ActorDerivedRuntime_Init
.extern ActorDerivedRuntime_DestroyAlternate
.extern Actor_InitializeFromDescriptor
.extern ActorDerivedRuntime_UpdateFrame
    .global func_0203c134
    .type func_0203c134, @function
func_0203c134: ; 0x0203c134
    ldr ip, .L_0203c13c
    bx ip
.L_0203c13c: .word func_02033b38
    .size func_0203c134, . - func_0203c134

    .global func_0203c140
    .type func_0203c140, @function
func_0203c140: ; 0x0203c140
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorDerivedRuntime_Init
    ldr r1, .L_0203c1bc
    add r0, r4, #0x200
    str r1, [r4, #0x0]
    mov r1, #0x4000
    strh r1, [r0, #0x8]
    mov r1, #0x0
    strh r1, [r0, #0xa]
    mov r1, #0x1000
    add r0, r4, #0x210
    str r1, [r4, #0x20c]
    bl func_02004fe0
    add r0, r4, #0x220
    bl func_02004fe0
    add r0, r4, #0x230
    bl func_02004fe0
    mov r0, #0x0
    str r0, [r4, #0x240]
    mov r0, #0x10
    str r0, [r4, #0x244]
    str r0, [r4, #0x248]
    mov r0, #0x1e
    str r0, [r4, #0x24c]
    mov r0, #0x5
    str r0, [r4, #0x250]
    mov r1, #0x640
    mov r0, r4
    str r1, [r4, #0x254]
    ldmia sp!, {r4, pc}
.L_0203c1bc: .word data_020df61c
    .size func_0203c140, . - func_0203c140

    .global func_0203c1c0
    .type func_0203c1c0, @function
func_0203c1c0: ; 0x0203c1c0
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x230
    bl func_02005058
    add r0, r4, #0x220
    bl func_02005058
    add r0, r4, #0x210
    bl func_02005058
    mov r0, r4
    bl ActorDerivedRuntime_DestroyAlternate
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_0203c1c0, . - func_0203c1c0

    .global func_0203c1f0
    .type func_0203c1f0, @function
func_0203c1f0: ; 0x0203c1f0
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x230
    bl func_02005058
    add r0, r4, #0x220
    bl func_02005058
    add r0, r4, #0x210
    bl func_02005058
    mov r0, r4
    bl ActorDerivedRuntime_DestroyAlternate
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_0203c1f0, . - func_0203c1f0

    .global func_0203c228
    .type func_0203c228, @function
func_0203c228: ; 0x0203c228
    ldr ip, .L_0203c230
    bx ip
.L_0203c230: .word Actor_InitializeFromDescriptor
    .size func_0203c228, . - func_0203c228

    .global func_0203c234
    .type func_0203c234, @function
func_0203c234: ; 0x0203c234
    ldr ip, .L_0203c23c
    bx ip
.L_0203c23c: .word ActorDerivedRuntime_UpdateFrame
    .size func_0203c234, . - func_0203c234


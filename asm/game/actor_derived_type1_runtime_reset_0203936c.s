; Matching retail form; see src/game/actor_derived_type1_runtime_reset.c.
.text
.extern func_020050a4
.extern func_0200b2c0
.extern Actor_SetDirectionFromVector
.extern func_02038aac

    .global func_0203936c
    .type func_0203936c, @function
func_0203936c: ; 0x0203936c
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x28
    add r1, r4, #0x18
    bl func_020050a4
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x38
    bl func_0200b2c0
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x88
    bl func_0200b2c0
    add r0, r4, #0x98
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    bl func_0200b2c0
    mov r0, r4
    mov r1, #0x0
    mov r2, #0x1000
    bl Actor_SetDirectionFromVector
    mov r0, r4
    bl func_02038aac
    ldr r0, [r4, #0xd0]
    mov r1, #0x0
    bic r0, r0, #0x10000
    str r0, [r4, #0xd0]
    add r0, r4, #0x200
    strh r1, [r0, #0x4]
    strh r1, [r0, #0x64]
    ldmia sp!, {r4, pc}
    .size func_0203936c, . - func_0203936c

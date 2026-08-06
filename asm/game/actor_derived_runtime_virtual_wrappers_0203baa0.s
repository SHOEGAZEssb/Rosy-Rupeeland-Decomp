; Matching retail form; see src/game/actor_derived_runtime_virtual_wrappers.c.
.text
.extern func_02032abc
.extern func_0203392c
.extern func_02033940
.extern func_02033954
.extern func_02034148
    .global func_0203baa0
    .type func_0203baa0, @function
func_0203baa0: ; 0x0203baa0
    ldr ip, .L_0203baa8
    bx ip
.L_0203baa8: .word func_02032abc
    .size func_0203baa0, . - func_0203baa0

    .global func_0203baac
    .type func_0203baac, @function
func_0203baac: ; 0x0203baac
    bx lr
    .size func_0203baac, . - func_0203baac

    .global func_0203bab0
    .type func_0203bab0, @function
func_0203bab0: ; 0x0203bab0
    stmdb sp!, {r3, lr}
    bl func_0203392c
    mov r0, #0x1
    ldmia sp!, {r3, pc}
    .size func_0203bab0, . - func_0203bab0

    .global func_0203bac0
    .type func_0203bac0, @function
func_0203bac0: ; 0x0203bac0
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02033940
    mov r0, r4
    bl func_02034148
    ldmia sp!, {r4, pc}
    .size func_0203bac0, . - func_0203bac0

    .global func_0203bad8
    .type func_0203bad8, @function
func_0203bad8: ; 0x0203bad8
    ldr ip, .L_0203bae0
    bx ip
.L_0203bae0: .word func_02033954
    .size func_0203bad8, . - func_0203bad8



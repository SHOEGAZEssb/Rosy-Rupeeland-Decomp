; Matching retail form; see src/game/tracked_resource_actor_impulse_lifecycle.c.
.extern Heap_Free
.extern data_020e3308
.extern TrackedResourceActor_Init
.extern TrackedResourceActor_Destroy
.text
    .global func_02051cdc
func_02051cdc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl TrackedResourceActor_Init
    ldr r1, .L_02051cf8
    mov r0, r4
    str r1, [r4, #0x0]
    ldmia sp!, {r4, pc}
.L_02051cf8: .word data_020e3308
    .size func_02051cdc, . - func_02051cdc

    .global func_02051cfc
func_02051cfc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl TrackedResourceActor_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_02051cfc, . - func_02051cfc

    .global func_02051d10
func_02051d10:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl TrackedResourceActor_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_02051d10, . - func_02051d10

    .global func_02051d2c
func_02051d2c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl TrackedResourceActor_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_02051d2c, . - func_02051d2c

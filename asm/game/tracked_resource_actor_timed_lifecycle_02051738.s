; Matching retail form; see src/game/tracked_resource_actor_timed_lifecycle.c.
.extern Heap_Free
.extern data_020e2bfc
.extern TrackedResourceActor_Init
.extern TrackedResourceActor_Destroy
.text
    .global func_02051738
func_02051738:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl TrackedResourceActor_Init
    ldr r0, .L_02051760
    add r1, r4, #0x200
    str r0, [r4, #0x0]
    mov r2, #0x0
    mov r0, r4
    strh r2, [r1, #0x0]
    ldmia sp!, {r4, pc}
.L_02051760: .word data_020e2bfc
    .size func_02051738, . - func_02051738

    .global func_02051764
func_02051764:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl TrackedResourceActor_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_02051764, . - func_02051764

    .global func_02051778
func_02051778:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl TrackedResourceActor_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_02051778, . - func_02051778

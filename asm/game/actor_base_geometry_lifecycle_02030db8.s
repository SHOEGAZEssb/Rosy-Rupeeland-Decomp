; Matching retail form; see src/game/actor_base_geometry_lifecycle.c.
.text
.extern Heap_Free
.extern data_020def7c
.extern VecFx32Object_Destroy
.extern func_02059424
.extern gSoundContext

    .global ActorBaseGeometry_DestroyAndFree
    .type ActorBaseGeometry_DestroyAndFree, @function
ActorBaseGeometry_DestroyAndFree: ; 0x02030db8
    stmdb sp!, {r4, lr}
    ldr r1, .L_02030e00
    mov r4, r0
    ldr r0, .L_02030e04
    str r1, [r4, #0x0]
    ldr r0, [r0, #0x0]
    mov r1, r4
    bl func_02059424
    add r0, r4, #0x38
    bl VecFx32Object_Destroy
    add r0, r4, #0x28
    bl VecFx32Object_Destroy
    add r0, r4, #0x18
    bl VecFx32Object_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02030e00: .word data_020def7c
.L_02030e04: .word gSoundContext
    .size ActorBaseGeometry_DestroyAndFree, . - ActorBaseGeometry_DestroyAndFree

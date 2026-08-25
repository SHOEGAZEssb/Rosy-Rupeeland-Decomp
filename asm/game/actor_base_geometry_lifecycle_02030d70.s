; Matching retail form; see src/game/actor_base_geometry_lifecycle.c.
.text
.extern data_020def7c
.extern VecFx32Object_Destroy
.extern Sound_StopOwnerEffects
.extern gSoundContext

    .global ActorBaseGeometry_Destroy
    .type ActorBaseGeometry_Destroy, @function
ActorBaseGeometry_Destroy: ; 0x02030d70
    stmdb sp!, {r4, lr}
    ldr r1, .L_02030db0
    mov r4, r0
    ldr r0, .L_02030db4
    str r1, [r4, #0x0]
    ldr r0, [r0, #0x0]
    mov r1, r4
    bl Sound_StopOwnerEffects
    add r0, r4, #0x38
    bl VecFx32Object_Destroy
    add r0, r4, #0x28
    bl VecFx32Object_Destroy
    add r0, r4, #0x18
    bl VecFx32Object_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02030db0: .word data_020def7c
.L_02030db4: .word gSoundContext
    .size ActorBaseGeometry_Destroy, . - ActorBaseGeometry_Destroy


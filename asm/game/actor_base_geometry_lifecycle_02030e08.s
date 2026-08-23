; Matching retail form; see src/game/actor_base_geometry_lifecycle.c.
.text
.extern data_020def7c
.extern VecFx32Object_Destroy
.extern Sound_StopOwnerEffects
.extern gSoundContext

    .global func_02030e08
    .type func_02030e08, @function
func_02030e08: ; 0x02030e08
    stmdb sp!, {r4, lr}
    ldr r1, .L_02030e48
    mov r4, r0
    ldr r0, .L_02030e4c
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
.L_02030e48: .word data_020def7c
.L_02030e4c: .word gSoundContext
    .size func_02030e08, . - func_02030e08


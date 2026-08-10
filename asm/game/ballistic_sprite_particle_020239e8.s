; Matching retail form; see src/game/ballistic_sprite_particle.c.
.text
.extern VecFx32Object_Destroy
.extern GraphicsSpriteGroup_ReleaseState

.global func_020239e8
    .type func_020239e8, @function
func_020239e8: ; 0x020239e8
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x20]
    ldr r0, [r1, #0x0]
    bl GraphicsSpriteGroup_ReleaseState
    add r0, r4, #0x10
    bl VecFx32Object_Destroy
    mov r0, r4
    bl VecFx32Object_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_020239e8, . - func_020239e8

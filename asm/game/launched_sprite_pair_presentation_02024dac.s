; Matching retail form; see src/game/launched_sprite_pair_presentation.c.
.text
.extern GameWork_SetFlag
.extern Heap_Free
.extern data_020d68e4
.extern VecFx32Object_Destroy
.extern FieldEffect_DestroyBase
.extern AnimationResourceState_Destroy
.extern GraphicsSpriteGroup_ReleaseState
.extern gGameWork

    .global func_02024dac
    .type func_02024dac, @function
func_02024dac: ; 0x02024dac
    stmdb sp!, {r4, lr}
    ldr r1, .L_02024e1c
    mov r4, r0
    ldr r0, .L_02024e20
    str r1, [r4, #0x0]
    ldr r0, [r0, #0x0]
    mov r1, #0x3e0
    bl GameWork_SetFlag
    ldr r0, [r4, #0x48]
    ldr r1, [r4, #0x50]
    bl GraphicsSpriteGroup_ReleaseState
    ldr r0, [r4, #0x4c]
    cmp r0, #0x0
    beq .L_02024dec
    ldr r1, [r4, #0x54]
    bl GraphicsSpriteGroup_ReleaseState
.L_02024dec:
    add r0, r4, #0x3c
    bl AnimationResourceState_Destroy
    add r0, r4, #0x1c
    bl VecFx32Object_Destroy
    add r0, r4, #0xc
    bl VecFx32Object_Destroy
    mov r0, r4
    bl FieldEffect_DestroyBase
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02024e1c: .word data_020d68e4
.L_02024e20: .word gGameWork
    .size func_02024dac, . - func_02024dac

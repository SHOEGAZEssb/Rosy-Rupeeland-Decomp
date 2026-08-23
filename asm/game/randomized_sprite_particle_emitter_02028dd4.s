; Matching retail form; see src/game/randomized_sprite_particle_emitter.c.
.text
.extern Heap_Free
.extern __destroy_arr
.extern data_020de89c
.extern data_020de8cc
.extern data_020f4e14
.extern VecFx32Object_Destroy
.extern AnimationResource_Destroy
.extern FieldEffect_DestroyBase
.extern func_0202895c
.extern func_02028cd4
.extern func_02028e9c
.extern AnimationResourceState_ReleaseResources
.extern GraphicsSpriteGroupOwner_DestroyGroup

    .global func_02028dd4
    .type func_02028dd4, @function
func_02028dd4: ; 0x02028dd4
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, .L_02028e8c
    mov r6, r0
    str r1, [r6, #0x0]
    ldr r4, [r6, #0x60]
    b .L_02028e18
.L_02028dec:
    ldr r5, [r4, #0x8]
    mov r1, r4
    add r0, r6, #0x5c
    bl func_02028e9c
    cmp r5, #0x0
    beq .L_02028e14
    mov r0, r5
    bl func_0202895c
    mov r0, r5
    bl Heap_Free
.L_02028e14:
    ldr r4, [r4, #0x0]
.L_02028e18:
    cmp r4, #0x0
    bne .L_02028dec
    ldr r0, .L_02028e90
    ldr r1, [r6, #0x4c]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_DestroyGroup
    add r0, r6, #0x30
    bl AnimationResourceState_ReleaseResources
    add r0, r6, #0x40
    bl AnimationResourceState_ReleaseResources
    ldr r1, .L_02028e94
    add r0, r6, #0x5c
    str r1, [r6, #0x5c]
    bl func_02028cd4
    add r0, r6, #0x2c
    mov r1, #0x2
    mov r2, #0x10
    ldr r3, .L_02028e98
    bl __destroy_arr
    add r0, r6, #0x1c
    bl VecFx32Object_Destroy
    add r0, r6, #0xc
    bl VecFx32Object_Destroy
    mov r0, r6
    bl FieldEffect_DestroyBase
    mov r0, r6
    bl Heap_Free
    mov r0, r6
    ldmia sp!, {r4, r5, r6, pc}
.L_02028e8c: .word data_020de8cc
.L_02028e90: .word data_020f4e14
.L_02028e94: .word data_020de89c
.L_02028e98: .word AnimationResource_Destroy
    .size func_02028dd4, . - func_02028dd4


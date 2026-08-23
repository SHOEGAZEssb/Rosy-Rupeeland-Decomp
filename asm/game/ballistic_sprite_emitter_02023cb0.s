; Matching retail form; see src/game/ballistic_sprite_emitter.c.
.text
.extern __destroy_arr
.extern data_020d66b8
.extern data_020d6718
.extern VecFx32Object_Destroy
.extern AnimationResource_Destroy
.extern FieldEffect_DestroyBase
.extern func_02023c0c
.extern GraphicsSpriteGroupOwner_DestroyGroup
.extern gDebugFont

    .global func_02023cb0
    .type func_02023cb0, @function
func_02023cb0: ; 0x02023cb0
    stmdb sp!, {r4, lr}
    ldr r1, .L_02023d0c
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, .L_02023d10
    ldr r1, [r4, #0x38]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_DestroyGroup
    ldr r1, .L_02023d14
    add r0, r4, #0x3c
    str r1, [r4, #0x3c]
    bl func_02023c0c
    ldr r3, .L_02023d18
    add r0, r4, #0x18
    mov r1, #0x2
    mov r2, #0x10
    bl __destroy_arr
    add r0, r4, #0x8
    bl VecFx32Object_Destroy
    mov r0, r4
    bl FieldEffect_DestroyBase
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02023d0c: .word data_020d6718
.L_02023d10: .word gDebugFont
.L_02023d14: .word data_020d66b8
.L_02023d18: .word AnimationResource_Destroy
    .size func_02023cb0, . - func_02023cb0

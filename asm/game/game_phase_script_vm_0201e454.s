; Matching retail form; see src/game/timed_sprite_oriented_variant.c.
.text
.extern Heap_Free
.extern func_0201e290
.extern func_0201e380
.extern func_0201e3b8
.extern VecFx32Object_Assign
.extern VecFx32Object_Add
.extern func_020ae024
.extern GraphicsSpriteState_SetAnimationIndex
.extern GraphicsSpriteState_SetWorldPositionFromOrigin
.extern data_020d605c
.global func_0201e454
func_0201e454: ; 0x0201e454
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    mov r5, r1
    bl func_0201e290
    ldr r2, L_0201e4cc
    add r0, r4, #0x8
    add r1, r5, #0x10
    str r2, [r4, #0x0]
    bl VecFx32Object_Assign
    add r0, r4, #0x18
    add r1, r5, #0x20
    bl VecFx32Object_Assign
    ldr r0, [r5, #0x30]
    str r0, [r4, #0x28]
    ldr r1, [r4, #0x4]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldr r1, [r4, #0x1c]
    ldr r0, [r4, #0x20]
    rsb r1, r1, #0x0
    bl func_020ae024
    mov r5, r0
    ldr r0, [r4, #0x4]
    mov r1, #0x0
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r4, #0x4]
    mov r0, r4
    strh r5, [r1, #0x30]
    ldmia sp!, {r3, r4, r5, pc}
L_0201e4cc: .word data_020d605c


.size func_0201e454, . - func_0201e454

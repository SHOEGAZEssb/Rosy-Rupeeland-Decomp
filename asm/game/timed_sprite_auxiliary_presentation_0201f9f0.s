; Matching retail form; see src/game/timed_sprite_auxiliary_presentation.c.
.text
.extern Heap_Alloc
.extern Heap_Free
.extern data_020d61a8
.extern data_020d6270
.extern data_021052fc
.extern func_02005058
.extern func_020050a4
.extern AnimationResource_Init
.extern ActorMotionAreaFollower_GetPosition
.extern func_0201ded4
.extern func_0201e250
.extern func_0201e584
.extern func_0201f0fc
.extern gHeapContext

.global func_0201f9f0
    .type func_0201f9f0, @function
func_0201f9f0: ; 0x0201f9f0
    stmdb sp!, {r4, lr}
    ldr r1, .L_0201fa40
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq .L_0201fa18
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0201fa18:
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    beq .L_0201fa30
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0201fa30:
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0201fa40: .word data_020d61a8
    .size func_0201f9f0, .-func_0201f9f0


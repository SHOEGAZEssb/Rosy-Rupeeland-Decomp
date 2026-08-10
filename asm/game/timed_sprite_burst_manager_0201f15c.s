; Matching retail form; see src/game/timed_sprite_burst_manager.c.
.text
.extern Heap_Alloc
.extern Heap_Free
.extern TouchPoint_Init
.extern data_020c9670
.extern data_020d5e48
.extern data_020d6220
.extern data_020d6268
.extern data_020f4e18
.extern data_021052fc
.extern func_02003e20
.extern func_02003e38
.extern func_02004fe0
.extern func_02005030
.extern func_02005058
.extern ActorMotion_GetPosition
.extern func_0201e250
.extern func_0201e3b8
.extern func_0201e454
.extern func_0201eefc
.extern func_0201f0b0
.extern func_0201f0d0
.extern func_0201f0fc
.extern func_0201f11c
.extern func_0201f15c
.extern func_0201f204
.extern func_0201f2b4
.extern func_02071bdc
.extern func_02071c38
.extern func_02071c94
.extern GraphicsSpriteGroup_AdvanceAnimations
.extern GraphicsSpriteGroupOwner_CreateGroup
.extern GraphicsSpriteGroupOwner_DestroyGroup
.extern gDebugFont
.extern gHeapContext
.extern genrand_int32

.global func_0201f15c
.type func_0201f15c, @function

func_0201f15c: ; 0x0201f15c
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_0201f1f8
    mov r4, r0
    str r1, [r4, #0x0]
    mov r5, #0x0
    b .L_0201f194
.L_0201f174:
    ldr r0, [r4, #0x8]
    ldr r0, [r0, r5, lsl #0x2]
    cmp r0, #0x0
    beq .L_0201f190
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0201f190:
    add r5, r5, #0x1
.L_0201f194:
    ldr r0, [r4, #0xc]
    cmp r5, r0
    blt .L_0201f174
    add r0, r4, #0x8
    bl func_0201f0d0
    ldr r0, .L_0201f1fc
    ldr r1, [r4, #0x10]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_DestroyGroup
    ldr r0, .L_0201f200
    ldr r1, [r4, #0x18]
    ldr r0, [r0, #0x0]
    bl func_02071bdc
    ldr r0, .L_0201f200
    ldr r1, [r4, #0x1c]
    ldr r0, [r0, #0x0]
    bl func_02071c38
    ldr r0, .L_0201f200
    ldr r1, [r4, #0x20]
    ldr r0, [r0, #0x0]
    bl func_02071c94
    add r0, r4, #0x8
    bl func_0201f0b0
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
.L_0201f1f8: .word data_020d6220
.L_0201f1fc: .word gDebugFont
.L_0201f200: .word data_020f4e18
    .size func_0201f15c, .-func_0201f15c


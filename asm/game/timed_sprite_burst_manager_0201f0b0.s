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

.global func_0201f0b0
.type func_0201f0b0, @function

func_0201f0b0: ; 0x0201f0b0
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x0]
    cmp r1, #0x0
    beq .L_0201f0c8
    bl func_0201f0d0
.L_0201f0c8:
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_0201f0b0, .-func_0201f0b0


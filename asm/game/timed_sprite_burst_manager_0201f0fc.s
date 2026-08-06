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
.extern func_02009d0c
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
.extern func_020740a4
.extern func_020742cc
.extern func_02074330
.extern gDebugFont
.extern gHeapContext
.extern genrand_int32

.global func_0201f0fc
.type func_0201f0fc, @function

func_0201f0fc: ; 0x0201f0fc
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x10
    bl func_02004fe0
    add r0, r4, #0x20
    bl func_02004fe0
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_0201f0fc, .-func_0201f0fc


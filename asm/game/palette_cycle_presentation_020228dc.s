; Matching retail form; see src/game/palette_cycle_presentation.c.
.text
.extern GameWork_ClearFlag
.extern GameWork_TestFlag
.extern GraphicsResourceSet_Destroy
.extern GraphicsResourceSet_Init
.extern GraphicsResourceSet_Load
.extern Heap_Free
.extern MIi_CpuCopy16
.extern data_020d6514
.extern data_020f4e18
.extern func_0201e250
.extern func_0201e28c
.extern func_020226c0
.extern func_02070874
.extern func_02091b6c
.extern func_02091b98
.extern func_02091bd0
.extern func_02091c7c
.extern func_02091d08
.extern func_02091d24
.extern func_02091dac
.extern func_020b1314
.extern func_020b1360
.extern func_020b13d4
.extern func_020b4554
.extern gGameWork
.extern genrand_int32

.global func_020228dc
    .type func_020228dc, @function
func_020228dc: ; 0x020228dc
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x444]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    bl func_020b13d4
    add r0, r4, #0x10
    mov r1, #0x0
    mov r2, #0x200
    bl func_020b1360
    bl func_020b1314
    ldmia sp!, {r4, pc}
    .size func_020228dc, .-func_020228dc


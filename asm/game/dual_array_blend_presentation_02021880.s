; Matching retail form; see src/game/dual_array_blend_presentation.c.
.text
.extern GameWork_ClearFlag
.extern GameWork_SetFlag
.extern GameWork_TestFlag
.extern Heap_Free
.extern __construct_array
.extern __destroy_arr
.extern data_020c36c4
.extern data_020d63d0
.extern data_020d63e0
.extern data_020d658c
.extern data_021055dc
.extern func_0201e250
.extern func_0201e28c
.extern func_020215a0
.extern func_020215a4
.extern func_020218c0
.extern func_02021934
.extern func_0202194c
.extern func_020219bc
.extern func_02021ad8
.extern func_0209189c
.extern func_020918f4
.extern func_02092418
.extern func_020948e4
.extern func_02094ad4
.extern func_02094bbc
.extern func_02094d28
.extern func_020afd0c
.extern gGameWork
.extern gSystemState
.extern genrand_int32

.global func_02021880
    .type func_02021880, @function
func_02021880: ; 0x02021880
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0x8]
    cmp r1, #0x0
    beq .L_020218b8
    ldr r1, [r0, #0xc]
    add r2, r0, r1, asr #0x1
    tst r1, #0x1
    ldrne r1, [r2, #0x0]
    ldrne r0, [r0, #0x8]
    ldrne r1, [r1, r0]
    ldreq r1, [r0, #0x8]
    mov r0, r2
    blx r1
    ldmia sp!, {r3, pc}
.L_020218b8:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
    .size func_02021880, .-func_02021880


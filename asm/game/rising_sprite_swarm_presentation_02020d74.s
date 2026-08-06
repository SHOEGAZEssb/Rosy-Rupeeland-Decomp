; Matching retail form; see src/game/rising_sprite_swarm_presentation.c.
.text
.extern GameWork_ClearFlag
.extern GameWork_SetFlag
.extern GameWork_TestFlag
.extern Heap_Alloc
.extern Heap_Free
.extern data_020d632c
.extern data_020d6358
.extern data_020d6398
.extern data_020d63b8
.extern data_020f4e14
.extern data_020f4e18
.extern func_0200500c
.extern func_02005030
.extern func_02005058
.extern func_020050c8
.extern func_02008378
.extern func_0201e250
.extern func_0201e28c
.extern func_020203e4
.extern func_02020558
.extern func_0202057c
.extern func_02020754
.extern func_020208a4
.extern func_020208e4
.extern func_02020a54
.extern func_02020c38
.extern func_02020d48
.extern func_02071ea4
.extern func_02071eb8
.extern func_02071ee0
.extern func_02074058
.extern func_020740a4
.extern func_020742cc
.extern gDebugFont
.extern gGameWork
.extern gHeapContext

.global func_02020d74
    .type func_02020d74, @function
func_02020d74: ; 0x02020d74
    stmdb sp!, {r4, lr}
    ldr r1, .L_02020d98
    mov r4, r0
    str r1, [r4, #0x0]
    bl func_020208e4
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02020d98: .word data_020d6358
    .size func_02020d74, .-func_02020d74


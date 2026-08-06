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

.global func_02020924
    .type func_02020924, @function
func_02020924: ; 0x02020924
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, .L_020209b0
    mov r6, r0
    str r1, [r6, #0x0]
    ldr r4, [r6, #0x10]
    b .L_02020968
.L_0202093c:
    ldr r5, [r4, #0x8]
    cmp r5, #0x0
    beq .L_02020958
    mov r0, r5
    bl func_02020558
    mov r0, r5
    bl Heap_Free
.L_02020958:
    mov r1, r4
    add r0, r6, #0xc
    bl func_02020a54
    ldr r4, [r4, #0x0]
.L_02020968:
    cmp r4, #0x0
    bne .L_0202093c
    ldr r0, [r6, #0x24]
    bl func_02074058
    ldr r0, [r6, #0x28]
    bl func_02074058
    add r0, r6, #0x38
    bl func_02005058
    add r0, r6, #0x2c
    bl func_02071eb8
    ldr r1, .L_020209b4
    add r0, r6, #0xc
    str r1, [r6, #0xc]
    bl func_020208e4
    mov r0, r6
    bl func_0201e28c
    mov r0, r6
    ldmia sp!, {r4, r5, r6, pc}
.L_020209b0: .word data_020d6398
.L_020209b4: .word data_020d6358
    .size func_02020924, .-func_02020924


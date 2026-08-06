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

.global func_02020abc
    .type func_02020abc, @function
func_02020abc: ; 0x02020abc
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    ldr r1, [r4, #0x1c]
    cmp r1, #0x4
    addls pc, pc, r1, lsl #0x2
    b .L_02020bc4
.L_02020ad4: ; jump table
    b .L_02020ae8 ; case 0
    b .L_02020af4 ; case 1
    b .L_02020b40 ; case 2
    b .L_02020b6c ; case 3
    b .L_02020ba0 ; case 4
.L_02020ae8:
    add r0, r1, #0x1
    str r0, [r4, #0x1c]
    b .L_02020bc4
.L_02020af4:
    ldr r1, [r4, #0x20]
    sub r1, r1, #0x1
    str r1, [r4, #0x20]
    cmp r1, #0x0
    bgt .L_02020bc4
    bl func_02020c38
    mov r0, #0x23
    str r0, [r4, #0x20]
    ldr r0, [r4, #0x18]
    cmp r0, #0x4
    movlt r0, #0x0
    strlt r0, [r4, #0x1c]
    blt .L_02020bc4
    mov r0, #0x5
    str r0, [r4, #0x20]
    ldr r0, [r4, #0x1c]
    add r0, r0, #0x1
    str r0, [r4, #0x1c]
    b .L_02020bc4
.L_02020b40:
    ldr r1, [r4, #0x20]
    sub r1, r1, #0x1
    str r1, [r4, #0x20]
    cmp r1, #0x0
    bgt .L_02020bc4
    mov r1, #0x1
    bl func_02020d48
    ldr r0, [r4, #0x1c]
    add r0, r0, #0x1
    str r0, [r4, #0x1c]
    b .L_02020bc4
.L_02020b6c:
    ldr r0, .L_02020c2c
    ldr r1, .L_02020c30
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq .L_02020bc4
    mov r0, r4
    mov r1, #0x2
    bl func_02020d48
    ldr r0, [r4, #0x1c]
    add r0, r0, #0x1
    str r0, [r4, #0x1c]
    b .L_02020bc4
.L_02020ba0:
    ldr r0, [r4, #0x18]
    cmp r0, #0x0
    bne .L_02020bc4
    ldr r0, .L_02020c2c
    ldr r1, .L_02020c34
    ldr r0, [r0, #0x0]
    bl GameWork_SetFlag
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_02020bc4:
    ldr r5, [r4, #0x10]
    b .L_02020c0c
.L_02020bcc:
    ldr r6, [r5, #0x8]
    ldr r1, [r4, #0x8]
    mov r0, r6
    bl func_0202057c
    cmp r0, #0x0
    beq .L_02020c08
    mov r1, r5
    add r0, r4, #0xc
    bl func_02020a54
    cmp r6, #0x0
    beq .L_02020c08
    mov r0, r6
    bl func_02020558
    mov r0, r6
    bl Heap_Free
.L_02020c08:
    ldr r5, [r5, #0x0]
.L_02020c0c:
    cmp r5, #0x0
    bne .L_02020bcc
    ldr r0, [r4, #0x24]
    bl func_020740a4
    ldr r0, [r4, #0x28]
    bl func_020740a4
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_02020c2c: .word gGameWork
.L_02020c30: .word 0x408
.L_02020c34: .word 0x409
    .size func_02020abc, .-func_02020abc


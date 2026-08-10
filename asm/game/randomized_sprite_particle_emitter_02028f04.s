; Matching retail form; see src/game/randomized_sprite_particle_emitter.c.
.text
.extern GameWork_TestFlag
.extern Heap_Alloc
.extern Heap_Free
.extern data_020de860
.extern data_020de8ec
.extern func_02005058
.extern VecFx32_Subtract
.extern func_02028860
.extern func_0202895c
.extern func_02028998
.extern func_02028e9c
.extern GraphicsSpriteGroup_AdvanceAnimations
.extern func_020bf1f8
.extern gGameWork
.extern gHeapContext
.extern genrand_int32

    .global func_02028f04
    .type func_02028f04, @function
func_02028f04: ; 0x02028f04
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x18
    ldr r1, .L_02029058
    mov r4, r0
    ldr r0, [r1, #0x0]
    ldr r1, .L_0202905c
    bl GameWork_TestFlag
    cmp r0, #0x0
    movne r0, #0x1
    bne .L_02029050
    ldr r0, [r4, #0x54]
    subs r0, r0, #0x1
    str r0, [r4, #0x54]
    bpl .L_02028fdc
    bl genrand_int32
    mov r1, #0x5
    bl func_020bf1f8
    add ip, r1, #0x1e
    ldr r1, .L_02029060
    ldr r3, .L_02029064
    mov r0, #0x4c
    mov r2, #0x4
    str ip, [r4, #0x54]
    bl Heap_Alloc
    movs r5, r0
    beq .L_02028f90
    add r1, r4, #0x1c
    str r1, [sp, #0x0]
    ldr r1, [r4, #0x58]
    add r2, r4, #0x3c
    str r1, [sp, #0x4]
    ldr r1, [r4, #0x4c]
    add r3, r4, #0xc
    bl func_02028860
    mov r5, r0
.L_02028f90:
    ldr r1, .L_02029068
    ldr r3, .L_02029064
    mov r0, #0xc
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    movne r1, #0x0
    strne r1, [r0, #0x0]
    stmneib r0, {r1, r5}
    ldr r1, [r4, #0x64]
    cmp r1, #0x0
    strne r0, [r1, #0x0]
    ldrne r1, [r4, #0x64]
    strne r1, [r0, #0x4]
    streq r0, [r4, #0x60]
    str r0, [r4, #0x64]
    ldr r0, [r4, #0x68]
    add r0, r0, #0x1
    str r0, [r4, #0x68]
.L_02028fdc:
    ldr r5, [r4, #0x60]
    b .L_02029024
.L_02028fe4:
    ldr r6, [r5, #0x8]
    ldr r1, [r4, #0x8]
    mov r0, r6
    bl func_02028998
    cmp r0, #0x0
    beq .L_02029020
    mov r1, r5
    add r0, r4, #0x5c
    bl func_02028e9c
    cmp r6, #0x0
    beq .L_02029020
    mov r0, r6
    bl func_0202895c
    mov r0, r6
    bl Heap_Free
.L_02029020:
    ldr r5, [r5, #0x0]
.L_02029024:
    cmp r5, #0x0
    bne .L_02028fe4
    ldr r2, [r4, #0x8]
    add r0, sp, #0x8
    add r1, r4, #0xc
    bl VecFx32_Subtract
    ldr r0, [r4, #0x4c]
    bl GraphicsSpriteGroup_AdvanceAnimations
    add r0, sp, #0x8
    bl func_02005058
    mov r0, #0x0
.L_02029050:
    add sp, sp, #0x18
    ldmia sp!, {r4, r5, r6, pc}
.L_02029058: .word gGameWork
.L_0202905c: .word 0x414
.L_02029060: .word data_020de8ec
.L_02029064: .word gHeapContext
.L_02029068: .word data_020de860
    .size func_02028f04, . - func_02028f04


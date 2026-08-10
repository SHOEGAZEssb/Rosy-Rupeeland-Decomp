; Matching retail form; see src/game/randomized_sprite_particle_emitter.c.
.text
.extern Heap_Alloc
.extern data_020de8f4
.extern data_021052fc
.extern VecFx32Object_InitComponents
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern func_0201ded4
.extern func_02028b98
.extern gHeapContext

    .global func_0202906c
    .type func_0202906c, @function
func_0202906c: ; 0x0202906c
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x44
    mov r7, r0
    mov r4, r3
    add r0, sp, #0x34
    mov r1, r1, lsl #0xc
    mov r2, r2, lsl #0xc
    mov r3, #0x0
    bl VecFx32Object_InitComponents
    ldr r2, [sp, #0x58]
    add r0, sp, #0x24
    mov r1, r4, lsl #0xc
    mov r2, r2, lsl #0xc
    mov r3, #0x0
    bl VecFx32Object_InitComponents
    mov r5, #0x0
    ldr r1, .L_02029164
    ldr r3, .L_02029168
    mov r0, #0x6c
    mov r2, #0x4
    mov r6, r5
    bl Heap_Alloc
    movs r4, r0
    beq .L_0202910c
    add r0, sp, #0x14
    add r1, sp, #0x24
    bl VecFx32Object_InitCopy
    add r0, sp, #0x4
    add r1, sp, #0x34
    mov r5, #0x1
    bl VecFx32Object_InitCopy
    ldr r0, [sp, #0x5c]
    add r2, sp, #0x4
    str r0, [sp, #0x0]
    add r3, sp, #0x14
    mov r0, r4
    mov r1, r7
    mov r6, r5
    bl func_02028b98
    mov r4, r0
.L_0202910c:
    ldr r0, .L_0202916c
    mov r1, r4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201ded4
    mov r4, r0
    cmp r6, #0x0
    beq .L_02029138
    add r0, sp, #0x4
    bl VecFx32Object_Destroy
.L_02029138:
    cmp r5, #0x0
    beq .L_02029148
    add r0, sp, #0x14
    bl VecFx32Object_Destroy
.L_02029148:
    add r0, sp, #0x24
    bl VecFx32Object_Destroy
    add r0, sp, #0x34
    bl VecFx32Object_Destroy
    mov r0, r4
    add sp, sp, #0x44
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_02029164: .word data_020de8f4
.L_02029168: .word gHeapContext
.L_0202916c: .word data_021052fc
    .size func_0202906c, . - func_0202906c


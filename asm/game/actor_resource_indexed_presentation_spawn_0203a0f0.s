; Matching retail form; see src/game/actor_resource_indexed_presentation_spawn.c.
.text
.extern Heap_Alloc
.extern Sound_Play
.extern data_020df4f0
.extern data_021052fc
.extern data_021056e4
.extern func_0201ded4
.extern func_0201f378
.extern func_0203a0b4
.extern gHeapContext
.extern gSoundContext
.extern genrand_int32

    .global func_0203a0f0
    .type func_0203a0f0, @function
func_0203a0f0: ; 0x0203a0f0
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x14
    mov r7, r1
    mov r8, r0
    mov r0, r7
    mov r6, r2
    bl func_0203a0b4
    movs r4, r0
    beq .L_0203a2f8
    bl genrand_int32
    cmp r7, #0x1
    beq .L_0203a130
    cmp r7, #0x7
    cmpne r7, #0x8
    beq .L_0203a1c0
    b .L_0203a278
.L_0203a130:
    ldr r1, .L_0203a300
    ldr r3, .L_0203a304
    mov r0, #0x14
    mov r2, #0x4
    bl Heap_Alloc
    movs r5, r0
    beq .L_0203a18c
    ldr r1, [r4, #0x4]
    mov r3, #0x12
    str r1, [sp, #0x0]
    ldr r1, [r4, #0x8]
    mov r2, #0x2
    str r1, [sp, #0x4]
    ldr r4, [r4, #0xc]
    add r1, r8, #0x18
    str r4, [sp, #0x8]
    str r3, [sp, #0xc]
    str r2, [sp, #0x10]
    ldr r3, [r8, #0x54]
    mov r2, #0x0
    ldr r3, [r3, #0x0]
    bl func_0201f378
    mov r5, r0
.L_0203a18c:
    ldr r0, .L_0203a308
    sub r1, r7, #0x1
    ldr r0, [r0, #0x4]
    add r0, r0, r1, lsl #0x3
    ldrh r2, [r0, #0x6]
    cmp r2, #0x0
    beq .L_0203a2d4
    ldr r0, .L_0203a30c
    mov r1, r2, asr #0x7
    ldr r0, [r0, #0x0]
    and r2, r2, #0x7f
    bl Sound_Play
    b .L_0203a2d4
.L_0203a1c0:
    ldr r1, .L_0203a300
    ldr r3, .L_0203a304
    mov r0, #0x14
    mov r2, #0x4
    bl Heap_Alloc
    movs r5, r0
    beq .L_0203a22c
    ldr r1, [r4, #0x4]
    mov r3, #0x40
    str r1, [sp, #0x0]
    ldr r1, [r4, #0x8]
    mov r2, #0x2
    str r1, [sp, #0x4]
    ldr r4, [r4, #0xc]
    add r1, r8, #0x100
    str r4, [sp, #0x8]
    str r3, [sp, #0xc]
    str r2, [sp, #0x10]
    ldrsb r4, [r1, #0xe6]
    ldrb r3, [r8, #0xd4]
    ldr r2, [r8, #0x54]
    add r1, r8, #0x18
    add r4, r4, r3, lsl #0x1
    ldr r3, [r2, #0x0]
    and r2, r4, #0xff
    bl func_0201f378
    mov r5, r0
.L_0203a22c:
    ldrb r0, [r8, #0x4d]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_0203a2d4
    ldr r0, .L_0203a308
    sub r1, r7, #0x1
    ldr r0, [r0, #0x4]
    add r0, r0, r1, lsl #0x3
    ldrh r2, [r0, #0x6]
    cmp r2, #0x0
    beq .L_0203a2d4
    ldr r0, .L_0203a30c
    mov r1, r2, asr #0x7
    ldr r0, [r0, #0x0]
    and r2, r2, #0x7f
    bl Sound_Play
    b .L_0203a2d4
.L_0203a278:
    ldr r1, .L_0203a300
    ldr r3, .L_0203a304
    mov r0, #0x14
    mov r2, #0x4
    bl Heap_Alloc
    movs r5, r0
    beq .L_0203a2d4
    ldr r1, [r4, #0x4]
    mov r3, #0x12
    str r1, [sp, #0x0]
    ldr r1, [r4, #0x8]
    mov r2, #0x2
    str r1, [sp, #0x4]
    ldr r4, [r4, #0xc]
    add r1, r8, #0x18
    str r4, [sp, #0x8]
    str r3, [sp, #0xc]
    str r2, [sp, #0x10]
    ldr r3, [r8, #0x54]
    ldrb r2, [r8, #0xd4]
    ldr r3, [r3, #0x0]
    bl func_0201f378
    mov r5, r0
.L_0203a2d4:
    ldr r0, .L_0203a310
    mov r1, r5
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201ded4
    ldr r0, [r5, #0x8]
    ldr r0, [r0, #0x4]
    strh r6, [r0, #0x36]
.L_0203a2f8:
    add sp, sp, #0x14
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
.L_0203a300: .word data_020df4f0
.L_0203a304: .word gHeapContext
.L_0203a308: .word data_021056e4
.L_0203a30c: .word gSoundContext
.L_0203a310: .word data_021052fc
    .size func_0203a0f0, . - func_0203a0f0

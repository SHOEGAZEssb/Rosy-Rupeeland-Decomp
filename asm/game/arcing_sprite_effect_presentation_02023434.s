; Matching retail form; see src/game/arcing_sprite_effect_presentation.c.
.text
.extern Heap_Alloc
.extern Heap_Free
.extern Sound_Play
.extern data_020c9670
.extern data_020d6740
.extern data_020d6760
.extern data_02105610
.extern func_02005058
.extern func_02005580
.extern func_02005afc
.extern func_02005c3c
.extern func_0200637c
.extern func_020064b8
.extern func_02006918
.extern func_02008378
.extern func_0201e250
.extern func_0201e28c
.extern func_020233c8
.extern func_02072b68
.extern func_02074038
.extern func_020740c8
.extern func_020befec
.extern gHeapContext
.extern gSoundContext

.global func_02023434
    .type func_02023434, @function
func_02023434: ; 0x02023434
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x3c
    mov r7, r0
    mov r6, r1
    mov r5, r2
    mov r4, r3
    bl func_0201e250
    ldr r1, .L_02023584
    ldrsh r0, [sp, #0x50]
    str r1, [r7, #0x0]
    mov r1, #0x0
    strh r1, [r7, #0x14]
    strh r0, [r7, #0x16]
    ldrb r0, [sp, #0x54]
    strh r1, [r7, #0x18]
    mov r1, #0x30
    strh r1, [r7, #0x1a]
    ldr r1, .L_02023588
    ldr r3, .L_0202358c
    strb r0, [r7, #0x20]
    mov r0, #0x10
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_020234a8
    ldr r1, .L_02023590
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl func_02005580
.L_020234a8:
    ldr r1, .L_02023588
    str r0, [r7, #0x8]
    ldr r3, .L_0202358c
    mov r0, #0x10
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_020234d8
    ldr r1, .L_02023594
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl func_02005580
.L_020234d8:
    str r0, [r7, #0xc]
    mov r2, #0x0
    str r2, [sp, #0x0]
    mov r0, #0xa
    stmib sp, {r0, r2}
    ldr r1, [r7, #0x8]
    mov r0, r6
    mov r3, r2
    bl func_02005c3c
    str r0, [r7, #0x10]
    ldr r2, .L_02023598
    add r0, sp, #0x1c
    mov r1, r5
    bl func_020233c8
    ldr r2, .L_0202359c
    add r0, sp, #0xc
    mov r1, r4
    bl func_020233c8
    add r0, sp, #0x2c
    add r1, sp, #0x1c
    add r2, sp, #0xc
    bl func_02008378
    add r0, sp, #0xc
    bl func_02005058
    add r0, sp, #0x1c
    bl func_02005058
    ldr r1, .L_02023588
    ldr r3, .L_0202358c
    mov r0, #0x30
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0202356c
    add r3, sp, #0x2c
    mov r1, r5
    mov r2, r4
    bl func_02006918
.L_0202356c:
    str r0, [r7, #0x1c]
    add r0, sp, #0x2c
    bl func_02005058
    mov r0, r7
    add sp, sp, #0x3c
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_02023584: .word data_020d6740
.L_02023588: .word data_020d6760
.L_0202358c: .word gHeapContext
.L_02023590: .word 0x1714
.L_02023594: .word 0x1625
.L_02023598: .word 0x4cd
.L_0202359c: .word 0xb33
    .size func_02023434, .-func_02023434


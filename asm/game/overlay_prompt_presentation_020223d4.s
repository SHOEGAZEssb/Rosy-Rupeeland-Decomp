; Matching retail form; see src/game/overlay_prompt_presentation.c.
.text
.extern GameWork_ClearFlag
.extern GameWork_TestFlag
.extern Heap_Alloc
.extern Heap_Free
.extern data_020d653c
.extern data_020d65ac
.extern func_02002db0
.extern func_02006268
.extern func_02006280
.extern func_020062a0
.extern func_020062f8
.extern func_0201140c
.extern func_0201e250
.extern func_0201e28c
.extern func_020755bc
.extern func_02091fb0
.extern func_02092c8c
.extern func_ov001_021fbe6c
.extern gDebugFont
.extern gGameWork
.extern gHeapContext
.extern gLupyContext

.global func_020223d4
    .type func_020223d4, @function
func_020223d4: ; 0x020223d4
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x8]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_0202250c
.L_020223ec: ; jump table
    b .L_020223fc ; case 0
    b .L_0202241c ; case 1
    b .L_02022484 ; case 2
    b .L_02022504 ; case 3
.L_020223fc:
    mov r1, #0x1
    mov r0, #0x2
    str r1, [r4, #0x20]
    sub r1, r0, #0x12
    bl func_02092c8c
    ldr r0, [r4, #0x8]
    add r0, r0, #0x1
    str r0, [r4, #0x8]
.L_0202241c:
    bl func_02002db0
    cmp r0, #0x0
    beq .L_0202250c
    ldr r0, .L_02022514
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    bl func_0201140c
    ldr r1, .L_02022518
    add r0, r4, #0x10
    bl func_020062a0
    ldr r1, .L_0202251c
    ldr r3, .L_02022520
    mov r0, #0x88
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02022464
    bl func_ov001_021fbe6c ; func_ov005_021fbe6c
.L_02022464:
    str r0, [r4, #0xc]
    mov r0, #0x2
    mov r1, #0x0
    bl func_02092c8c
    ldr r0, [r4, #0x8]
    add r0, r0, #0x1
    str r0, [r4, #0x8]
    b .L_0202250c
.L_02022484:
    ldr r0, [r4, #0xc]
    mov r1, #0x1
    bl func_02091fb0
    ldr r0, .L_02022524
    ldr r1, .L_02022528
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq .L_0202250c
    ldr r0, .L_02022524
    ldr r1, .L_02022528
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r0, .L_0202252c
    ldr r0, [r0, #0x0]
    bl func_020755bc
    mov r0, #0x0
    str r0, [r4, #0x20]
    ldr r0, [r4, #0xc]
    cmp r0, #0x0
    beq .L_020224e4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_020224e4:
    mov r0, #0x0
    str r0, [r4, #0xc]
    add r0, r4, #0x10
    bl func_020062f8
    ldr r0, [r4, #0x8]
    add r0, r0, #0x1
    str r0, [r4, #0x8]
    b .L_0202250c
.L_02022504:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_0202250c:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_02022514: .word gLupyContext
.L_02022518: .word 0x5
.L_0202251c: .word data_020d65ac
.L_02022520: .word gHeapContext
.L_02022524: .word gGameWork
.L_02022528: .word 0x408
.L_0202252c: .word gDebugFont
    .size func_020223d4, .-func_020223d4


; Matching retail form; see src/game/grid_effect_actor_setup.c.
.extern Heap_Alloc
.extern data_020e2724
.extern gHeapContext
.extern func_02005580
.extern func_02030acc
.extern func_020313b4
.extern Actor_GetCollection
.extern func_02072b68
.extern func_02073fc4
.text

    .global func_0204ed3c
func_0204ed3c: ; 0x0204ed3c
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    mov r5, r1
    mov r6, r0
    ldr r1, .L_0204edcc
    ldr r3, .L_0204edd0
    mov r0, #0x10
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0204ed70
    ldmib r5, {r1, r2, r3}
    bl func_02005580
.L_0204ed70:
    mov r4, r0
    str r0, [r6, #0x1ec]
    mov r0, r6
    bl Actor_GetCollection
    bl func_02030acc
    ldrb r1, [r5, #0x10]
    str r1, [sp, #0x0]
    ldmib r4, {r1, r2, r3}
    bl func_02073fc4
    str r0, [r6, #0x54]
    ldrb r2, [r5, #0x10]
    ldr r1, [r6, #0x1ec]
    mov r0, r6
    bl func_020313b4
    ldrb r1, [r5, #0x11]
    ldr r0, [r6, #0x54]
    bl func_02072b68
    ldr r1, [r6, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x6
    strh r0, [r1, #0x24]
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_0204edcc: .word data_020e2724
.L_0204edd0: .word gHeapContext
.size func_0204ed3c, . - func_0204ed3c


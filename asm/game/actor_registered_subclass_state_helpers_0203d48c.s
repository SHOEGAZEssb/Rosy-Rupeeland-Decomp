; Matching retail form; see src/game/actor_registered_subclass_state_helpers.c.
.text
.extern Heap_Alloc
.extern data_020df9d8
.extern func_0201f864
.extern gHeapContext
    .global ActorRegisteredSubclass_StartTimedState
    .type ActorRegisteredSubclass_StartTimedState, @function
ActorRegisteredSubclass_StartTimedState: ; 0x0203d48c
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x18
    mov r4, r0
    ldrsh r0, [r4, #0xd6]
    cmp r0, #0x1
    bgt .L_0203d530
    add r0, r4, #0x200
    ldrh r2, [r0, #0x1a]
    ldr r3, .L_0203d538
    cmp r2, r1
    strgth r1, [r0, #0x1a]
    mov r0, #0x1
    strh r0, [r4, #0xd6]
    ldr r0, [r4, #0xd0]
    ldr r1, .L_0203d53c
    orr r5, r0, #0x1000
    mov r0, #0x14
    mov r2, #0x4
    str r5, [r4, #0xd0]
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0203d530
    ldr r6, [r4, #0x54]
    mov lr, #0x2
    ldr r1, [r6, #0x18]
    sub ip, lr, #0x6
    ldr r1, [r1, #0x10]
    sub r3, lr, #0x3
    str r1, [sp, #0x0]
    ldr r1, [r6, #0x1c]
    mov r2, #0x1
    ldr r5, [r1, #0x10]
    add r1, r4, #0x18
    stmib sp, {r5, lr}
    str ip, [sp, #0xc]
    str r3, [sp, #0x10]
    str r2, [sp, #0x14]
    ldr r3, [r6, #0x14]
    ldr r2, [r6, #0x0]
    ldr r3, [r3, #0x10]
    bl func_0201f864
.L_0203d530:
    add sp, sp, #0x18
    ldmia sp!, {r4, r5, r6, pc}
.L_0203d538: .word gHeapContext
.L_0203d53c: .word data_020df9d8
    .size ActorRegisteredSubclass_StartTimedState, . - ActorRegisteredSubclass_StartTimedState

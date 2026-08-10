; Matching retail form; see src/game/tracked_resource_actor_setup.c.
.extern Heap_Alloc
.extern data_020e35c4
.extern gHeapContext
.extern func_02005580
.extern ActorCollection_GetSpriteOwner
.extern func_020313b4
.extern Actor_GetCollection
.extern func_02072b68
.extern func_02073fc4
.text

    .global func_0204fe68
func_0204fe68: ; 0x0204fe68
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    mov r5, r1
    mov r6, r0
    ldr r1, .L_0204ff04
    ldr r3, .L_0204ff08
    mov r0, #0x10
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0204fe9c
    ldmib r5, {r1, r2, r3}
    bl func_02005580
.L_0204fe9c:
    mov r4, r0
    str r0, [r6, #0x1ec]
    mov r0, r6
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    ldrb r1, [r5, #0x10]
    str r1, [sp, #0x0]
    ldmib r4, {r1, r2, r3}
    bl func_02073fc4
    str r0, [r6, #0x54]
    ldrb r1, [r5, #0x11]
    bl func_02072b68
    ldr r2, [r6, #0x54]
    mov r0, r6
    ldrh r1, [r2, #0x24]
    orr r1, r1, #0x6
    strh r1, [r2, #0x24]
    ldrb r2, [r5, #0x10]
    ldr r1, [r6, #0x1ec]
    bl func_020313b4
    mov r0, r6
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_0204ff04: .word data_020e35c4
.L_0204ff08: .word gHeapContext
.size func_0204fe68, . - func_0204fe68


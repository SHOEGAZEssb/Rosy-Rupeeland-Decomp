; Matching retail form; see src/game/actor_attachment_slot_resource.c.
.text
.extern Heap_Alloc
.extern data_020df48c
.extern AnimationResource_Init
.extern ActorCollection_GetSpriteOwner
.extern Actor_GetCollection
.extern func_020740c8
.extern gHeapContext

    .global Actor_ReplaceAttachmentSlotResource
    .type Actor_ReplaceAttachmentSlotResource, @function
Actor_ReplaceAttachmentSlotResource: ; 0x02039720
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r8, r0
    mov r7, r1
    mov r6, r3
    mov r9, r2
    add r4, r8, r7, lsl #0x2
    ldr r1, .L_020397cc
    ldr r3, .L_020397d0
    mov r0, #0x10
    mov r2, #0x4
    ldr r4, [r4, #0x208]
    bl Heap_Alloc
    movs r5, r0
    beq .L_0203976c
    ldr r3, [sp, #0x20]
    mov r1, r9
    mov r2, r6
    bl AnimationResource_Init
    mov r5, r0
.L_0203976c:
    cmp r4, #0x0
    beq .L_020397c0
    ldr r6, [r8, #0x54]
    ldr r0, [r4, #0x4]
    ldr r1, [r6, #0x14]
    cmp r1, r0
    bne .L_020397a8
    mov r0, r8
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    ldr r2, [r5, #0xc]
    mov r1, r6
    str r2, [sp, #0x0]
    ldmib r5, {r2, r3}
    bl func_020740c8
.L_020397a8:
    cmp r4, #0x0
    beq .L_020397c0
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_020397c0:
    add r0, r8, r7, lsl #0x2
    str r5, [r0, #0x208]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_020397cc: .word data_020df48c
.L_020397d0: .word gHeapContext
    .size Actor_ReplaceAttachmentSlotResource, . - Actor_ReplaceAttachmentSlotResource

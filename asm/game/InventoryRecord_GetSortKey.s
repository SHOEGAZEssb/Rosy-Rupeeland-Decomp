.text
; Matching fallback for the portable implementation in src/game/inventory_record_sort.c.
.extern ActorDescriptor_IsInvalid
.extern InventoryRecord_IsEmptyKind1Subtype1

.global InventoryRecord_GetSortKey
InventoryRecord_GetSortKey:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    bl ActorDescriptor_IsInvalid
    cmp r0, #0x0
    ldrne r0, .L_0206300c
    ldmneia sp!, {r4, r5, r6, pc}
    ldr r1, [r6, #0x8]
    ldrb r0, [r1, #0x2]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_02063004
.L_02062f48:
    b .L_02062f58
    b .L_02062fd4
    b .L_02062fb8
    b .L_02062f88
.L_02062f58:
    ldr r0, [r1, #0x8]
    cmp r5, #0x1
    ldrneh r0, [r0, #0x2]
    movne r0, r0, lsl #0x11
    movne r4, r0, lsr #0x10
    bne .L_02063004
    ldrh r0, [r0, #0x2]
    mov r0, r0, lsl #0x1
    orr r0, r0, #0x4000
    mov r0, r0, lsl #0x10
    mov r4, r0, lsr #0x10
    b .L_02063004
.L_02062f88:
    ldr r0, [r1, #0x8]
    cmp r5, #0x1
    ldreqh r0, [r0, #0x4]
    moveq r0, r0, lsl #0x11
    moveq r4, r0, lsr #0x10
    beq .L_02063004
    ldrh r0, [r0, #0x4]
    mov r0, r0, lsl #0x1
    orr r0, r0, #0x4000
    mov r0, r0, lsl #0x10
    mov r4, r0, lsr #0x10
    b .L_02063004
.L_02062fb8:
    ldr r0, [r1, #0x8]
    ldrh r0, [r0, #0x6]
    mov r0, r0, lsl #0x1
    orr r0, r0, #0x1000
    mov r0, r0, lsl #0x10
    mov r4, r0, lsr #0x10
    b .L_02063004
.L_02062fd4:
    mov r0, r6
    bl InventoryRecord_IsEmptyKind1Subtype1
    cmp r0, #0x0
    ldrne r4, .L_02063010
    bne .L_02063004
    ldr r0, [r6, #0x8]
    ldr r0, [r0, #0x8]
    ldrh r0, [r0, #0x2]
    mov r0, r0, lsl #0x1
    orr r0, r0, #0x2000
    mov r0, r0, lsl #0x10
    mov r4, r0, lsr #0x10
.L_02063004:
    mov r0, r4
    ldmia sp!, {r4, r5, r6, pc}
.L_0206300c: .word 0xffff
.L_02063010: .word 0x27d0
.size InventoryRecord_GetSortKey, . - InventoryRecord_GetSortKey

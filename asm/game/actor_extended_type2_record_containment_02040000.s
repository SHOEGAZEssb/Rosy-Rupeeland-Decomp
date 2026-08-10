; Matching retail form; see src/game/actor_extended_type2_record_containment.c.
.text
.global ActorExtendedRecordArray_ContainsPoint
.type ActorExtendedRecordArray_ContainsPoint, @function
ActorExtendedRecordArray_ContainsPoint: ; 0x02040000
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r1, r1, lsl #0x4
    mov r2, r2, lsl #0x4
    mov r5, #0x0
    mov lr, #0x1
    mov r6, r1, asr #0x10
    mov r7, r2, asr #0x10
    ldr r8, [r0, #0x8]
    mov ip, r5
    mov r2, r5
    mov r3, lr
    mov r1, lr
    b .L_02040094
.L_02040034:
    ldr r4, [r0, #0x4]
    add r4, r4, r5, lsl #0x3
    ldrsh r9, [r4, #0x6]
    ldrsh r10, [r4, #0x2]
    ldrsh r11, [r4, #0x0]
    cmp r7, r9
    movlt r9, lr
    movge r9, ip
    cmp r7, r10
    movge r10, r3
    movlt r10, r2
    cmp r6, r11
    movge r11, r1
    ldrsh r4, [r4, #0x4]
    movlt r11, #0x0
    cmp r6, r4
    movlt r4, #0x1
    movge r4, #0x0
    and r4, r11, r4
    and r4, r10, r4
    tst r9, r4
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    add r5, r5, #0x1
.L_02040094:
    cmp r5, r8
    blt .L_02040034
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.size ActorExtendedRecordArray_ContainsPoint, . - ActorExtendedRecordArray_ContainsPoint

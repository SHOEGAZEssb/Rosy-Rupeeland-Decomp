; Matching retail form; see src/game/actor_collection_category_build.c.
.text
.extern ActorCollection_AppendToCategory
.extern func_0202ddac
.extern func_0202ddc4

    .global ActorCollection_RebuildCategories
    .type ActorCollection_RebuildCategories, @function
ActorCollection_RebuildCategories: ; 0x0202dbe0
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r4, #0x0
    mov r5, r0
    str r4, [r5, #0xe30]
    str r4, [r5, #0xe2c]
    str r4, [r5, #0xe28]
    str r4, [r5, #0xe24]
    str r4, [r5, #0xe20]
    add r6, r5, #0x2000
    mov r8, r4
    mov r11, #0x1
    ldr r7, .L_0202dd7c
    b .L_0202dd6c
.L_0202dc14:
    ldr r9, [r5, r4, lsl #0x2]
    cmp r9, #0x0
    beq .L_0202dd68
    ldr r0, [r9, #0x10]
    bic r0, r0, #0x80
    str r0, [r9, #0x10]
    ldr r10, [r9, #0x54]
    ldr r0, [r9, #0x14]
    tst r0, #0x8
    bne .L_0202dc5c
    ldr r1, [r9, #0x10]
    tst r1, #0x4
    bne .L_0202dc5c
    ldrb r0, [r9, #0x4d]
    cmp r0, #0x6
    beq .L_0202dc5c
    tst r1, #0x100
    beq .L_0202dd4c
.L_0202dc5c:
    mov r0, r5
    mov r1, r8
    mov r2, r9
    bl ActorCollection_AppendToCategory
    ldr r0, [r9, #0x14]
    tst r0, #0x200000
    moveq r0, r11
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_0202dd68
    mov r0, r9
    bl func_0202ddac
    cmp r0, #0x0
    bne .L_0202dca4
    mov r0, r9
    bl func_0202ddc4
    cmp r0, #0x0
    beq .L_0202dce0
.L_0202dca4:
    cmp r10, #0x0
    beq .L_0202dcd0
    ldr r0, [r9, #0x14]
    tst r0, #0x10000000
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    bne .L_0202dcd0
    ldr r0, [r9, #0x14]
    tst r0, #0x8
    beq .L_0202dcd8
.L_0202dcd0:
    mov r10, #0x1
    b .L_0202dce4
.L_0202dcd8:
    mov r10, #0x0
    b .L_0202dce4
.L_0202dce0:
    mov r10, #0x0
.L_0202dce4:
    ldr r0, [r9, #0x14]
    tst r0, r7
    bne .L_0202dd28
    cmp r10, #0x0
    beq .L_0202dd0c
    mov r0, r5
    mov r1, #0x1
    mov r2, r9
    bl ActorCollection_AppendToCategory
    b .L_0202dd28
.L_0202dd0c:
    ldrb r0, [r9, #0x4d]
    cmp r0, #0x1
    bne .L_0202dd28
    mov r0, r5
    mov r1, #0x1
    mov r2, r9
    bl ActorCollection_AppendToCategory
.L_0202dd28:
    cmp r10, #0x0
    beq .L_0202dd4c
    ldr r0, [r9, #0x14]
    tst r0, #0x4
    bne .L_0202dd4c
    mov r0, r5
    mov r1, #0x2
    mov r2, r9
    bl ActorCollection_AppendToCategory
.L_0202dd4c:
    ldrb r0, [r9, #0x4d]
    cmp r0, #0x6
    beq .L_0202dd68
    mov r2, r9
    mov r0, r5
    mov r1, #0x3
    bl ActorCollection_AppendToCategory
.L_0202dd68:
    add r4, r4, #0x1
.L_0202dd6c:
    ldr r0, [r6, #0xe74]
    cmp r4, r0
    blt .L_0202dc14
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0202dd7c: .word 0x1000002
    .size ActorCollection_RebuildCategories, . - ActorCollection_RebuildCategories

; Matching retail form; see src/game/actor_collection_basic_category_build.c.
.text
.extern func_0202dd80

    .global func_0202dddc
    .type func_0202dddc, @function
func_0202dddc: ; 0x0202dddc
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r6, #0x0
    mov r7, r0
    str r6, [r7, #0xe30]
    str r6, [r7, #0xe2c]
    str r6, [r7, #0xe28]
    str r6, [r7, #0xe24]
    str r6, [r7, #0xe20]
    add r8, r7, #0x2000
    mov r4, r6
    mov r9, #0x3
    b .L_0202de80
.L_0202de0c:
    ldr r5, [r7, r6, lsl #0x2]
    cmp r5, #0x0
    beq .L_0202de7c
    ldr r0, [r5, #0x10]
    bic r0, r0, #0x80
    str r0, [r5, #0x10]
    ldr r0, [r5, #0x14]
    tst r0, #0x8
    bne .L_0202de50
    ldr r1, [r5, #0x10]
    tst r1, #0x4
    bne .L_0202de50
    ldrb r0, [r5, #0x4d]
    cmp r0, #0x6
    beq .L_0202de50
    tst r1, #0x100
    beq .L_0202de60
.L_0202de50:
    mov r0, r7
    mov r1, r4
    mov r2, r5
    bl func_0202dd80
.L_0202de60:
    ldrb r0, [r5, #0x4d]
    cmp r0, #0x6
    beq .L_0202de7c
    mov r0, r7
    mov r1, r9
    mov r2, r5
    bl func_0202dd80
.L_0202de7c:
    add r6, r6, #0x1
.L_0202de80:
    ldr r0, [r8, #0xe74]
    cmp r6, r0
    blt .L_0202de0c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    .size func_0202dddc, . - func_0202dddc

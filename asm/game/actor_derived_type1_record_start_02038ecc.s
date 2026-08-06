; Matching retail form; see src/game/actor_derived_type1_record_start.c.
.text
.extern Sound_Play
.extern func_02005030
.extern func_02005058
.extern func_02038f98
.extern func_020390c8
.extern func_02053f9c
.extern func_020541d4
.extern gSoundContext

    .global func_02038ecc
    .type func_02038ecc, @function
func_02038ecc: ; 0x02038ecc
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    mov r5, r0
    ldr r0, [r5, #0x26c]
    mov r4, r1
    cmp r0, #0x0
    bne .L_02038f8c
    ldr r0, [r5, #0x270]
    cmp r0, #0x0
    beq .L_02038f00
    ldrb r0, [r0, #0x10]
    tst r0, #0x1
    bne .L_02038f8c
.L_02038f00:
    ldr r0, [r5, #0x230]
    tst r0, #0x20000
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    bne .L_02038f8c
    mov r0, r5
    bl func_020390c8
    add r0, sp, #0x0
    add r1, r5, #0x18
    bl func_02005030
    mov r0, r4
    bl func_020541d4
    str r0, [r5, #0x27c]
    ldrh r1, [r0, #0x2]
    cmp r1, #0x0
    beq .L_02038f5c
    add r1, sp, #0x0
    mov r0, r4
    mov r2, #0x1
    bl func_02053f9c
    str r0, [r5, #0x278]
    b .L_02038f7c
.L_02038f5c:
    ldrh r2, [r0, #0x2e]
    cmp r2, #0x0
    beq .L_02038f7c
    ldr r0, .L_02038f94
    mov r1, r2, asr #0x7
    ldr r0, [r0, #0x0]
    and r2, r2, #0x7f
    bl Sound_Play
.L_02038f7c:
    mov r0, r5
    bl func_02038f98
    add r0, sp, #0x0
    bl func_02005058
.L_02038f8c:
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
.L_02038f94: .word gSoundContext
    .size func_02038ecc, . - func_02038ecc

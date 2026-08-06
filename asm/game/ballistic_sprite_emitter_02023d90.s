; Matching retail form; see src/game/ballistic_sprite_emitter.c.
.text
.extern Heap_Free
.extern Sound_Play
.extern func_020239e8
.extern func_02023a14
.extern func_02023c0c
.extern func_02073fc4
.extern func_020740a4
.extern func_020be4e4
.extern func_020befec
.extern gSoundContext

    .global func_02023d90
    .type func_02023d90, @function
func_02023d90: ; 0x02023d90
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r10, r0
    ldr r9, [r10, #0x40]
    mov r5, #0x2
    mov r11, #0x32
    mov r7, #0x0
    mov r6, #0xf
    ldr r4, .L_02023ed0
    b .L_02023ea0
.L_02023db4:
    ldr r8, [r9, #0x8]
    mov r0, r8
    bl func_02023a14
    cmp r0, #0x0
    beq .L_02023e50
    ldr r0, [r10, #0x40]
    cmp r9, r0
    ldreq r0, [r9, #0x0]
    streq r0, [r10, #0x40]
    ldrne r1, [r9, #0x0]
    ldrne r0, [r9, #0x4]
    strne r1, [r0, #0x0]
    ldr r0, [r10, #0x44]
    cmp r9, r0
    ldreq r0, [r9, #0x4]
    streq r0, [r10, #0x44]
    ldmneia r9, {r0, r1}
    strne r1, [r0, #0x4]
    cmp r9, #0x0
    beq .L_02023e0c
    mov r0, r9
    bl Heap_Free
.L_02023e0c:
    ldr r0, [r10, #0x48]
    subs r0, r0, #0x1
    str r0, [r10, #0x48]
    bne .L_02023e24
    add r0, r10, #0x3c
    bl func_02023c0c
.L_02023e24:
    cmp r8, #0x0
    beq .L_02023e3c
    mov r0, r8
    bl func_020239e8
    mov r0, r8
    bl Heap_Free
.L_02023e3c:
    ldr r0, [r4, #0x0]
    mov r1, r7
    mov r2, r6
    bl Sound_Play
    b .L_02023e9c
.L_02023e50:
    bl func_020be4e4
    mov r1, r11
    bl func_020befec
    cmp r1, #0x19
    bne .L_02023e9c
    str r5, [sp, #0x0]
    ldr r0, [r10, #0x38]
    ldr r1, [r10, #0x2c]
    ldr r2, [r10, #0x30]
    ldr r3, [r10, #0x34]
    bl func_02073fc4
    ldrh r1, [r0, #0x24]
    orr r1, r1, #0x100
    strh r1, [r0, #0x24]
    ldmib r8, {r1, r2}
    mov r1, r1, asr #0xc
    strh r1, [r0, #0x2c]
    mov r1, r2, asr #0xc
    strh r1, [r0, #0x2e]
.L_02023e9c:
    ldr r9, [r9, #0x0]
.L_02023ea0:
    cmp r9, #0x0
    bne .L_02023db4
    ldr r0, [r10, #0x38]
    bl func_020740a4
    ldr r0, [r10, #0x48]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02023ed0: .word gSoundContext
    .size func_02023d90, . - func_02023d90

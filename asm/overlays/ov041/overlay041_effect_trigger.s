.text

/* Exact fallback for func_ov041_022013cc; see the documented portable C in
 * src/overlays/ov041/overlay041_effect_trigger.c. */
.extern Sound_Play
.extern func_02072d04
.extern func_ov041_02202a70
.extern gSoundContext

    .global func_ov041_022013cc
func_ov041_022013cc: ; 0x022013cc
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r8, r1
    mov r9, r0
    mov r4, #0x0
    mov r7, r2
    mov r6, r3
    str r4, [r9, #0x928]
    cmp r8, #0x1
    bne .L_02201438
    str r7, [r9, #0x4b0]
    ldr r0, [r9, #0x48]
    mov r1, #0xd
    ldr r2, [r0, #0x194]
    ldr r0, .L_02201598
    sub r2, r2, #0xc8000
    str r2, [r9, #0x4b4]
    str r4, [r9, #0x924]
    str r1, [r9, #0x920]
    ldr r0, [r0, #0x0]
    add r1, r1, #0x120
    mov r2, #0xb
    bl Sound_Play
    mov r0, r4
    str r0, [r9, #0x930]
    str r0, [r9, #0x934]
    str r0, [r9, #0x91c]
    b .L_02201540
.L_02201438:
    cmp r8, #0x2
    bne .L_02201474
    ldr r1, [r9, #0x48]
    mov r0, #0x2
    ldr r1, [r1, #0x8]
    ldr r1, [r1, #0xd4]
    sub r1, r1, #0x46000
    str r1, [r9, #0x4b0]
    ldr r1, [r9, #0x48]
    ldr r1, [r1, #0x8]
    ldr r1, [r1, #0xd8]
    str r1, [r9, #0x4b4]
    str r0, [r9, #0x920]
    str r4, [r9, #0x91c]
    b .L_02201540
.L_02201474:
    cmp r8, #0x3
    bne .L_022014ac
    str r7, [r9, #0x4b0]
    sub r0, r4, #0x82000
    str r0, [r9, #0x4b4]
    str r4, [r9, #0x924]
    mov r0, #0x4
    str r0, [r9, #0x920]
    str r4, [r9, #0x91c]
    mov r0, #0x78
    str r0, [r9, #0x930]
    str r4, [r9, #0x934]
    mov r4, #0x1000
    b .L_02201540
.L_022014ac:
    cmp r8, #0x9
    bne .L_022014d4
    str r7, [r9, #0x4b0]
    str r6, [r9, #0x4b4]
    str r4, [r9, #0x924]
    str r8, [r9, #0x920]
    str r4, [r9, #0x91c]
    str r4, [r9, #0x934]
    str r4, [r9, #0x930]
    b .L_02201540
.L_022014d4:
    cmp r8, #0xe
    bne .L_02201540
    str r7, [r9, #0x4b0]
    str r6, [r9, #0x4b4]
    str r4, [r9, #0x924]
    mov r0, #0xe
    str r0, [r9, #0x920]
    str r4, [r9, #0x91c]
    mov r0, #0x7
    str r4, [r9, #0x934]
    str r4, [r9, #0x930]
    sub r5, r0, #0x1
.L_02201504:
    add r0, r9, r5, lsl #0x2
    ldr r2, [r0, #0x4c]
    ldrh r1, [r2, #0x42]
    orr r1, r1, #0x4
    strh r1, [r2, #0x42]
    ldr r1, [r0, #0x4c]
    ldr r2, [r1, #0xc]
    ldrh r1, [r2, #0x24]
    orr r1, r1, #0x4
    strh r1, [r2, #0x24]
    ldr r0, [r0, #0x4c]
    ldr r0, [r0, #0xc]
    bl func_02072d04
    subs r5, r5, #0x1
    bpl .L_02201504
.L_02201540:
    mov r0, #0x5b
    sub ip, r0, #0x1
    sub r5, r6, #0x14000
    mov r3, #0x8000
    mov r1, #0x0
    mov r0, #0xc
.L_02201558:
    mla r6, ip, r0, r9
    str r7, [r6, #0x6c]
    add r2, r9, ip, lsl #0x2
    str r5, [r6, #0x70]
    str r3, [r2, #0x4b8]
    str r4, [r2, #0x624]
    str r1, [r2, #0x790]
    subs ip, ip, #0x1
    bpl .L_02201558
    cmp r8, #0x1
    bne .L_0220158c
    mov r0, r9
    bl func_ov041_02202a70
.L_0220158c:
    mov r0, #0x0
    str r0, [r9, #0x940]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_02201598: .word gSoundContext
    .size func_ov041_022013cc, . - func_ov041_022013cc


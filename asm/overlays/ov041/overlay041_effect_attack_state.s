.text

/* Exact fallback for func_ov041_02201e98; see the documented portable C in
 * src/overlays/ov041/overlay041_effect_attack_state.c. */
.extern Sound_Play
.extern gFx32CosSinTable
.extern func_020ae024
.extern func_ov041_02202a00
.extern func_ov041_02202a3c
.extern func_ov041_02202a70
.extern gSoundContext
.extern genrand_int32

    .global func_ov041_02201e98
func_ov041_02201e98: ; 0x02201e98
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r5, r0
    ldr r3, [r5, #0x48]
    ldr ip, [r5, #0x91c]
    mov r8, #0x0
    ldr r9, [r5, #0x4b4]
    ldr r7, [r5, #0x70]
    ldr lr, [r5, #0x4b0]
    ldr r6, [r5, #0x6c]
    sub r7, r9, r7
    ldr r9, [r3, #0x194]
    mov r10, r1
    mov r4, r2
    mov r11, r8
    cmp ip, #0x7
    sub r6, lr, r6
    addls pc, pc, ip, lsl #0x2
    b .L_02202190
.L_02201ee0: ; jump table
    b .L_02201f00 ; case 0
    b .L_02201f30 ; case 1
    b .L_02201fb4 ; case 2
    b .L_02201fd8 ; case 3
    b .L_022020b4 ; case 4
    b .L_022020e0 ; case 5
    b .L_02202120 ; case 6
    b .L_0220215c ; case 7
.L_02201f00:
    bl genrand_int32
    tst r0, #0x8
    moveq r0, #0x21000
    movne r0, #0xdf000
    mov r1, #0x82000
    rsb r1, r1, #0x0
    str r0, [r5, #0x4b0]
    str r1, [r5, #0x4b4]
    ldr r0, [r5, #0x91c]
    mov r7, r1, asr #0x14
    add r0, r0, #0x1
    str r0, [r5, #0x91c]
.L_02201f30:
    ldr r0, .L_0220220c
    mov r8, #0x1
    str r0, [r4, #0x0]
    ldr r0, [r5, #0x6c]
    cmp r0, #0x21000
    blt .L_02201f50
    cmp r0, #0xdf000
    ble .L_02202190
.L_02201f50:
    cmp r7, #0x0
    ble .L_02202190
    mov r0, #0x80000
    str r0, [r5, #0x4b0]
    sub r0, r9, #0x104000
    str r0, [r5, #0x4b4]
    mvn r1, #0x9
    str r1, [r5, #0x928]
    mov r1, #0xc
    mov r0, #0x0
    str r1, [r5, #0x920]
    str r0, [r5, #0x934]
    str r0, [r5, #0x954]
    str r0, [r5, #0x950]
    ldr r1, [r5, #0x91c]
    mov r0, r5
    add r1, r1, #0x1
    str r1, [r5, #0x91c]
    bl func_ov041_02202a70
    ldr r0, .L_02202210
    ldr r1, .L_02202214
    ldr r0, [r0, #0x0]
    mov r2, #0x1
    bl Sound_Play
    b .L_02202190
.L_02201fb4:
    str r8, [r5, #0x934]
    mov r0, #0xdc
    str r0, [r4, #0x0]
    ldr r0, [r5, #0x624]
    cmp r0, #0x0
    ldrle r0, [r5, #0x91c]
    addle r0, r0, #0x1
    strle r0, [r5, #0x91c]
    strle r8, [r5, #0x928]
.L_02201fd8:
    ldr r0, [r5, #0x934]
    mov r8, #0x1
    cmp r0, #0x1e
    ldrgt r0, .L_02202218
    strgt r0, [r4, #0x0]
    ldr r0, [r5, #0x934]
    cmp r0, #0xb4
    movgt r0, #0x140
    strgt r0, [r4, #0x0]
    ldr r0, [r5, #0x934]
    cmp r7, #0x4
    add r0, r0, #0x1
    str r0, [r5, #0x934]
    ldrlt r0, [r5, #0x4b4]
    addlt r0, r0, #0x33
    addlt r0, r0, #0x300
    strlt r0, [r5, #0x4b4]
    ldr r1, [r5, #0x48]
    mov r0, #0x28000
    ldr r2, [r1, #0x8]
    ldr r1, [r5, #0x4b4]
    ldr r2, [r2, #0xd8]
    rsb r0, r0, #0x0
    sub r1, r2, r1
    cmp r1, r0
    movlt r0, #0x168
    strlt r0, [r5, #0x934]
    ldr r0, [r5, #0x934]
    cmp r0, #0x168
    movge r0, #0x0
    strge r0, [r5, #0x934]
    ldrge r0, [r5, #0x91c]
    addge r0, r0, #0x1
    strge r0, [r5, #0x91c]
    ldr r0, [r5, #0x950]
    cmp r0, #0x0
    beq .L_02202190
    ldr r0, [r5, #0x6c]
    mov r1, #0x0
    cmp r0, #0x80000
    movgt r0, #0x12000
    movle r0, #0xee000
    str r0, [r5, #0x4b0]
    str r1, [r5, #0x930]
    ldr r0, .L_02202210
    ldr r1, .L_02202214
    ldr r0, [r0, #0x0]
    mov r2, #0x1
    bl Sound_Play
    ldr r1, [r5, #0x70]
    mov r0, #0x6
    sub r1, r1, #0x1e000
    str r1, [r5, #0x4b4]
    str r0, [r5, #0x91c]
    b .L_02202190
.L_022020b4:
    ldr r0, [r5, #0x934]
    add r0, r0, #0x1
    str r0, [r5, #0x934]
    cmp r0, #0xe
    ble .L_02202190
    ldr r1, [r5, #0x91c]
    mov r0, #0xcd
    add r1, r1, #0x1
    str r1, [r5, #0x91c]
    str r0, [r5, #0x928]
    b .L_02202190
.L_022020e0:
    ldr r1, [r5, #0x624]
    cmp r1, #0x1000
    blt .L_02202190
    bl func_ov041_02202a3c
    mov r0, r5
    bl func_ov041_02202a00
    mov r0, #0x28
    str r0, [r5, #0x930]
    mov r1, r8
    str r1, [r5, #0x934]
    mov r0, #0x4
    str r0, [r5, #0x920]
    str r1, [r5, #0x940]
    mov r0, #0x1
    str r0, [r5, #0x91c]
    b .L_02202190
.L_02202120:
    mov r8, #0x1
    mov r0, #0x1cc
    mov r11, r8
    str r0, [r4, #0x0]
    cmp r7, #0x0
    ble .L_02202190
    mov r0, #0x80000
    str r0, [r5, #0x4b0]
    ldr r0, [r5, #0x70]
    sub r0, r0, #0x50000
    str r0, [r5, #0x4b4]
    ldr r0, [r5, #0x91c]
    add r0, r0, #0x1
    str r0, [r5, #0x91c]
    b .L_02202190
.L_0220215c:
    mov r0, #0x8000
    rsb r0, r0, #0x0
    mov r8, #0x1
    mov r1, #0x1cc
    mov r11, r8
    str r1, [r4, #0x0]
    cmp r6, r0
    ble .L_02202190
    cmp r6, #0x8000
    movlt r0, #0x5
    strlt r0, [r5, #0x91c]
    movlt r0, #0xcd
    strlt r0, [r5, #0x928]
.L_02202190:
    cmp r8, #0x0
    beq .L_022021b8
    mov r0, r6
    mov r1, r7
    bl func_020ae024
    cmp r0, #0x0
    ldr r1, [r5, #0x4b8]
    addlt r0, r0, #0x10000
    sub r0, r0, r1
    str r0, [r10, #0x0]
.L_022021b8:
    cmp r11, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    ldr r0, [r5, #0x930]
    ldr r1, .L_0220221c
    add r0, r0, #0x258
    str r0, [r5, #0x930]
    cmp r0, #0x10000
    movgt r0, #0x10000
    strgt r0, [r5, #0x930]
    ldr r0, [r5, #0x930]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r0, r0, lsl #0x1
    add r0, r0, #0x1
    mov r0, r0, lsl #0x1
    ldrsh r0, [r1, r0]
    rsb r0, r0, #0x1000
    mov r0, r0, asr #0x1
    str r0, [r5, #0x940]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0220220c: .word 0x15e
.L_02202210: .word gSoundContext
.L_02202214: .word 0x12d
.L_02202218: .word 0x1c2
.L_0220221c: .word gFx32CosSinTable

    .size func_ov041_02201e98, . - func_ov041_02201e98


.text

/* Exact fallback for the documented portable C implementation in
 * src/overlays/ov041/overlay041_scene_object_update.c. */
.extern Sound_Play
.extern data_ov041_02204c28
.extern data_ov041_02204c38
.extern data_ov041_02204ca0
.extern data_ov041_02204ccc
.extern data_ov041_02204d00
.extern VecFx32Object_Init
.extern VecFx32Object_Destroy
.extern func_0205940c
.extern GraphicsSpriteState_SetAnimationIndex
.extern func_020a29ac
.extern func_020bf1f8
.extern func_ov041_021fd000
.extern func_ov041_021ff5a8
.extern func_ov041_021ff658
.extern gSoundContext
.extern genrand_int32

    .global func_ov041_021ff868
func_ov041_021ff868: ; 0x021ff868
    stmdb sp!, {r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x7c
    mov r10, r0
    ldr r1, [r10, #0x48]
    ldr r0, [r1, #0x1f4]
    cmp r0, #0x0
    cmpne r0, #0x2
    bne .L_021ffcb4
    ldr r1, [r1, #0x8]
    mvn r0, #0x0
    ldr r1, [r1, #0x120]
    cmp r1, r0
    ble .L_021ff8e8
    ldr r0, [r10, #0x90]
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x0
    bne .L_021ff8e8
    ldr r0, [r10, #0x80]
    mov r2, r1, lsl #0x1
    ldrsh r0, [r0, r2]
    sub r0, r0, #0x2
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    cmp r0, #0x1
    bhi .L_021ff8e8
    ldr r1, [r10, #0x8c]
    ldrsh r0, [r1, r2]
    cmp r0, #0x0
    movlt r0, #0x1
    strlth r0, [r1, r2]
.L_021ff8e8:
    ldr r0, [r10, #0x48]
    ldr r7, .L_021fff64
    ldr r0, [r0, #0x14]
    ldr r6, [r10, #0x1ac]
    ldr r5, [r0, #0x15c]
    add r4, sp, #0x10
    ldmia r7!, {r0, r1, r2, r3}
    stmia r4!, {r0, r1, r2, r3}
    ldmia r7, {r0, r1, r2, r3}
    stmia r4, {r0, r1, r2, r3}
    ldr r7, .L_021fff68
    add r4, sp, #0x0
    ldmia r7, {r0, r1, r2, r3}
    stmia r4, {r0, r1, r2, r3}
    b .L_021ffc44
.L_021ff924:
    ldr r0, [r10, #0x80]
    mov r4, r6, lsl #0x1
    ldrsh r3, [r0, r4]
    mvn r1, #0x0
    cmp r3, r1
    ble .L_021ffb28
    ldr r0, [r10, #0x90]
    ldr r2, [r0, r6, lsl #0x2]
    cmp r2, #0x0
    ble .L_021ff97c
    ldr r1, [r10, #0x84]
    mov r0, #0xc
    mla r1, r6, r0, r1
    ldr r0, [r1, #0x8]
    add r0, r0, r2
    str r0, [r1, #0x8]
    ldr r1, [r10, #0x90]
    ldr r0, [r1, r6, lsl #0x2]
    add r0, r0, #0x9a
    add r0, r0, #0x100
    str r0, [r1, r6, lsl #0x2]
    b .L_021ffb04
.L_021ff97c:
    sub r0, r3, #0x2
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    cmp r0, #0x1
    bhi .L_021ffb04
    ldr r3, [r10, #0x8c]
    ldrsh r2, [r3, r4]
    cmp r2, #0x0
    ble .L_021ffa7c
    add r0, r2, #0x1
    add r8, sp, #0x10
    strh r0, [r3, r4]
    add r7, sp, #0x5c
    ldmia r8!, {r0, r1, r2, r3}
    stmia r7!, {r0, r1, r2, r3}
    ldmia r8, {r0, r1, r2, r3}
    stmia r7, {r0, r1, r2, r3}
    ldr r0, [r10, #0x8c]
    ldrsh r2, [r0, r4]
    add r0, r2, r2, lsr #0x1f
    mov r0, r0, asr #0x1
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1e
    add r4, r1, r0, ror #0x1e
    mov r0, #0xc
    mul r3, r6, r0
    cmp r2, #0x23
    ldr r0, [r10, #0x88]
    addgt r4, r4, #0x4
    add r2, r0, r3
    add r1, sp, #0x5c
    ldr r0, [r10, #0x84]
    ldr r2, [r2, #0x4]
    ldr r1, [r1, r4, lsl #0x2]
    add r0, r0, r3
    add r1, r2, r1
    str r1, [r0, #0x4]
    ldr r1, [r10, #0x8c]
    mov r0, r6, lsl #0x1
    ldrsh r0, [r1, r0]
    and r0, r0, #0x7
    cmp r0, #0x4
    bne .L_021ffa44
    ldr r0, .L_021fff6c
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x10
    bl Sound_Play
.L_021ffa44:
    ldr r1, [r10, #0x8c]
    mov r0, r6, lsl #0x1
    ldrsh r0, [r1, r0]
    cmp r0, #0x46
    ble .L_021ffb04
    ldr r1, [r10, #0x90]
    mov r2, #0x1000
    ldr r0, .L_021fff6c
    str r2, [r1, r6, lsl #0x2]
    ldr r0, [r0, #0x0]
    ldr r1, .L_021fff70
    mov r2, #0x5
    bl func_0205940c
    b .L_021ffb04
.L_021ffa7c:
    sub r0, r1, #0x59
    cmp r2, r0
    movlt r0, #0x0
    strlth r0, [r3, r4]
    ldr r3, [r10, #0x8c]
    mov r2, r6, lsl #0x1
    ldrsh r1, [r3, r2]
    mvn r0, #0x3b
    sub r1, r1, #0x1
    strh r1, [r3, r2]
    ldr r1, [r10, #0x8c]
    ldrsh r8, [r1, r2]
    cmp r8, r0
    bge .L_021ffb04
    add r0, sp, #0x0
    mov r7, #0xc
    add r4, sp, #0x4c
    ldmia r0, {r0, r1, r2, r3}
    stmia r4, {r0, r1, r2, r3}
    add r0, r8, r8, lsr #0x1f
    mov r0, r0, asr #0x1
    rsb r0, r0, #0x0
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1e
    add r1, r1, r0, ror #0x1e
    mul r3, r6, r7
    ldr r2, [r10, #0x88]
    ldr r0, [r10, #0x84]
    add r2, r2, r3
    ldr r2, [r2, #0x4]
    ldr r1, [r4, r1, lsl #0x2]
    add r0, r0, r3
    add r1, r2, r1
    str r1, [r0, #0x4]
.L_021ffb04:
    ldr r1, [r10, #0x84]
    mov r0, #0xc
    mla r0, r6, r0, r1
    ldr r0, [r0, #0x8]
    cmp r0, r5
    ble .L_021ffb28
    mov r0, r10
    mov r1, r6
    bl func_ov041_021ff658
.L_021ffb28:
    ldr r1, [r10, #0x80]
    mov r0, r6, lsl #0x1
    ldrsh r1, [r1, r0]
    mvn r0, #0x0
    cmp r1, r0
    ble .L_021ffc44
    ldr r1, [r10, #0x84]
    mov r0, #0xc
    mla r2, r6, r0, r1
    ldr r1, [r10, #0x48]
    mov r0, #0xd2000
    ldr r2, [r2, #0x8]
    ldr r1, [r1, #0x194]
    rsb r0, r0, #0x0
    sub r1, r2, r1
    cmp r1, r0
    blt .L_021ffb74
    cmp r1, #0xd2000
    ble .L_021ffb7c
.L_021ffb74:
    mov r2, #0x0
    b .L_021ffb80
.L_021ffb7c:
    mov r2, #0x1
.L_021ffb80:
    ldr r7, [r10, #0x98]
    mov r0, r6, lsl #0x1
    ldrsh r1, [r7, r0]
    cmp r1, #0x0
    bge .L_021ffbfc
    cmp r2, #0x0
    beq .L_021ffc44
    mov r0, #0xc
    sub r1, r0, #0x1
.L_021ffba4:
    add r3, r10, r1, lsl #0x2
    ldr r0, [r3, #0x4c]
    ldrh r0, [r0, #0x42]
    tst r0, #0x4
    beq .L_021ffbf0
    mov r4, r6, lsl #0x1
    strh r1, [r7, r4]
    ldr r2, [r3, #0x4c]
    ldr r1, .L_021fff74
    ldrh r0, [r2, #0x42]
    bic r0, r0, #0x4
    strh r0, [r2, #0x42]
    ldr r0, [r10, #0x80]
    ldr r3, [r3, #0x4c]
    ldrsh r2, [r0, r4]
    ldr r0, [r3, #0xc]
    ldrb r1, [r1, r2]
    bl GraphicsSpriteState_SetAnimationIndex
    b .L_021ffc44
.L_021ffbf0:
    subs r1, r1, #0x1
    bpl .L_021ffba4
    b .L_021ffc44
.L_021ffbfc:
    cmp r2, #0x0
    bne .L_021ffc44
    add r1, r10, r1, lsl #0x2
    ldr r3, [r1, #0x4c]
    mvn r2, #0x0
    ldrh r1, [r3, #0x42]
    orr r1, r1, #0x4
    strh r1, [r3, #0x42]
    ldr r1, [r10, #0x98]
    ldrsh r1, [r1, r0]
    add r1, r10, r1, lsl #0x2
    ldr r1, [r1, #0x4c]
    ldr r3, [r1, #0xc]
    ldrh r1, [r3, #0x24]
    orr r1, r1, #0x4
    strh r1, [r3, #0x24]
    ldr r1, [r10, #0x98]
    strh r2, [r1, r0]
.L_021ffc44:
    subs r6, r6, #0x1
    bpl .L_021ff924
    ldr r0, [r10, #0x1ac]
    mov r1, #0xc
    b .L_021ffca8
.L_021ffc58:
    ldr r2, [r10, #0x80]
    mov r3, r0, lsl #0x1
    ldrsh r2, [r2, r3]
    cmp r2, #0x0
    ldrge r2, [r10, #0x98]
    ldrgesh r3, [r2, r3]
    cmpge r3, #0x0
    blt .L_021ffca8
    mul r5, r0, r1
    ldr r2, [r10, #0x84]
    add r4, r10, r3, lsl #0x2
    add r2, r2, r5
    ldr r3, [r2, #0x4]
    ldr r2, [r4, #0x4c]
    str r3, [r2, #0x30]
    ldr r3, [r10, #0x84]
    ldr r2, [r4, #0x4c]
    add r3, r3, r5
    ldr r3, [r3, #0x8]
    str r3, [r2, #0x34]
.L_021ffca8:
    subs r0, r0, #0x1
    bpl .L_021ffc58
    b .L_021fff5c
.L_021ffcb4:
    ldr r0, [r1, #0x8]
    add r0, r0, #0x100
    ldrh r0, [r0, #0x40]
    cmp r0, #0x2
    movhi r0, #0x1
    movls r0, #0x0
    cmp r0, #0x0
    beq .L_021fff5c
    ldr r2, [r10, #0x7c]
    ldrh r0, [r2, #0x42]
    tst r0, #0x4
    bne .L_021ffd1c
    ldr r1, [r2, #0x34]
    mov r0, #0xc8000
    add r1, r1, #0x2000
    str r1, [r2, #0x34]
    ldr r3, [r10, #0x7c]
    ldr r1, [r10, #0x48]
    ldr r2, [r3, #0x34]
    ldr r1, [r1, #0x194]
    rsb r0, r0, #0x0
    sub r1, r2, r1
    cmp r1, r0
    ldrlth r0, [r3, #0x42]
    orrlt r0, r0, #0x4
    strlth r0, [r3, #0x42]
.L_021ffd1c:
    ldr r0, [r10, #0x1b8]
    cmp r0, #0x0
    blt .L_021ffe68
    ldr r1, [r10, #0x48]
    ldr r0, [r10, #0xa8]
    ldr r1, [r1, #0x194]
    cmp r1, r0
    ble .L_021ffe68
    ldr r0, [r10, #0x1b0]
    subs r0, r0, #0x1
    str r0, [r10, #0x1b0]
    ldr r0, [r10, #0x1b4]
    bmi .L_021ffdd4
    cmp r0, #0x0
    beq .L_021ffe24
    add r0, sp, #0x3c
    bl VecFx32Object_Init
    ldr r1, [r10, #0xa4]
    mov r0, #0x0
    str r1, [sp, #0x40]
    ldr r1, [r10, #0xa8]
    add r2, sp, #0x3c
    add r1, r1, #0xd2000
    str r0, [sp, #0x48]
    str r1, [sp, #0x44]
    ldr r1, [r10, #0x1a4]
    mov r0, r10
    add r1, r10, r1, lsl #0x2
    ldr r1, [r1, #0xac]
    bl func_ov041_021ff5a8
    mov r4, r0
    bl genrand_int32
    mov r1, #0x9
    bl func_020bf1f8
    sub r1, r1, #0x4
    mov r0, #0x8c
    mul r2, r1, r0
    ldr r1, [r10, #0x8c]
    mov r0, r4, lsl #0x1
    strh r2, [r1, r0]
    ldr r1, [r10, #0x1a4]
    add r0, sp, #0x3c
    add r1, r1, #0x1
    str r1, [r10, #0x1a4]
    bl VecFx32Object_Destroy
    b .L_021ffe24
.L_021ffdd4:
    cmp r0, #0x1
    ldr r2, [r10, #0x1b8]
    bne .L_021ffe10
    ldr r0, .L_021fff78
    mov r1, #0x0
    ldr r0, [r0, r2, lsl #0x2]
    str r0, [r10, #0x1b0]
    str r1, [r10, #0x1b4]
    ldr r0, [r10, #0x1b8]
    add r0, r0, #0x1
    str r0, [r10, #0x1b8]
    cmp r0, #0xb
    subhs r0, r1, #0x1
    strhs r0, [r10, #0x1b8]
    b .L_021ffe24
.L_021ffe10:
    ldr r1, .L_021fff7c
    mov r0, #0x1
    ldr r1, [r1, r2, lsl #0x2]
    str r1, [r10, #0x1b0]
    str r0, [r10, #0x1b4]
.L_021ffe24:
    bl genrand_int32
    mov r1, #0xd
    bl func_020bf1f8
    ldr r2, [r10, #0xa4]
    sub r0, r1, #0x6
    add r0, r2, r0, lsl #0x10
    str r0, [r10, #0xa4]
    cmp r0, #0x10000
    rsblt r0, r0, #0x20000
    strlt r0, [r10, #0xa4]
    ldr r0, [r10, #0xa4]
    cmp r0, #0xf0000
    rsbgt r0, r0, #0x1e0000
    strgt r0, [r10, #0xa4]
    ldr r0, [r10, #0xa8]
    add r0, r0, #0x64000
    str r0, [r10, #0xa8]
.L_021ffe68:
    mov r4, #0xd2000
    mov r5, #0xc
    ldr r9, [r10, #0x1ac]
    rsb r4, r4, #0x0
    add r11, sp, #0x30
    mvn r7, #0x0
    mov r6, r5
    b .L_021fff54
.L_021ffe88:
    ldr r1, [r10, #0x80]
    mov r0, r9, lsl #0x1
    ldrsh r0, [r1, r0]
    cmp r0, r7
    ble .L_021fff54
    mul r8, r9, r6
    bl genrand_int32
    ldr r1, [r10, #0x84]
    and r0, r0, #0x2000
    add r2, r1, r8
    ldr r1, [r2, #0x8]
    add r0, r0, #0x3000
    add r0, r1, r0
    str r0, [r2, #0x8]
    ldr r1, [r10, #0x94]
    mov r0, r9, lsl #0x1
    ldr r2, [r10, #0x8c]
    ldrh r3, [r1, r0]
    ldrh r2, [r2, r0]
    add r2, r3, r2
    strh r2, [r1, r0]
    ldr r0, [r10, #0x1a8]
    tst r0, #0x7
    bne .L_021fff2c
    mov r0, r11
    bl func_ov041_021fd000
    mul r0, r9, r5
    ldr r2, [r10, #0x84]
    mov r1, #0x0
    add r2, r2, r0
    ldr r2, [r2, #0x4]
    str r2, [sp, #0x34]
    ldr r3, [r10, #0x84]
    mov r2, r2, asr #0xc
    add r0, r3, r0
    ldr r0, [r0, #0x8]
    str r0, [sp, #0x38]
    mov r3, r0, asr #0xc
    ldr r0, [r10, #0x48]
    ldr r0, [r0, #0x18]
    bl func_020a29ac
.L_021fff2c:
    ldr r1, [r10, #0x84]
    ldr r0, [r10, #0x48]
    add r1, r1, r8
    ldr r1, [r1, #0x8]
    ldr r0, [r0, #0x194]
    sub r0, r1, r0
    cmp r0, r4
    ldrlt r1, [r10, #0x80]
    movlt r0, r9, lsl #0x1
    strlth r7, [r1, r0]
.L_021fff54:
    subs r9, r9, #0x1
    bpl .L_021ffe88
.L_021fff5c:
    add sp, sp, #0x7c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_021fff64: .word data_ov041_02204c38
.L_021fff68: .word data_ov041_02204c28
.L_021fff6c: .word gSoundContext
.L_021fff70: .word 0x12d
.L_021fff74: .word data_ov041_02204d00
.L_021fff78: .word data_ov041_02204ccc
.L_021fff7c: .word data_ov041_02204ca0
    .size func_ov041_021ff868, . - func_ov041_021ff868


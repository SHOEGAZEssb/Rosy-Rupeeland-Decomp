; Matching retail form; see src/game/rising_sprite_motion_controller.c.
.text
.extern func_02005058
.extern VecFx32Bezier_Evaluate3D
.extern func_020066a4
.extern func_0200964c
.extern func_020096f0
.extern func_020206e8
.extern func_02056f00
.extern gSystemState

.global func_0202057c
    .type func_0202057c, @function
func_0202057c: ; 0x0202057c
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x3c
    mov r5, r0
    ldr r0, [r5, #0x8]
    mov r4, r1
    cmp r0, #0x0
    beq .L_020205ac
    cmp r0, #0x1
    beq .L_020205ec
    cmp r0, #0x2
    beq .L_020205d0
    b .L_020205ec
.L_020205ac:
    ldr r1, [r5, #0x5c]
    add r0, r5, #0x4c
    add r1, r1, #0x22
    str r1, [r5, #0x5c]
    bl func_020206e8
    ldr r0, [r5, #0x18]
    add r0, r0, #0x1
    str r0, [r5, #0x18]
    b .L_020205ec
.L_020205d0:
    ldr r0, [r5, #0x5c]
    subs r0, r0, #0x22
    str r0, [r5, #0x5c]
    movmi r0, #0x1
    bmi .L_020206dc
    add r0, r5, #0x4c
    bl func_020206e8
.L_020205ec:
    ldr r0, .L_020206e4
    ldr r6, [r5, #0x50]
    ldr r1, [r0, #0x64]
    add r0, r5, #0xc
    mov r2, #0x0
    bl func_020096f0
    add r0, r6, r0
    mov r6, r0, asr #0xc
    cmp r6, #0x2
    movle r6, #0x2
    rsb r1, r6, #0x0
    add r0, sp, #0x30
    mov r1, r1, lsl #0x6
    mov r2, r6, lsl #0x6
    mov r3, #0xc8
    bl func_0200964c
    ldr r2, [r5, #0x5c]
    add r0, sp, #0x10
    add r1, r5, #0x1c
    bl VecFx32Bezier_Evaluate3D
    add r0, sp, #0x0
    add r1, sp, #0x10
    mov r2, r4
    bl func_020066a4
    add r0, sp, #0x20
    add r1, sp, #0x0
    bl func_02056f00
    add r0, sp, #0x0
    bl func_02005058
    add r0, sp, #0x10
    bl func_02005058
    ldr r1, .L_020206e4
    ldr r3, [r5, #0x60]
    ldr r1, [r1, #0x64]
    add r0, sp, #0x30
    mov r2, #0x0
    add r1, r1, r3
    bl func_020096f0
    ldr r3, [sp, #0x24]
    ldr r2, [sp, #0x28]
    add r0, r3, r0
    str r0, [sp, #0x24]
    mov r4, r2, asr #0xc
    mov r2, r0, asr #0xc
    ldr r3, [r5, #0x0]
    add r1, r6, #0x20
    strh r2, [r3, #0x2c]
    strh r4, [r3, #0x2e]
    ldr r3, [r5, #0x0]
    mov r1, r1, lsl #0x10
    ldrh r2, [r3, #0x24]
    mov r1, r1, asr #0x10
    add r0, sp, #0x20
    bic r2, r2, #0x4
    strh r2, [r3, #0x24]
    ldr r2, [r5, #0x0]
    strh r1, [r2, #0x32]
    strh r1, [r2, #0x34]
    bl func_02005058
    mov r0, #0x0
.L_020206dc:
    add sp, sp, #0x3c
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_020206e4: .word gSystemState
    .size func_0202057c, .-func_0202057c

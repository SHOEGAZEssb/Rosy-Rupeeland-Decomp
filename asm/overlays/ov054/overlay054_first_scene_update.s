.text
; Matching fallback for the portable implementation in src/overlays/ov054/overlay054_recovery.c.
.extern GameWork_TestFlag
.extern data_020c9670
.extern VecFx32Object_InitComponents
.extern VecFx32Object_Destroy
.extern func_020afd0c
.extern func_ov054_0220e560
.extern func_ov054_0220e96c
.extern func_ov054_0220e994
.extern func_ov054_0220ea34
.extern gGameWork
.extern gSystemState

.global func_ov054_0220e75c
func_ov054_0220e75c:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x20
    mov r4, r0
    ldr r0, [r4, #0x1b4]
    cmp r0, #0x0
    beq .L_0220e780
    cmp r0, #0x1
    beq .L_0220e7fc
    b .L_0220e948
.L_0220e780:
    ldr r0, .L_0220e954
    ldr r1, .L_0220e958
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq .L_0220e948
    mov r0, r4
    bl func_ov054_0220ea34
    mov r0, #0x1d
    mov r1, #0x0
    bl func_ov054_0220e96c
    mov r0, #0x1f
    mov r1, #0x1
    bl func_ov054_0220e994
    mov r2, #0x4000000
    ldr r1, [r2, #0x0]
    mov r0, #0x0
    bic r1, r1, #0xe000
    orr r1, r1, #0x2000
    str r1, [r2, #0x0]
    strh r0, [r2, #0x40]
    mov r0, #0xc0
    strh r0, [r2, #0x44]
    ldr r0, [r4, #0x4]
    orr r1, r0, #0x2
    bic r0, r1, #0x1
    orr r0, r0, #0x1
    str r0, [r4, #0x4]
    ldr r0, [r4, #0x1b4]
    add r0, r0, #0x1
    str r0, [r4, #0x1b4]
.L_0220e7fc:
    ldr r0, [r4, #0x8]
    ldr r1, .L_0220e954
    ldr r2, [r0, #0x4]
    ldr r0, [r1, #0x0]
    mov r2, r2, asr #0xc
    add r0, r0, #0x100
    strh r2, [r0, #0x98]
    ldr r2, [r4, #0x8]
    ldr r0, [r1, #0x0]
    ldr r2, [r2, #0x8]
    add r0, r0, #0x100
    mov r2, r2, asr #0xc
    strh r2, [r0, #0x9a]
    ldr r0, [r1, #0x0]
    ldr r2, [r4, #0x8]
    add r0, r0, #0x100
    ldr r1, [r2, #0xc]
    mov r3, #0x1000
    mov r1, r1, asr #0xc
    strh r1, [r0, #0x9c]
    ldr ip, [r4, #0x8]
    ldr r0, [r4, #0xc]
    ldr lr, [ip, #0x4]
    ldr r2, [r0, #0x4]
    ldr r1, [ip, #0x8]
    ldr r0, [r0, #0x8]
    sub lr, lr, r2
    sub r2, r1, r0
    rsb r3, r3, #0x0
    ldr ip, [ip, #0xc]
    add r0, sp, #0x4
    and r1, lr, r3
    and r2, r2, r3
    and r3, ip, r3
    bl VecFx32Object_InitComponents
    add r2, sp, #0x4
    mov r0, r4
    add r1, r4, #0x14
    bl func_ov054_0220e560
    add r0, sp, #0x4
    bl VecFx32Object_Destroy
    ldr r1, .L_0220e95c
    ldr r0, .L_0220e960
    ldr r2, [r1, #0x64]
    mvns r3, #0xcc
    mul r2, r0, r2
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    mov r2, r2, asr #0x4
    str r3, [sp, #0x14]
    rsbmi r3, r3, #0x0
    add r1, r3, #0x1000
    mov r2, r2, lsl #0x1
    add r3, r2, #0x1
    str r0, [sp, #0x1c]
    ldr r2, .L_0220e964
    mov r3, r3, lsl #0x1
    ldrsh ip, [r2, r3]
    ldr r3, [sp, #0x14]
    ldr r2, .L_0220e954
    smull lr, r3, ip, r3
    adds ip, lr, #0x800
    adc r3, r3, #0x0
    mov ip, ip, lsr #0xc
    orr ip, ip, r3, lsl #0x14
    add r3, r1, ip
    str r3, [r4, #0x1a4]
    ldr r2, [r2, #0x0]
    str r1, [sp, #0x18]
    add r1, r2, #0x100
    ldrsh r3, [r1, #0x9e]
    mov r0, #0x0
    cmp r3, #0x10
    movgt r3, #0x10
    bgt .L_0220e930
    cmp r3, #0x0
    movlt r3, r0
.L_0220e930:
    ldr r0, .L_0220e968
    rsb r4, r3, #0x10
    mov r1, #0x2
    mov r2, #0x1f
    str r4, [sp, #0x0]
    bl func_020afd0c
.L_0220e948:
    mov r0, #0x0
    add sp, sp, #0x20
    ldmia sp!, {r4, pc}
.L_0220e954: .word gGameWork
.L_0220e958: .word 0x40a
.L_0220e95c: .word gSystemState
.L_0220e960: .word 0x222
.L_0220e964: .word data_020c9670
.L_0220e968: .word 0x4000050
.size func_ov054_0220e75c, . - func_ov054_0220e75c

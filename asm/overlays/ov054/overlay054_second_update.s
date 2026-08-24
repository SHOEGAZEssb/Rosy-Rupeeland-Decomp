.text
; Matching fallback for the portable implementation in src/overlays/ov054/overlay054_recovery.c.
.extern GameWork_ClearFlag
.extern GameWork_TestFlag
.extern data_020c9670
.extern gGamePhaseRuntime
.extern VecFx32Object_Init
.extern VecFx32Object_Destroy
.extern VecFx32Object_Add
.extern GamePhaseState_GetConfiguration
.extern func_ov054_0220ec4c
.extern gGameWork

.global func_ov054_0220eda4
func_ov054_0220eda4:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x20
    ldr r1, .L_0220ef64
    mov r5, r0
    ldr r0, [r1, #0x0]
    add r0, r0, #0x24
    bl GamePhaseState_GetConfiguration
    ldr r0, [r0, #0x40]
    mov r0, r0, lsl #0xc
    mov r0, r0, lsr #0x1e
    cmp r0, #0x2
    movne r0, #0x0
    bne .L_0220ef5c
    ldr r0, .L_0220ef68
    ldr r1, .L_0220ef6c
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq .L_0220ee08
    ldr r0, .L_0220ef68
    ldr r1, .L_0220ef6c
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    mov r0, #0x1
    b .L_0220ef5c
.L_0220ee08:
    ldr r3, .L_0220ef68
    add r0, r5, #0x30
    ldr r2, [r3, #0x0]
    add r1, r5, #0x8
    add r2, r2, #0x100
    ldrsh r2, [r2, #0xa0]
    mov r2, r2, lsl #0xc
    str r2, [r5, #0xc]
    ldr r2, [r3, #0x0]
    add r2, r2, #0x100
    ldrsh r3, [r2, #0xa2]
    ldrsh r2, [r2, #0xa4]
    sub r2, r3, r2
    mov r2, r2, lsl #0xc
    str r2, [r5, #0x10]
    bl func_ov054_0220ec4c
    ldr r1, .L_0220ef68
    mov r6, r0
    ldr r1, [r1, #0x0]
    add r0, sp, #0x10
    add r1, r1, #0x100
    ldrsh r4, [r1, #0x96]
    bl VecFx32Object_Init
    mov r0, r6, asr #0x4
    mov r3, r0, lsl #0x1
    add r0, r3, #0x1
    mov r1, r0, lsl #0x1
    ldr r2, .L_0220ef70
    mov r0, r3, lsl #0x1
    ldrsh r1, [r2, r1]
    ldrsh r0, [r2, r0]
    mov r2, #0x0
    smull r3, r6, r1, r4
    adds ip, r3, #0x800
    smull r3, r1, r0, r4
    adc r0, r6, #0x0
    adds r3, r3, #0x800
    mov r4, ip, lsr #0xc
    orr r4, r4, r0, lsl #0x14
    adc r0, r1, #0x0
    mov r3, r3, lsr #0xc
    orr r3, r3, r0, lsl #0x14
    add r1, sp, #0x10
    add r0, r5, #0x40
    str r4, [sp, #0x14]
    str r3, [sp, #0x18]
    str r2, [sp, #0x1c]
    bl VecFx32Object_Add
    add r0, sp, #0x0
    bl VecFx32Object_Init
    ldr r0, [r5, #0x44]
    ldr r2, .L_0220ef74
    rsb r1, r0, #0x0
    umull r0, r4, r1, r2
    mov r3, #0x0
    adds r0, r0, #0x800
    mov r6, r0, lsr #0xc
    mla r4, r1, r3, r4
    mov r0, r1, asr #0x1f
    mla r4, r0, r2, r4
    adc r0, r4, #0x0
    orr r6, r6, r0, lsl #0x14
    str r6, [sp, #0x4]
    ldr r1, [r5, #0x48]
    add r0, r5, #0x40
    rsb ip, r1, #0x0
    umull r6, lr, ip, r2
    mla lr, ip, r3, lr
    mov r4, ip, asr #0x1f
    adds r3, r6, #0x800
    mla lr, r4, r2, lr
    adc r2, lr, #0x0
    mov r3, r3, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    add r1, sp, #0x0
    str r3, [sp, #0x8]
    bl VecFx32Object_Add
    add r0, r5, #0x30
    add r1, r5, #0x40
    bl VecFx32Object_Add
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
    add r0, sp, #0x10
    bl VecFx32Object_Destroy
    mov r0, #0x0
.L_0220ef5c:
    add sp, sp, #0x20
    ldmia sp!, {r4, r5, r6, pc}
.L_0220ef64: .word gGamePhaseRuntime
.L_0220ef68: .word gGameWork
.L_0220ef6c: .word 0x40d
.L_0220ef70: .word data_020c9670
.L_0220ef74: .word 0x333
.size func_ov054_0220eda4, . - func_ov054_0220eda4

.text

/* Exact fallback; see src/overlays/ov035/overlay035_particle.c for documented portable C. */

    .extern func_020b0880
    .extern func_020b0844
    .extern func_020b0808
    .extern gFx32CosSinTable


    .global func_ov035_021fda24
func_ov035_021fda24: 
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r5, r0
    ldr r0, [r5, #0x40]
    ldr r6, [r5, #0x50]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r1, r0, lsl #0x1
    ldr r4, [r5, #0x60]
    add r0, r1, #0x1
    ldr r2, L_021fdb44
    mov r3, #0x0
    str r3, [r2, #0x0]
    mov r3, r6, lsl #0x10
    mov r4, r4, lsl #0x10
    ldr ip, L_021fdb48
    mov lr, r1, lsl #0x1
    mov r1, r0, lsl #0x1
    ldr r8, [r5, #0x30]
    ldr r7, [r5, #0x20]
    ldr r6, [r5, #0x10]
    ldrsh r0, [ip, lr]
    str r6, [r2, #0x2c]
    str r7, [r2, #0x2c]
    ldrsh r1, [ip, r1]
    mov r6, r3, lsr #0x10
    str r8, [r2, #0x2c]
    mov r4, r4, lsr #0x10
    bl func_020b0880
    mov r0, r6, asr #0x4
    mov r1, r0, lsl #0x1
    add r0, r1, #0x1
    ldr r2, L_021fdb48
    mov r3, r1, lsl #0x1
    mov r1, r0, lsl #0x1
    ldrsh r0, [r2, r3]
    ldrsh r1, [r2, r1]
    bl func_020b0844
    mov r0, r4, asr #0x4
    mov r1, r0, lsl #0x1
    add r0, r1, #0x1
    ldr r2, L_021fdb48
    mov r3, r1, lsl #0x1
    mov r1, r0, lsl #0x1
    ldrsh r0, [r2, r3]
    ldrsh r1, [r2, r1]
    bl func_020b0808
    mov r3, #0x6
    ldr ip, L_021fdb4c
    mov r0, #0x10000
    str r0, [ip, #0x0]
    str r0, [ip, #0x0]
    str r0, [ip, #0x0]
    mov r4, #0x1
    str r4, [ip, #0x94]
    ldrh r2, [r5, #0xa4]
    mov r1, #0x8
    rsb r0, r3, #0x90000
    str r2, [ip, #0x14]
    str r3, [ip, #0x20]
    str r1, [ip, #0x20]
    str r0, [ip, #0x2c]
    ldrh r2, [r5, #0xa6]
    ldr r1, L_021fdb50
    sub r0, r3, #0x80000
    str r2, [ip, #0x14]
    str r1, [ip, #0x2c]
    str r0, [ip, #0x2c]
    mov r0, #0x0
    str r0, [ip, #0x98]
    str r4, [ip, #-0x24]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
L_021fdb44: .word 0x4000444
L_021fdb48: .word gFx32CosSinTable
L_021fdb4c: .word 0x400046c
L_021fdb50: .word 0xfff8fffa
.size func_ov035_021fda24, .-func_ov035_021fda24


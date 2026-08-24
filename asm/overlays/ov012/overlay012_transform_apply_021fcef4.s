    .text
    .extern gFx32CosSinTable
    .extern func_020b0880
    .extern func_020b0844
    .extern func_020b0808
/* Exact expression-order fallback; see src/overlays/ov012/overlay012_transform_apply.c. */
    .global func_ov012_021fcef4
func_ov012_021fcef4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr ip, [r4, #0x10]
    ldr r3, [r4, #0xc]
    ldr r1, [r4, #8]
    ldr r0, L_021fcfc8
    ldr r2, L_021fcfcc
    str r1, [r0]
    str r3, [r0]
    str ip, [r0]
    ldr r0, [r4, #0x20]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #4
    mov r1, r0, lsl #1
    add r0, r1, #1
    mov r3, r1, lsl #1
    mov r1, r0, lsl #1
    ldrsh r0, [r2, r3]
    ldrsh r1, [r2, r1]
    bl func_020b0880
    ldr r0, [r4, #0x24]
    ldr r2, L_021fcfcc
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #4
    mov r1, r0, lsl #1
    add r0, r1, #1
    mov r3, r1, lsl #1
    mov r1, r0, lsl #1
    ldrsh r0, [r2, r3]
    ldrsh r1, [r2, r1]
    bl func_020b0844
    ldr r0, [r4, #0x28]
    ldr r2, L_021fcfcc
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #4
    mov r1, r0, lsl #1
    add r0, r1, #1
    mov r3, r1, lsl #1
    mov r1, r0, lsl #1
    ldrsh r0, [r2, r3]
    ldrsh r1, [r2, r1]
    bl func_020b0808
    ldr r3, [r4, #0x1c]
    ldr r2, [r4, #0x18]
    ldr r1, [r4, #0x14]
    ldr r0, L_021fcfd0
    str r1, [r0]
    str r2, [r0]
    str r3, [r0]
    ldmia sp!, {r4, pc}
L_021fcfc8:
    .word 0x04000470
L_021fcfcc:
    .word gFx32CosSinTable
L_021fcfd0:
    .word 0x0400046c
    .size func_ov012_021fcef4, . - func_ov012_021fcef4

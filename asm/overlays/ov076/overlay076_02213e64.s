.text
; Matching fallback for the portable implementation in src/overlays/ov076/overlay076_recovery.c.
.extern data_020c9670
.extern func_02004fe0
.extern func_02005030
.extern func_02005058
.extern func_02005b50
.extern ActorExtendedType2_RunRenderCallback

.global func_ov076_02213e64
func_ov076_02213e64:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x34
    mov r7, r1
    ldr r3, [r7, #0x298]
    mov r6, r2
    ldr r3, [r3, #0x54]
    ldrb r4, [r3, #0x3a]
    bl ActorExtendedType2_RunRenderCallback
    add r1, r7, #0x200
    ldrh r3, [r1, #0xd0]
    ldr r2, .L_02214030
    add r0, sp, #0x24
    add r3, r3, #0x1000
    strh r3, [r1, #0xd0]
    ldrh r5, [r1, #0xd0]
    ldr r3, [r7, #0x54]
    add r1, r7, #0x2a8
    mov r5, r5, asr #0x4
    mov r5, r5, lsl #0x2
    ldrsh r5, [r2, r5]
    ldrsh r2, [r3, #0x2e]
    sub r2, r2, r5, asr #0xc
    strh r2, [r3, #0x2e]
    ldr r2, [r7, #0x54]
    strb r4, [r2, #0x3a]
    ldr r3, [r7, #0x298]
    ldr r2, [r7, #0x54]
    ldr r3, [r3, #0x54]
    ldrh r3, [r3, #0x28]
    sub r3, r3, #0x20
    strh r3, [r2, #0x28]
    bl func_02005030
    ldr r1, [sp, #0x30]
    mvn r0, #0x5f
    strh r0, [sp, #0xc]
    add r1, r1, r5
    add r0, r0, #0x10
    mov r2, #0x60
    str r1, [sp, #0x30]
    mov r1, #0x20
    strh r0, [sp, #0xe]
    strh r2, [sp, #0x10]
    ldr r0, [sp, #0x2c]
    strh r1, [sp, #0x12]
    str r0, [sp, #0x0]
    ldr r1, [sp, #0x30]
    mov r0, #0x8
    str r1, [sp, #0x4]
    str r0, [sp, #0x8]
    ldr r0, [r7, #0x2a0]
    ldr r3, [sp, #0x28]
    add r2, sp, #0xc
    mov r1, r6
    bl func_02005b50
    add r0, r7, #0x200
    ldrsh r2, [r0, #0xca]
    ldr r1, [r7, #0x2a0]
    add r0, sp, #0x14
    strh r2, [r1, #0x30]
    ldr r1, [r7, #0x2a0]
    strb r4, [r1, #0x3a]
    ldr r2, [r7, #0x54]
    ldr r1, [r7, #0x2a0]
    ldrh r2, [r2, #0x28]
    sub r2, r2, #0x30
    strh r2, [r1, #0x28]
    bl func_02004fe0
    add r0, r7, #0x200
    ldrh r0, [r0, #0xca]
    ldr r2, .L_02214030
    ldr r3, [sp, #0x28]
    mov r0, r0, asr #0x4
    mov r5, r0, lsl #0x1
    mov r0, r5, lsl #0x1
    ldrsh r1, [r2, r0]
    mov r0, #0x29
    smulbb r1, r1, r0
    sub r1, r3, r1
    str r1, [sp, #0x28]
    add r1, r5, #0x1
    mov r1, r1, lsl #0x1
    ldrsh r2, [r2, r1]
    ldr r3, [sp, #0x30]
    ldr r1, [sp, #0x2c]
    smlabb r0, r2, r0, r3
    str r0, [sp, #0x30]
    str r1, [sp, #0x0]
    ldr r1, [sp, #0x30]
    mov r0, #0x8
    str r1, [sp, #0x4]
    str r0, [sp, #0x8]
    ldr r0, [r7, #0x2a4]
    ldr r3, [sp, #0x28]
    add r2, sp, #0xc
    mov r1, r6
    bl func_02005b50
    add r0, r7, #0x200
    ldrsh r3, [r0, #0xca]
    ldrsh r2, [r0, #0xcc]
    ldr r1, [r7, #0x2a4]
    add r0, sp, #0x14
    add r2, r3, r2
    strh r2, [r1, #0x30]
    ldr r1, [r7, #0x2a4]
    strb r4, [r1, #0x3a]
    ldr r2, [r7, #0x54]
    ldr r1, [r7, #0x2a4]
    ldrh r2, [r2, #0x28]
    add r2, r2, #0xc
    strh r2, [r1, #0x28]
    bl func_02005058
    add r0, sp, #0x24
    bl func_02005058
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_02214030: .word data_020c9670
.size func_ov076_02213e64, . - func_ov076_02213e64

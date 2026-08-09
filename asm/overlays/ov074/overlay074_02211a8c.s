.text
; Matching fallback for the portable implementation in src/overlays/ov074/overlay074_recovery.c.
.extern data_ov074_02211d48
.extern func_020befec
.extern func_ov074_02211b28

.global func_ov074_02211a8c
func_ov074_02211a8c:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    ldr ip, .L_02211b24
    mov r4, r0
    str ip, [r4, #0x0]
    mov ip, #0x0
    str ip, [r4, #0x4]
    sub r0, r2, r1
    str ip, [r4, #0x8]
    str ip, [r4, #0xc]
    ldrh r5, [sp, #0x24]
    mov r2, r1, lsl #0xc
    str ip, [r4, #0x10]
    mov r1, r5
    mov r0, r0, lsl #0xc
    mov r6, r3
    str r2, [sp, #0x8]
    bl func_020befec
    str r0, [sp, #0xc]
    add r1, sp, #0x8
    add r0, r4, #0x4
    bl func_ov074_02211b28
    ldrsh r0, [sp, #0x20]
    mov r2, r6, lsl #0xc
    mov r1, r5
    sub r0, r0, r6
    mov r0, r0, lsl #0xc
    str r2, [sp, #0x0]
    bl func_020befec
    str r0, [sp, #0x4]
    add r1, sp, #0x0
    add r0, r4, #0xc
    bl func_ov074_02211b28
    mov r1, #0x0
    mov r0, r4
    str r1, [r4, #0x14]
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
.L_02211b24: .word data_ov074_02211d48
.size func_ov074_02211a8c, . - func_ov074_02211a8c

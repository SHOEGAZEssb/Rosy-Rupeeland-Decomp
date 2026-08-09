.text
; Matching fallback for the portable implementation in src/overlays/ov051/overlay051_shared_recovery.c.
.extern data_020c9670
.extern func_020ad250
.extern func_020ad268
.extern func_020ad274
.extern func_ov051_0220d774
.extern func_ov051_0220d7bc
.extern gSystemState

.global func_ov051_0220d688
func_ov051_0220d688:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x18
    mov r6, r0
    mov r5, #0x2000
    add r4, r6, #0x1800
    add r0, sp, #0xc
    sub r1, r5, #0x3000
    mov r2, #0x1000
    mov r3, #0x12c
    strh r5, [r4, #0x10]
    bl func_ov051_0220d774
    ldr r1, .L_0220d768
    add r0, sp, #0xc
    ldr r1, [r1, #0x64]
    mov r2, #0x0
    bl func_ov051_0220d7bc
    mov r1, r4
    strh r0, [r1, #0x10]
    ldr r2, .L_0220d76c
    add r0, sp, #0x0
    mov r1, #0x1000
    mov r3, #0x60
    bl func_ov051_0220d774
    add r7, r6, #0x10
    ldr r6, .L_0220d770
    ldr r5, .L_0220d768
    mov r9, #0x0
    add r11, sp, #0x0
.L_0220d6f8:
    ldr r1, [r5, #0x64]
    mov r0, r11
    mov r2, #0x0
    add r1, r1, r9
    bl func_ov051_0220d7bc
    add r10, r7, r9, lsl #0x4
    mov r8, r0
    mov r0, r10
    bl func_020ad250
    ldrh r1, [r4, #0x10]
    mov r0, r10
    mov r1, r1, asr #0x4
    mov r2, r1, lsl #0x1
    mov r1, r2, lsl #0x1
    add r2, r6, r2, lsl #0x1
    ldrsh r1, [r6, r1]
    ldrsh r2, [r2, #0x2]
    bl func_020ad268
    mov r1, r10
    mov r0, r10
    mov r2, r8
    mov r3, r8
    bl func_020ad274
    add r9, r9, #0x1
    cmp r9, #0xc0
    blt .L_0220d6f8
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_0220d768: .word gSystemState
.L_0220d76c: .word 0x1333
.L_0220d770: .word data_020c9670
.size func_ov051_0220d688, . - func_ov051_0220d688

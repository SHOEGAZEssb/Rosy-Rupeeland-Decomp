.text
; Matching fallback for the portable implementation in src/overlays/ov069/overlay069_recovery.c.
.extern gGamePhaseRuntime
.extern data_ov069_02212536
.extern data_ov069_0221253e
.extern data_ov069_02212546
.extern data_ov069_02212550
.extern RuntimePresentationManager_GetGraphics3dPresentation
.extern func_0209b7ec
.extern func_0209b880
.extern func_020befec

.global func_ov069_0221070c
func_ov069_0221070c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0xc0
    ldr r3, .L_02210914
    mov r9, r1
    add r2, sp, #0x1c
    mov r4, r0
    mov r1, #0x4
.L_02210728:
    ldrh r0, [r3], #0x2
    subs r1, r1, #0x1
    strh r0, [r2], #0x2
    bne .L_02210728
    ldr r3, .L_02210918
    add r2, sp, #0x14
    mov r1, #0x4
.L_02210744:
    ldrh r0, [r3], #0x2
    subs r1, r1, #0x1
    strh r0, [r2], #0x2
    bne .L_02210744
    ldr r3, .L_0221091c
    add r2, sp, #0xc
    mov r1, #0x4
.L_02210760:
    ldrh r0, [r3], #0x2
    subs r1, r1, #0x1
    strh r0, [r2], #0x2
    bne .L_02210760
    ldr r0, .L_02210920
    mov r8, #0x0
    mov r7, #0x3f000
    add r10, sp, #0x24
    ldmia r0, {r0, r1, r2}
    stmia r10, {r0, r1, r2}
    add r10, sp, #0x38
    mov r2, #0x10000
    str r8, [sp, #0x30]
    str r7, [sp, #0x34]
    stmia r10, {r2, r7}
    add r5, sp, #0x50
    add r6, sp, #0x40
    add lr, sp, #0x58
    str r8, [r6, #0x0]
    str r8, [r5, #0x0]
    str r8, [r5, #0x4]
    stmia lr, {r2, r8}
    mov r10, #0x1f000
    str r10, [r6, #0x4]
    add r5, sp, #0x48
    stmia r5, {r2, r10}
    add ip, sp, #0x60
    add r1, sp, #0x68
    str r8, [ip, #0x0]
    str r7, [ip, #0x4]
    stmia r1, {r2, r7}
    add r6, sp, #0x70
    stmia r6, {r8, r10}
    add r5, sp, #0x78
    stmia r5, {r2, r10}
    add r3, sp, #0x80
    add r0, sp, #0x88
    str r8, [r3, #0x0]
    str r8, [r3, #0x4]
    stmia r0, {r2, r8}
    add r11, sp, #0x90
    str r8, [r11, #0x0]
    str r7, [r11, #0x4]
    add r0, sp, #0x98
    stmia r0, {r2, r7}
    add ip, sp, #0xa0
    stmia ip, {r8, r10}
    add r1, sp, #0xa8
    stmia r1, {r2, r10}
    add r6, sp, #0xb0
    add r3, sp, #0xb8
    mov r0, r9
    mov r1, #0xa
    str r8, [r6, #0x0]
    str r8, [r6, #0x4]
    stmia r3, {r2, r8}
    bl func_020befec
    cmp r0, #0x0
    cmpne r0, #0x1
    beq .L_0221085c
    cmp r0, #0x2
    beq .L_02210864
    b .L_0221086c
.L_0221085c:
    add r6, sp, #0xc
    b .L_02210870
.L_02210864:
    add r6, sp, #0x14
    b .L_02210870
.L_0221086c:
    add r6, sp, #0x1c
.L_02210870:
    ldr r0, .L_02210924
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_GetGraphics3dPresentation
    mov r1, #0x0
    mov r7, r0
    bl func_0209b7ec
    mov r0, #0xd
    add r9, r4, #0x4
    sub r5, r0, #0x1
    mov r10, #0x3
    add r8, sp, #0x30
    mov r11, #0x24
    mov r4, #0x6
.L_022108ac:
    mov r0, r5
    mov r1, #0x3
    bl func_020befec
    mul r0, r1, r4
    mov r1, r5, lsr #0x1f
    add r3, r8, r0, lsl #0x3
    rsb r0, r1, r5, lsl #0x1e
    add r0, r1, r0, ror #0x1e
    str r10, [sp, #0x0]
    mov r0, r0, lsl #0x1
    ldrh r2, [r6, r0]
    rsb r0, r1, r5, lsl #0x1f
    add r0, r1, r0, ror #0x1f
    sub r0, r0, #0x1000
    mov r0, r0, lsl #0x10
    str r2, [sp, #0x4]
    mov r0, r0, asr #0x10
    str r0, [sp, #0x8]
    mla r1, r5, r11, r9
    mov r0, r7
    add r2, sp, #0x24
    bl func_0209b880
    subs r5, r5, #0x1
    bpl .L_022108ac
    add sp, sp, #0xc0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.L_02210914: .word data_ov069_02212536
.L_02210918: .word data_ov069_0221253e
.L_0221091c: .word data_ov069_02212546
.L_02210920: .word data_ov069_02212550
.L_02210924: .word gGamePhaseRuntime
.size func_ov069_0221070c, . - func_ov069_0221070c

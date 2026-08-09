.text
; Matching fallback for the portable implementation in src/overlays/ov074/overlay074_recovery.c.
.extern G3X_InitMtxStack
.extern GX_SetGraphicsMode
.extern func_020a7b90
.extern func_020aef3c
.extern func_020b0300
.extern func_020b0374

.global func_ov074_022116a8
func_ov074_022116a8:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    ldr r1, .L_02211774
    ldrh r0, [r1, #0x0]
    bic r0, r0, #0x3
    strh r0, [r1, #0x0]
    bl G3X_InitMtxStack
    mov r0, #0x1
    mov r2, r0
    mov r1, #0x0
    bl GX_SetGraphicsMode
    mov r0, #0x2
    bl func_020aef3c
    ldr ip, .L_02211778
    ldr r2, .L_0221177c
    ldrh r1, [ip, #0x0]
    ldr r0, .L_02211780
    sub lr, r2, #0x1c
    and r0, r1, r0
    strh r0, [ip, #0x0]
    ldrh r3, [ip, #0x0]
    mov r0, #0x0
    mov r1, r0
    and r2, r3, r2
    strh r2, [ip, #0x0]
    ldrh r4, [ip, #0x0]
    mov r2, r0
    mov r3, r0
    bic r4, r4, #0x3000
    orr r4, r4, #0x8
    strh r4, [ip, #0x0]
    ldrh r4, [ip, #0x0]
    bic r4, r4, #0x3000
    orr r4, r4, #0x10
    strh r4, [ip, #0x0]
    ldrh r4, [ip, #0x0]
    and r4, r4, lr
    strh r4, [ip, #0x0]
    bl func_020b0374
    mov r0, #0x0
    str r0, [sp, #0x0]
    mov r1, r0
    ldr r2, .L_02211784
    mov r3, #0x3f
    bl func_020b0300
    ldr r1, .L_02211788
    ldr r0, .L_0221178c
    str r1, [r0, #0x0]
    bl func_020a7b90
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
.L_02211774: .word 0x4000008
.L_02211778: .word 0x4000060
.L_0221177c: .word 0xcffb
.L_02211780: .word 0xffffcffd
.L_02211784: .word 0x7fff
.L_02211788: .word 0xbfff0000
.L_0221178c: .word 0x4000580
.size func_ov074_022116a8, . - func_ov074_022116a8

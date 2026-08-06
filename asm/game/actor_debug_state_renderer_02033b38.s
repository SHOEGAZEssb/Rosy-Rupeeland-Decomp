; Matching retail form; see src/game/actor_debug_state_renderer.c.
.text
.extern DebugText_Printf
.extern data_020defc0
.extern data_020defd0
.extern data_020defec
.extern data_020df100
.extern data_020df114
.extern data_020df12c
.extern data_020df140
.extern data_020df158
.extern data_020df174
.extern data_020df18c
.extern data_020df1a8
.extern data_020df1c0
.extern data_020df1d8
.extern data_020df1f0
.extern data_020df1f8
.extern func_020337d4
.extern func_020adcac
.extern gDebugFont

    .global func_02033b38
    .type func_02033b38, @function
func_02033b38: ; 0x02033b38
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x14
    mov r5, r0
    ldrb r0, [r5, #0x4d]
    mov r4, r1
    cmp r0, #0x9
    addls pc, pc, r0, lsl #0x2
    b .L_02033bb8
.L_02033b58: ; jump table
    b .L_02033bb8 ; case 0
    b .L_02033b80 ; case 1
    b .L_02033b88 ; case 2
    b .L_02033b90 ; case 3
    b .L_02033bb0 ; case 4
    b .L_02033b98 ; case 5
    b .L_02033bb8 ; case 6
    b .L_02033ba0 ; case 7
    b .L_02033bb8 ; case 8
    b .L_02033ba8 ; case 9
.L_02033b80:
    mov r2, #0x0
    b .L_02033bbc
.L_02033b88:
    mov r2, #0x1
    b .L_02033bbc
.L_02033b90:
    mov r2, #0x2
    b .L_02033bbc
.L_02033b98:
    mov r2, #0x3
    b .L_02033bbc
.L_02033ba0:
    mov r2, #0x4
    b .L_02033bbc
.L_02033ba8:
    mov r2, #0x5
    b .L_02033bbc
.L_02033bb0:
    mov r2, #0x6
    b .L_02033bbc
.L_02033bb8:
    mov r2, #0x7
.L_02033bbc:
    ldr r0, .L_02033e90
    ldr r1, .L_02033e94
    ldr r0, [r0, r2, lsl #0x2]
    str r1, [sp, #0x0]
    str r0, [sp, #0x4]
    ldrh r2, [r5, #0x4e]
    mov r1, #0x1
    ldr r0, .L_02033e98
    str r2, [sp, #0x8]
    ldr r0, [r0, #0x0]
    mov r2, r1
    mov r3, r4
    bl DebugText_Printf
    ldr r1, .L_02033e9c
    ldr r0, .L_02033e98
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x14]
    mov r3, r4
    str r1, [sp, #0x4]
    ldr r2, [r5, #0x10]
    mov r1, #0x1
    str r2, [sp, #0x8]
    ldr r0, [r0, #0x0]
    mov r2, #0x2
    bl DebugText_Printf
    ldr r0, [r5, #0x54]
    cmp r0, #0x0
    beq .L_02033ca4
    ldrh r2, [r0, #0x24]
    ldr r1, .L_02033ea0
    and r0, r2, #0xc
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    ldrne r0, .L_02033ea4
    ldrne r3, [r0, #0x14]
    ldreq r0, .L_02033ea4
    ldreq r3, [r0, #0x10]
    ldr r0, .L_02033e98
    stmia sp, {r1, r2, r3}
    ldr r0, [r0, #0x0]
    mov r3, r4
    mov r1, #0x1
    mov r2, #0x3
    bl DebugText_Printf
    ldr ip, [r5, #0x54]
    ldr r1, .L_02033ea8
    ldr r0, .L_02033e98
    str r1, [sp, #0x0]
    ldrh r2, [ip, #0x28]
    mov r3, r4
    mov r1, #0x1
    str r2, [sp, #0x4]
    ldrb ip, [ip, #0x3a]
    mov r2, #0x4
    str ip, [sp, #0x8]
    ldr r0, [r0, #0x0]
    bl DebugText_Printf
    b .L_02033ce4
.L_02033ca4:
    ldr r1, .L_02033eac
    ldr r0, .L_02033e98
    str r1, [sp, #0x0]
    ldr r0, [r0, #0x0]
    mov r3, r4
    mov r1, #0x1
    mov r2, #0x3
    bl DebugText_Printf
    ldr r1, .L_02033eb0
    ldr r0, .L_02033e98
    str r1, [sp, #0x0]
    ldr r0, [r0, #0x0]
    mov r3, r4
    mov r1, #0x1
    mov r2, #0x4
    bl DebugText_Printf
.L_02033ce4:
    ldr r1, .L_02033eb4
    ldr r0, .L_02033e98
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x1c]
    mov r3, r4
    mov r1, r1, asr #0xc
    str r1, [sp, #0x4]
    ldr r2, [r5, #0x20]
    mov r1, #0x1
    mov r2, r2, asr #0xc
    str r2, [sp, #0x8]
    ldr ip, [r5, #0x24]
    mov r2, #0x5
    mov ip, ip, asr #0xc
    str ip, [sp, #0xc]
    ldr ip, [r5, #0x1dc]
    mov ip, ip, asr #0xc
    str ip, [sp, #0x10]
    ldr r0, [r0, #0x0]
    bl DebugText_Printf
    ldr r1, .L_02033eb8
    ldr r0, .L_02033e98
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x3c]
    mov r3, r4
    mov r1, r1, asr #0x9
    str r1, [sp, #0x4]
    ldr r2, [r5, #0x40]
    mov r1, #0x1
    mov r2, r2, asr #0x9
    str r2, [sp, #0x8]
    ldr ip, [r5, #0x44]
    mov r2, #0x6
    mov ip, ip, asr #0x9
    str ip, [sp, #0xc]
    ldr r0, [r0, #0x0]
    bl DebugText_Printf
    ldr r1, .L_02033ebc
    ldr r0, .L_02033e98
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x8c]
    mov r3, r4
    mov r1, r1, asr #0x9
    str r1, [sp, #0x4]
    ldr r2, [r5, #0x90]
    mov r1, #0x1
    mov r2, r2, asr #0x9
    str r2, [sp, #0x8]
    ldr ip, [r5, #0x94]
    mov r2, #0x7
    mov ip, ip, asr #0x9
    str ip, [sp, #0xc]
    ldr r0, [r0, #0x0]
    bl DebugText_Printf
    ldr r1, .L_02033ec0
    ldr r0, .L_02033e98
    str r1, [sp, #0x0]
    ldr r2, [r5, #0x9c]
    mov r1, #0x1
    mov r2, r2, asr #0x9
    str r2, [sp, #0x4]
    ldr r3, [r5, #0xa0]
    mov r2, #0x8
    mov r3, r3, asr #0x9
    str r3, [sp, #0x8]
    ldr ip, [r5, #0xa4]
    mov r3, r4
    mov ip, ip, asr #0x9
    str ip, [sp, #0xc]
    ldr r0, [r0, #0x0]
    bl DebugText_Printf
    mov r0, r5
    bl func_020337d4
    add r0, r0, #0x2000
    ldr r0, [r0, #0xe7c]
    adds r1, r0, #0x18
    addne r1, r1, #0x4
    adds r0, r5, #0x18
    addne r0, r0, #0x4
    bl func_020adcac
    ldr r2, .L_02033ec4
    mov r1, r0, asr #0xc
    str r2, [sp, #0x0]
    str r1, [sp, #0x4]
    ldr r0, .L_02033e98
    mov r3, r4
    ldr r0, [r0, #0x0]
    mov r1, #0x1
    mov r2, #0x9
    bl DebugText_Printf
    ldr r0, [r5, #0x14]
    tst r0, #0x80000000
    moveq r2, #0x1
    movne r2, #0x0
    ldr r1, .L_02033ec8
    ldr r0, .L_02033ecc
    str r1, [sp, #0x0]
    ldr r1, [r0, r2, lsl #0x2]
    ldr r0, .L_02033e98
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r3, r4
    mov r1, #0x1
    mov r2, #0x16
    bl DebugText_Printf
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, pc}
.L_02033e90: .word data_020defec
.L_02033e94: .word data_020df100
.L_02033e98: .word gDebugFont
.L_02033e9c: .word data_020df114
.L_02033ea0: .word data_020df12c
.L_02033ea4: .word data_020defc0
.L_02033ea8: .word data_020df140
.L_02033eac: .word data_020df158
.L_02033eb0: .word data_020df174
.L_02033eb4: .word data_020df18c
.L_02033eb8: .word data_020df1a8
.L_02033ebc: .word data_020df1c0
.L_02033ec0: .word data_020df1d8
.L_02033ec4: .word data_020df1f0
.L_02033ec8: .word data_020df1f8
.L_02033ecc: .word data_020defd0
    .size func_02033b38, . - func_02033b38

    .global func_02033ed0


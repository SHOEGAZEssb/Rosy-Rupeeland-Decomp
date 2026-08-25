; Matching retail form; see src/game/type7_actor_debug_display.c.
.extern DebugText_Printf
.extern Actor_DebugDrawState
.extern data_020e1d14
.extern gDebugFont
.extern data_020e1d24
.extern data_020e1d40
.extern data_020e16b0
.extern data_020e1858
.extern data_020e1d5c
.extern data_020e1880
.extern data_020e1d64
.extern data_020e1888
.extern data_020e1d6c
.extern data_020e1898
.extern data_020e1d74
.extern data_020e18d8
.extern data_020e1d7c
.extern data_020e1820
.extern data_020e1d84
.extern data_020e1818
.extern data_020e1d88
.extern data_020e16c0
.extern data_020e1d90
.extern data_020e1808
.extern data_020e1d98
.extern data_020e1800
.extern data_020e1d9c
.extern data_020e17f8
.extern data_020e1da8
.extern data_020e17f0
.extern data_020e1dac
.extern data_020e16b8
.extern data_020e1db4
.extern data_020e17e0
.extern data_020e1dbc
.extern data_020e17d8
.extern data_020e1dc0
.extern data_020e17d0
.extern data_020e1dc8
.extern data_020e16c8
.extern data_020e1dd0
.extern data_020e17c0
.extern data_020e1ddc
.extern data_020e16f8
.extern data_020e1de8
.extern data_020e17b0
.extern data_020e1df0
.extern data_020e16f0
.extern data_020e1df8
.extern data_020e17a0
.extern data_020e1e04
.extern data_020e1e0c
.extern data_020e1e18
.extern data_020e1984
.extern data_020e1e24
.extern data_020e1e34
.extern data_020e1e48
.text
    .global Type7Actor_PrintDebugState
Type7Actor_PrintDebugState: ; 0x0204b81c
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    mov r5, r0
    mov r4, r1
    bl Actor_DebugDrawState
    ldr r0, [r5, #0x10]
    tst r0, #0x1000000
    beq .L_0204b8a0
    ldr r1, .L_0204bec0
    ldr r0, .L_0204bec4
    str r1, [sp, #0x0]
    ldr r0, [r0, #0x0]
    mov r3, r4
    mov r1, #0x1
    mov r2, #0x8
    bl DebugText_Printf
    ldr r1, .L_0204bec8
    ldr r0, .L_0204bec4
    str r1, [sp, #0x0]
    ldr r0, [r0, #0x0]
    mov r3, r4
    mov r1, #0x1
    mov r2, #0x9
    bl DebugText_Printf
    ldr r1, .L_0204becc
    ldr r0, .L_0204bec4
    str r1, [sp, #0x0]
    ldr r0, [r0, #0x0]
    mov r3, r4
    mov r1, #0x1
    mov r2, #0xa
    bl DebugText_Printf
    b .L_0204beb8
.L_0204b8a0:
    ldr r0, .L_0204bed0
    ldr r3, [r5, #0x208]
    ldr r1, [r0, #0x1a8]
    mov r0, #0x0
    cmp r3, r1
    mov ip, #0x1
    ldr r1, .L_0204bed4
    bne .L_0204b8d4
    ldr r2, [r5, #0x20c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq ip, #0x0
.L_0204b8d4:
    cmp ip, #0x0
    ldreq r0, .L_0204bed8
    beq .L_0204bdc8
    ldr r1, .L_0204bed0
    ldr r3, [r5, #0x208]
    ldr r1, [r1, #0x1d0]
    mov ip, #0x1
    cmp r3, r1
    ldr r1, .L_0204bedc
    bne .L_0204b910
    ldr r2, [r5, #0x20c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq ip, #0x0
.L_0204b910:
    cmp ip, #0x0
    ldreq r0, .L_0204bee0
    beq .L_0204bdc8
    ldr r1, .L_0204bed0
    ldr r3, [r5, #0x208]
    ldr r1, [r1, #0x1d8]
    mov ip, #0x1
    cmp r3, r1
    ldr r1, .L_0204bee4
    bne .L_0204b94c
    ldr r2, [r5, #0x20c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq ip, #0x0
.L_0204b94c:
    cmp ip, #0x0
    ldreq r0, .L_0204bee8
    beq .L_0204bdc8
    ldr r1, .L_0204bed0
    ldr r3, [r5, #0x208]
    ldr r1, [r1, #0x1e8]
    mov ip, #0x1
    cmp r3, r1
    ldr r1, .L_0204beec
    bne .L_0204b988
    ldr r2, [r5, #0x20c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq ip, #0x0
.L_0204b988:
    cmp ip, #0x0
    ldreq r0, .L_0204bef0
    beq .L_0204bdc8
    ldr r1, .L_0204bed0
    ldr r3, [r5, #0x208]
    ldr r1, [r1, #0x228]
    mov ip, #0x1
    cmp r3, r1
    ldr r1, .L_0204bef4
    bne .L_0204b9c4
    ldr r2, [r5, #0x20c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq ip, #0x0
.L_0204b9c4:
    cmp ip, #0x0
    ldreq r0, .L_0204bef8
    beq .L_0204bdc8
    ldr r1, .L_0204bed0
    ldr r3, [r5, #0x208]
    ldr r1, [r1, #0x170]
    mov ip, #0x1
    cmp r3, r1
    ldr r1, .L_0204befc
    bne .L_0204ba00
    ldr r2, [r5, #0x20c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq ip, #0x0
.L_0204ba00:
    cmp ip, #0x0
    ldreq r0, .L_0204bf00
    beq .L_0204bdc8
    ldr r1, .L_0204bed0
    ldr r3, [r5, #0x208]
    ldr r1, [r1, #0x168]
    mov ip, #0x1
    cmp r3, r1
    ldr r1, .L_0204bf04
    bne .L_0204ba3c
    ldr r2, [r5, #0x20c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq ip, #0x0
.L_0204ba3c:
    cmp ip, #0x0
    ldreq r0, .L_0204bf08
    beq .L_0204bdc8
    ldr r1, .L_0204bed0
    ldr r3, [r5, #0x208]
    ldr r1, [r1, #0x10]
    mov ip, #0x1
    cmp r3, r1
    ldr r1, .L_0204bf0c
    bne .L_0204ba78
    ldr r2, [r5, #0x20c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq ip, #0x0
.L_0204ba78:
    cmp ip, #0x0
    ldreq r0, .L_0204bf10
    beq .L_0204bdc8
    ldr r1, .L_0204bed0
    ldr r3, [r5, #0x208]
    ldr r1, [r1, #0x158]
    mov ip, #0x1
    cmp r3, r1
    ldr r1, .L_0204bf14
    bne .L_0204bab4
    ldr r2, [r5, #0x20c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq ip, #0x0
.L_0204bab4:
    cmp ip, #0x0
    ldreq r0, .L_0204bf18
    beq .L_0204bdc8
    ldr r1, .L_0204bed0
    ldr r3, [r5, #0x208]
    ldr r1, [r1, #0x150]
    mov ip, #0x1
    cmp r3, r1
    ldr r1, .L_0204bf1c
    bne .L_0204baf0
    ldr r2, [r5, #0x20c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq ip, #0x0
.L_0204baf0:
    cmp ip, #0x0
    ldreq r0, .L_0204bf20
    beq .L_0204bdc8
    ldr r1, .L_0204bed0
    ldr r3, [r5, #0x208]
    ldr r1, [r1, #0x148]
    mov ip, #0x1
    cmp r3, r1
    ldr r1, .L_0204bf24
    bne .L_0204bb2c
    ldr r2, [r5, #0x20c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq ip, #0x0
.L_0204bb2c:
    cmp ip, #0x0
    ldreq r0, .L_0204bf28
    beq .L_0204bdc8
    ldr r1, .L_0204bed0
    ldr r3, [r5, #0x208]
    ldr r1, [r1, #0x140]
    mov ip, #0x1
    cmp r3, r1
    ldr r1, .L_0204bf2c
    bne .L_0204bb68
    ldr r2, [r5, #0x20c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq ip, #0x0
.L_0204bb68:
    cmp ip, #0x0
    ldreq r0, .L_0204bf30
    beq .L_0204bdc8
    ldr r1, .L_0204bed0
    ldr r3, [r5, #0x208]
    ldr r1, [r1, #0x8]
    mov ip, #0x1
    cmp r3, r1
    ldr r1, .L_0204bf34
    bne .L_0204bba4
    ldr r2, [r5, #0x20c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq ip, #0x0
.L_0204bba4:
    cmp ip, #0x0
    ldreq r0, .L_0204bf38
    beq .L_0204bdc8
    ldr r1, .L_0204bed0
    ldr r3, [r5, #0x208]
    ldr r1, [r1, #0x130]
    mov ip, #0x1
    cmp r3, r1
    ldr r1, .L_0204bf3c
    bne .L_0204bbe0
    ldr r2, [r5, #0x20c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq ip, #0x0
.L_0204bbe0:
    cmp ip, #0x0
    ldreq r0, .L_0204bf40
    beq .L_0204bdc8
    ldr r1, .L_0204bed0
    ldr r3, [r5, #0x208]
    ldr r1, [r1, #0x128]
    mov ip, #0x1
    cmp r3, r1
    ldr r1, .L_0204bf44
    bne .L_0204bc1c
    ldr r2, [r5, #0x20c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq ip, #0x0
.L_0204bc1c:
    cmp ip, #0x0
    ldreq r0, .L_0204bf48
    beq .L_0204bdc8
    ldr r1, .L_0204bed0
    ldr r3, [r5, #0x208]
    ldr r1, [r1, #0x120]
    mov ip, #0x1
    cmp r3, r1
    ldr r1, .L_0204bf4c
    bne .L_0204bc58
    ldr r2, [r5, #0x20c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq ip, #0x0
.L_0204bc58:
    cmp ip, #0x0
    ldreq r0, .L_0204bf50
    beq .L_0204bdc8
    ldr r1, .L_0204bed0
    ldr r3, [r5, #0x208]
    ldr r1, [r1, #0x18]
    mov ip, #0x1
    cmp r3, r1
    ldr r1, .L_0204bf54
    bne .L_0204bc94
    ldr r2, [r5, #0x20c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq ip, #0x0
.L_0204bc94:
    cmp ip, #0x0
    ldreq r0, .L_0204bf58
    beq .L_0204bdc8
    ldr r1, .L_0204bed0
    ldr r3, [r5, #0x208]
    ldr r1, [r1, #0x110]
    mov ip, #0x1
    cmp r3, r1
    ldr r1, .L_0204bf5c
    bne .L_0204bcd0
    ldr r2, [r5, #0x20c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq ip, #0x0
.L_0204bcd0:
    cmp ip, #0x0
    ldreq r0, .L_0204bf60
    beq .L_0204bdc8
    ldr r1, .L_0204bed0
    ldr r3, [r5, #0x208]
    ldr r1, [r1, #0x48]
    mov ip, #0x1
    cmp r3, r1
    ldr r1, .L_0204bf64
    bne .L_0204bd0c
    ldr r2, [r5, #0x20c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq ip, #0x0
.L_0204bd0c:
    cmp ip, #0x0
    ldreq r0, .L_0204bf68
    beq .L_0204bdc8
    ldr r1, .L_0204bed0
    ldr r3, [r5, #0x208]
    ldr r1, [r1, #0x100]
    mov ip, #0x1
    cmp r3, r1
    ldr r1, .L_0204bf6c
    bne .L_0204bd48
    ldr r2, [r5, #0x20c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq ip, #0x0
.L_0204bd48:
    cmp ip, #0x0
    ldreq r0, .L_0204bf70
    beq .L_0204bdc8
    ldr r1, .L_0204bed0
    ldr r3, [r5, #0x208]
    ldr r1, [r1, #0x40]
    mov ip, #0x1
    cmp r3, r1
    ldr r1, .L_0204bf74
    bne .L_0204bd84
    ldr r2, [r5, #0x20c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq ip, #0x0
.L_0204bd84:
    cmp ip, #0x0
    ldreq r0, .L_0204bf78
    beq .L_0204bdc8
    ldr r1, .L_0204bed0
    ldr r3, [r5, #0x208]
    ldr r1, [r1, #0xf0]
    mov ip, #0x1
    cmp r3, r1
    ldr r1, .L_0204bf7c
    bne .L_0204bdc0
    ldr r2, [r5, #0x20c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq ip, #0x0
.L_0204bdc0:
    cmp ip, #0x0
    ldreq r0, .L_0204bf80
.L_0204bdc8:
    cmp r0, #0x0
    beq .L_0204bdf4
    ldr r2, .L_0204bf84
    ldr r1, .L_0204bec4
    str r2, [sp, #0x0]
    str r0, [sp, #0x4]
    ldr r0, [r1, #0x0]
    mov r3, r4
    mov r1, #0x1
    mov r2, #0xb
    bl DebugText_Printf
.L_0204bdf4:
    ldr r0, .L_0204bf88
    ldr r1, .L_0204bf8c
    str r0, [sp, #0x0]
    ldrsh r2, [r5, #0xd6]
    ldr r0, .L_0204bec4
    mov r3, r4
    ldr r2, [r1, r2, lsl #0x2]
    mov r1, #0x1
    str r2, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r2, #0xc
    bl DebugText_Printf
    ldr r1, .L_0204bf90
    ldr r0, .L_0204bec4
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x218]
    mov r3, r4
    mov r1, r1, asr #0xc
    str r1, [sp, #0x4]
    ldr r2, [r5, #0x21c]
    mov r1, #0x1
    mov r2, r2, asr #0xc
    str r2, [sp, #0x8]
    ldr r0, [r0, #0x0]
    mov r2, #0xd
    bl DebugText_Printf
    ldr r1, .L_0204bf94
    ldr r0, .L_0204bec4
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x1fc]
    mov r3, r4
    str r1, [sp, #0x4]
    ldr r2, [r5, #0x200]
    mov r1, #0x1
    str r2, [sp, #0x8]
    ldr r0, [r0, #0x0]
    mov r2, #0xe
    bl DebugText_Printf
    ldr r0, .L_0204bf98
    mov r3, r4
    str r0, [sp, #0x0]
    ldr r1, .L_0204bed0
    ldr r0, .L_0204bec4
    ldr r2, [r1, #0x2b8]
    mov r1, #0x1
    str r2, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r2, #0xf
    bl DebugText_Printf
.L_0204beb8:
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
.L_0204bec0: .word data_020e1d14
.L_0204bec4: .word gDebugFont
.L_0204bec8: .word data_020e1d24
.L_0204becc: .word data_020e1d40
.L_0204bed0: .word data_020e16b0
.L_0204bed4: .word data_020e1858
.L_0204bed8: .word data_020e1d5c
.L_0204bedc: .word data_020e1880
.L_0204bee0: .word data_020e1d64
.L_0204bee4: .word data_020e1888
.L_0204bee8: .word data_020e1d6c
.L_0204beec: .word data_020e1898
.L_0204bef0: .word data_020e1d74
.L_0204bef4: .word data_020e18d8
.L_0204bef8: .word data_020e1d7c
.L_0204befc: .word data_020e1820
.L_0204bf00: .word data_020e1d84
.L_0204bf04: .word data_020e1818
.L_0204bf08: .word data_020e1d88
.L_0204bf0c: .word data_020e16c0
.L_0204bf10: .word data_020e1d90
.L_0204bf14: .word data_020e1808
.L_0204bf18: .word data_020e1d98
.L_0204bf1c: .word data_020e1800
.L_0204bf20: .word data_020e1d9c
.L_0204bf24: .word data_020e17f8
.L_0204bf28: .word data_020e1da8
.L_0204bf2c: .word data_020e17f0
.L_0204bf30: .word data_020e1dac
.L_0204bf34: .word data_020e16b8
.L_0204bf38: .word data_020e1db4
.L_0204bf3c: .word data_020e17e0
.L_0204bf40: .word data_020e1dbc
.L_0204bf44: .word data_020e17d8
.L_0204bf48: .word data_020e1dc0
.L_0204bf4c: .word data_020e17d0
.L_0204bf50: .word data_020e1dc8
.L_0204bf54: .word data_020e16c8
.L_0204bf58: .word data_020e1dd0
.L_0204bf5c: .word data_020e17c0
.L_0204bf60: .word data_020e1ddc
.L_0204bf64: .word data_020e16f8
.L_0204bf68: .word data_020e1de8
.L_0204bf6c: .word data_020e17b0
.L_0204bf70: .word data_020e1df0
.L_0204bf74: .word data_020e16f0
.L_0204bf78: .word data_020e1df8
.L_0204bf7c: .word data_020e17a0
.L_0204bf80: .word data_020e1e04
.L_0204bf84: .word data_020e1e0c
.L_0204bf88: .word data_020e1e18
.L_0204bf8c: .word data_020e1984
.L_0204bf90: .word data_020e1e24
.L_0204bf94: .word data_020e1e34
.L_0204bf98: .word data_020e1e48
.size Type7Actor_PrintDebugState, . - Type7Actor_PrintDebugState

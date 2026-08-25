.text
; Matching fallback for the portable implementation in src/overlays/ov081/overlay081_recovery.c.
.extern DebugText_Printf
.extern data_ov081_02215268
.extern data_ov081_02215280
.extern data_ov081_02215288
.extern data_ov081_02215298
.extern data_ov081_022152a0
.extern data_ov081_022152a8
.extern data_ov081_022152f0
.extern data_ov081_022152f8
.extern data_ov081_02215300
.extern data_ov081_02215350
.extern data_ov081_022153b8
.extern data_ov081_02215798
.extern data_ov081_022157a8
.extern data_ov081_022157c4
.extern data_ov081_022157e0
.extern data_ov081_022157e8
.extern data_ov081_022157f0
.extern data_ov081_022157f8
.extern data_ov081_02215800
.extern data_ov081_02215808
.extern data_ov081_02215810
.extern data_ov081_02215814
.extern data_ov081_0221581c
.extern data_ov081_02215824
.extern data_ov081_02215830
.extern data_ov081_0221583c
.extern Actor_DebugDrawState
.extern gDebugFont

.global func_ov081_02213c60
func_ov081_02213c60:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    mov r5, r0
    mov r4, r1
    bl Actor_DebugDrawState
    ldr r0, [r5, #0x10]
    tst r0, #0x1000000
    beq .L_02213ce4
    ldr r1, .L_02213f9c
    ldr r0, .L_02213fa0
    str r1, [sp, #0x0]
    ldr r0, [r0, #0x0]
    mov r3, r4
    mov r1, #0x1
    mov r2, #0x8
    bl DebugText_Printf
    ldr r1, .L_02213fa4
    ldr r0, .L_02213fa0
    str r1, [sp, #0x0]
    ldr r0, [r0, #0x0]
    mov r3, r4
    mov r1, #0x1
    mov r2, #0x9
    bl DebugText_Printf
    ldr r1, .L_02213fa8
    ldr r0, .L_02213fa0
    str r1, [sp, #0x0]
    ldr r0, [r0, #0x0]
    mov r3, r4
    mov r1, #0x1
    mov r2, #0xa
    bl DebugText_Printf
    b .L_02213f94
.L_02213ce4:
    ldr r0, .L_02213fac
    ldr r3, [r5, #0x208]
    ldr r1, [r0, #0xe8]
    mov r0, #0x0
    cmp r3, r1
    mov ip, #0x1
    ldr r1, .L_02213fb0
    bne .L_02213d18
    ldr r2, [r5, #0x20c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq ip, #0x0
.L_02213d18:
    cmp ip, #0x0
    ldreq r0, .L_02213fb4
    beq .L_02213f00
    ldr r1, .L_02213fac
    ldr r3, [r5, #0x208]
    ldr r1, [r1, #0x88]
    mov ip, #0x1
    cmp r3, r1
    ldr r1, .L_02213fb8
    bne .L_02213d54
    ldr r2, [r5, #0x20c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq ip, #0x0
.L_02213d54:
    cmp ip, #0x0
    ldreq r0, .L_02213fbc
    beq .L_02213f00
    ldr r1, .L_02213fac
    ldr r3, [r5, #0x208]
    ldr r1, [r1, #0x18]
    mov ip, #0x1
    cmp r3, r1
    ldr r1, .L_02213fc0
    bne .L_02213d90
    ldr r2, [r5, #0x20c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq ip, #0x0
.L_02213d90:
    cmp ip, #0x0
    ldreq r0, .L_02213fc4
    beq .L_02213f00
    ldr r1, .L_02213fac
    ldr r3, [r5, #0x208]
    ldr r1, [r1, #0x20]
    mov ip, #0x1
    cmp r3, r1
    ldr r1, .L_02213fc8
    bne .L_02213dcc
    ldr r2, [r5, #0x20c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq ip, #0x0
.L_02213dcc:
    cmp ip, #0x0
    ldreq r0, .L_02213fcc
    beq .L_02213f00
    ldr r1, .L_02213fac
    ldr r3, [r5, #0x208]
    ldr r1, [r1, #0x30]
    mov ip, #0x1
    cmp r3, r1
    ldr r1, .L_02213fd0
    bne .L_02213e08
    ldr r2, [r5, #0x20c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq ip, #0x0
.L_02213e08:
    cmp ip, #0x0
    ldreq r0, .L_02213fd4
    beq .L_02213f00
    ldr r1, .L_02213fac
    ldr r3, [r5, #0x208]
    ldr r1, [r1, #0x40]
    mov ip, #0x1
    cmp r3, r1
    ldr r1, .L_02213fd8
    bne .L_02213e44
    ldr r2, [r5, #0x20c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq ip, #0x0
.L_02213e44:
    cmp ip, #0x0
    ldreq r0, .L_02213fdc
    beq .L_02213f00
    ldr r1, .L_02213fac
    ldr r3, [r5, #0x208]
    ldr r1, [r1, #0x90]
    mov ip, #0x1
    cmp r3, r1
    ldr r1, .L_02213fe0
    bne .L_02213e80
    ldr r2, [r5, #0x20c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq ip, #0x0
.L_02213e80:
    cmp ip, #0x0
    ldreq r0, .L_02213fe4
    beq .L_02213f00
    ldr r1, .L_02213fac
    ldr r3, [r5, #0x208]
    ldr r1, [r1, #0x38]
    mov ip, #0x1
    cmp r3, r1
    ldr r1, .L_02213fe8
    bne .L_02213ebc
    ldr r2, [r5, #0x20c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq ip, #0x0
.L_02213ebc:
    cmp ip, #0x0
    ldreq r0, .L_02213fec
    beq .L_02213f00
    ldr r1, .L_02213fac
    ldr r3, [r5, #0x208]
    ldr r1, [r1, #0x98]
    mov ip, #0x1
    cmp r3, r1
    ldr r1, .L_02213ff0
    bne .L_02213ef8
    ldr r2, [r5, #0x20c]
    ldr r1, [r1, #0x4]
    cmp r2, r1
    cmpne r3, #0x0
    moveq ip, #0x0
.L_02213ef8:
    cmp ip, #0x0
    ldreq r0, .L_02213ff4
.L_02213f00:
    cmp r0, #0x0
    beq .L_02213f2c
    ldr r2, .L_02213ff8
    ldr r1, .L_02213fa0
    str r2, [sp, #0x0]
    str r0, [sp, #0x4]
    ldr r0, [r1, #0x0]
    mov r3, r4
    mov r1, #0x1
    mov r2, #0x8
    bl DebugText_Printf
.L_02213f2c:
    ldr r0, .L_02213ffc
    ldr r1, .L_02214000
    str r0, [sp, #0x0]
    ldrsh r2, [r5, #0xd6]
    ldr r0, .L_02213fa0
    mov r3, r4
    ldr r2, [r1, r2, lsl #0x2]
    mov r1, #0x1
    str r2, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r2, #0x9
    bl DebugText_Printf
    ldr r1, .L_02214004
    ldr r0, .L_02213fa0
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
    mov r2, #0xa
    bl DebugText_Printf
.L_02213f94:
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
.L_02213f9c: .word data_ov081_02215798
.L_02213fa0: .word gDebugFont
.L_02213fa4: .word data_ov081_022157a8
.L_02213fa8: .word data_ov081_022157c4
.L_02213fac: .word data_ov081_02215268
.L_02213fb0: .word data_ov081_02215350
.L_02213fb4: .word data_ov081_022157e0
.L_02213fb8: .word data_ov081_022152f0
.L_02213fbc: .word data_ov081_022157e8
.L_02213fc0: .word data_ov081_02215280
.L_02213fc4: .word data_ov081_022157f0
.L_02213fc8: .word data_ov081_02215288
.L_02213fcc: .word data_ov081_022157f8
.L_02213fd0: .word data_ov081_02215298
.L_02213fd4: .word data_ov081_02215800
.L_02213fd8: .word data_ov081_022152a8
.L_02213fdc: .word data_ov081_02215808
.L_02213fe0: .word data_ov081_022152f8
.L_02213fe4: .word data_ov081_02215810
.L_02213fe8: .word data_ov081_022152a0
.L_02213fec: .word data_ov081_02215814
.L_02213ff0: .word data_ov081_02215300
.L_02213ff4: .word data_ov081_0221581c
.L_02213ff8: .word data_ov081_02215824
.L_02213ffc: .word data_ov081_02215830
.L_02214000: .word data_ov081_022153b8
.L_02214004: .word data_ov081_0221583c
.size func_ov081_02213c60, . - func_ov081_02213c60

.text
; Matching fallback for the portable implementation in src/overlays/ov052/overlay052_recovery.c.
.extern data_020f4dc8
.extern data_020f4e18
.extern data_021052fc
.extern data_ov052_0220e200
.extern func_02002ac0
.extern func_02002d28
.extern func_02008570
.extern func_0201140c
.extern func_02071d4c
.extern func_0207419c
.extern gLupyContext

.global func_ov052_0220d884
func_ov052_0220d884:
    stmdb sp!, {r4, lr}
    ldr r1, .L_0220d954
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x10]
    cmp r0, #0x0
    beq .L_0220d8ac
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0220d8ac:
    ldr r0, .L_0220d958
    ldr r1, [r4, #0xc]
    ldr r0, [r0, #0x0]
    bl func_02071d4c
    ldr r0, [r4, #0x1c]
    bl func_0207419c
    ldr r0, [r4, #0x20]
    cmp r0, #0x0
    beq .L_0220d8dc
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0220d8dc:
    ldr r0, .L_0220d95c
    ldr r0, [r0, #0x0]
    add r1, r0, #0x2000
    ldr r1, [r1, #0xfb8]
    cmp r1, #0x0
    beq .L_0220d900
    mov r1, #0x1
    mov r2, r1
    bl func_02008570
.L_0220d900:
    ldr r0, [r4, #0x2c]
    mov r0, r0, lsl #0x10
    movs r0, r0, asr #0x10
    beq .L_0220d92c
    ldr r0, .L_0220d960
    mov r1, #0x1
    bl func_02002d28
    mvn r1, #0xf
    mov r2, #0x0
    mov r3, #0x4
    bl func_02002ac0
.L_0220d92c:
    ldr r0, [r4, #0x30]
    mov r0, r0, lsl #0x10
    movs r0, r0, asr #0x10
    beq .L_0220d94c
    ldr r0, .L_0220d964
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl func_0201140c
.L_0220d94c:
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0220d954: .word data_ov052_0220e200
.L_0220d958: .word data_020f4e18
.L_0220d95c: .word data_021052fc
.L_0220d960: .word data_020f4dc8
.L_0220d964: .word gLupyContext
.size func_ov052_0220d884, . - func_ov052_0220d884

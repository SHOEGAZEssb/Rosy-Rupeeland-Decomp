.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.
.extern data_020f4e18
.extern func_02030acc
.extern func_020337d4
.extern func_02071ee0
.extern func_02073fc4

.global func_ov075_022146ec
func_ov075_022146ec:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r1
    ldr r2, [r5, #0xc]
    ldr r1, .L_0221476c
    str r2, [sp, #0x0]
    mov r4, r0
    ldr r1, [r1, #0x0]
    add r0, r4, #0x1f0
    ldmib r5, {r2, r3}
    bl func_02071ee0
    mov r0, r4
    bl func_020337d4
    bl func_02030acc
    ldrb r1, [r5, #0x10]
    str r1, [sp, #0x0]
    ldr r1, [r4, #0x1f0]
    ldr r2, [r4, #0x1f4]
    ldr r3, [r4, #0x1f8]
    bl func_02073fc4
    str r0, [r4, #0x54]
    ldr r0, [r4, #0x14]
    tst r0, #0x80
    ldrnesh r1, [r5, #0x3c]
    ldrne r0, [r4, #0x54]
    strneb r1, [r0, #0x3a]
    mov r0, #0x10000
    ldr r1, [r4, #0x5c]
    rsb r0, r0, #0x0
    and r0, r1, r0
    orr r0, r0, #0x30
    str r0, [r4, #0x5c]
    ldmia sp!, {r3, r4, r5, pc}
.L_0221476c: .word data_020f4e18
.size func_ov075_022146ec, . - func_ov075_022146ec

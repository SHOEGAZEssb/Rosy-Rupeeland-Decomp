.text
; Matching fallback for the portable implementation in src/overlays/ov089/overlay089_recovery.c.
.extern data_020f4e18
.extern func_02071bdc
.extern func_02071c38
.extern func_02071c94
.extern func_02074038

.global func_ov089_02217b94
func_ov089_02217b94:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x4]
    cmp r1, #0x0
    beq .L_02217be8
    ldr r0, [r1, #0x0]
    bl func_02074038
    ldr r0, .L_02217c10
    ldr r1, [r4, #0x8]
    ldr r0, [r0, #0x0]
    bl func_02071bdc
    ldr r0, .L_02217c10
    ldr r1, [r4, #0xc]
    ldr r0, [r0, #0x0]
    bl func_02071c38
    ldr r0, .L_02217c10
    ldr r1, [r4, #0x10]
    ldr r0, [r0, #0x0]
    bl func_02071c94
    mov r0, #0x0
    str r0, [r4, #0x4]
.L_02217be8:
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    beq .L_02217c04
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02217c04:
    mov r0, #0x0
    str r0, [r4, #0x0]
    ldmia sp!, {r4, pc}
.L_02217c10: .word data_020f4e18
.size func_ov089_02217b94, . - func_ov089_02217b94

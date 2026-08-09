.text
; Matching fallback for the portable implementation in src/overlays/ov068/overlay068_recovery.c.
.extern Scene_Destroy
.extern data_020f4e14
.extern data_020f4e18
.extern data_ov068_0221077c
.extern func_02071bdc
.extern func_02071c38
.extern func_02071c94
.extern func_02074058
.extern func_02074330
.extern func_ov068_02210024

.global func_ov068_022100b0
func_ov068_022100b0:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, .L_02210134
    mov r4, r0
    ldr r5, .L_02210138
    str r1, [r4, #0x0]
    mov r6, #0x0
.L_022100c8:
    add r1, r4, r6, lsl #0x2
    ldr r0, [r5, #0x0]
    ldr r1, [r1, #0x30]
    bl func_02071bdc
    add r1, r4, r6, lsl #0x2
    ldr r0, [r5, #0x0]
    ldr r1, [r1, #0x3c]
    bl func_02071c38
    add r1, r4, r6, lsl #0x2
    ldr r0, [r5, #0x0]
    ldr r1, [r1, #0x48]
    bl func_02071c94
    add r6, r6, #0x1
    cmp r6, #0x2
    blt .L_022100c8
    ldr r0, [r4, #0x24]
    bl func_02074058
    ldr r0, .L_0221013c
    ldr r1, [r4, #0x24]
    ldr r0, [r0, #0x0]
    bl func_02074330
    add r0, r4, #0x28
    bl func_ov068_02210024
    mov r0, r4
    bl Scene_Destroy
    mov r0, r4
    ldmia sp!, {r4, r5, r6, pc}
.L_02210134: .word data_ov068_0221077c
.L_02210138: .word data_020f4e18
.L_0221013c: .word data_020f4e14
.size func_ov068_022100b0, . - func_ov068_022100b0

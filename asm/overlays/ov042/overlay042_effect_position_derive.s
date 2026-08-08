.text
.extern func_ov042_021fcf80
.global func_ov042_02200afc
func_ov042_02200afc:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r1
    mov r4, r0
    bl func_ov042_021fcf80
    ldr r0, [r5, #0x54]
    ldr r1, [r5, #0xa8]
    ldr r0, [r0, #0x30]
    add r0, r1, r0
    str r0, [r4, #0x4]
    ldr r0, [r5, #0x54]
    ldr r1, [r5, #0xac]
    ldr r0, [r0, #0x34]
    add r0, r1, r0
    str r0, [r4, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov042_02200afc, . - func_ov042_02200afc

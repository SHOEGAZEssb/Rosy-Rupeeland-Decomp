.text
.extern func_020958d8
.extern func_020740a4
.extern func_02094574
.extern func_ov001_021fbaa8

    .global func_ov044_0220c880
func_ov044_0220c880:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    add r0, r5, #0xd0
    bl func_020958d8
    add r0, r5, #0x17c
    bl func_020958d8
    ldr r0, [r5, #0xbc]
    bl func_020740a4
    ldr r4, [r5, #0x228]
    cmp r4, #0x0
    beq .L_0220c8bc
    ldr r0, [r4, #0x44]
    bl func_02094574
    ldr r0, [r4, #0x4]
    bl func_020740a4
.L_0220c8bc:
    ldr r0, [r5, #0x22c]
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_ov001_021fbaa8
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov044_0220c880, . - func_ov044_0220c880

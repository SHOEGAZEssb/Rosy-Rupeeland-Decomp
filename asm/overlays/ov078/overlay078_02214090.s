.text
; Matching fallback for the portable implementation in src/overlays/ov078/overlay078_recovery.c.
.extern data_ov078_02215c88
.extern data_ov078_02216240
.extern VecFx32Object_InitComponents
.extern func_ov078_02212ae0
.extern func_ov078_02214124

.global func_ov078_02214090
func_ov078_02214090:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    mov r5, r2
    bl func_ov078_02212ae0
    mov r1, #0x0
    ldr r0, .L_0221411c
    mov r2, r1
    str r0, [r4, #0x0]
    mov r3, r1
    add r0, r4, #0x2b0
    bl VecFx32Object_InitComponents
    mov r3, #0x6
    str r5, [r4, #0x2c0]
    add r0, r4, #0x200
    mov r1, #0x0
    strh r1, [r0, #0xc4]
    add r0, r4, #0x8
    sub r1, r3, #0x14
    sub r2, r3, #0xc
    str r3, [sp, #0x0]
    mov r3, #0xe
    bl func_ov078_02214124
    ldr r0, .L_02214120
    ldr r1, [r0, #0x60]
    ldr r0, [r0, #0x64]
    str r1, [r4, #0x2a4]
    str r0, [r4, #0x2a8]
    ldrh r0, [r4, #0x4e]
    add r1, r4, #0x200
    cmp r0, #0x5e
    moveq r2, #0x1
    movne r2, #0x0
    mov r0, r4
    strh r2, [r1, #0xc6]
    ldmia sp!, {r3, r4, r5, pc}
.L_0221411c: .word data_ov078_02216240
.L_02214120: .word data_ov078_02215c88
.size func_ov078_02214090, . - func_ov078_02214090

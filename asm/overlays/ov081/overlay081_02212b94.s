.text
; Matching fallback for the portable implementation in src/overlays/ov081/overlay081_recovery.c.
.extern data_ov081_02215670
.extern func_02004fe0
.extern func_020050a4
.extern func_0203b514

.global func_ov081_02212b94
func_ov081_02212b94:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl func_0203b514
    ldr r1, .L_02212c34
    add r0, r5, #0x214
    str r1, [r5, #0x0]
    bl func_02004fe0
    ldr r0, .L_02212c38
    mov r2, #0x1000
    str r0, [r5, #0x224]
    ldr r1, .L_02212c3c
    str r2, [r5, #0x228]
    add r0, r5, #0x200
    strh r1, [r0, #0x3a]
    mov r1, #0x0
    strh r1, [r0, #0x3c]
    strh r1, [r0, #0x3e]
    str r2, [r5, #0x240]
    add r0, r5, #0x214
    add r1, r5, #0x18
    bl func_020050a4
    ldr r0, [r5, #0x14]
    tst r0, #0x400
    ldrne r0, [r5, #0xd0]
    orrne r0, r0, #0x4
    strne r0, [r5, #0xd0]
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc4]
    blx r1
    ldr r1, [r4, #0x2c]
    cmp r1, #0x0
    beq .L_02212c2c
    mov r0, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x74]
    blx r2
.L_02212c2c:
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
.L_02212c34: .word data_ov081_02215670
.L_02212c38: .word 0x666
.L_02212c3c: .word 0xffff
.size func_ov081_02212b94, . - func_ov081_02212b94

.text
; Matching fallback for the portable implementation in src/overlays/ov085/overlay085_recovery.c.
.extern data_ov085_02214338
.extern data_ov085_022144f4
.extern func_02004fe0
.extern func_020050a4
.extern func_0203b514
.extern func_0204cca8
.extern func_ov085_02213bd0
.extern genrand_int32

.global func_ov085_02212aec
func_ov085_02212aec:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl func_0203b514
    ldr r1, .L_02212bf4
    add r0, r5, #0x214
    str r1, [r5, #0x0]
    bl func_02004fe0
    ldr r1, .L_02212bf8
    mov r0, #0x1000
    str r1, [r5, #0x224]
    str r0, [r5, #0x228]
    ldr r2, .L_02212bfc
    add r0, r5, #0x200
    strh r2, [r0, #0x34]
    mov r2, #0x2400
    mov r1, r5
    add r0, r5, #0x23c
    str r2, [r5, #0x238]
    bl func_0204cca8
    mov r0, #0x0
    str r0, [r5, #0x24c]
    str r0, [r5, #0x254]
    bl genrand_int32
    str r0, [r5, #0x254]
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
    beq .L_02212b9c
    mov r0, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x74]
    blx r2
.L_02212b9c:
    ldr r1, [r5, #0x10]
    mov r0, #0x10000
    bic r1, r1, #0x1000000
    str r1, [r5, #0x10]
    ldr r1, [r5, #0x5c]
    rsb r0, r0, #0x0
    and r0, r1, r0
    str r0, [r5, #0x5c]
    mov r0, #0x2400
    ldr r1, .L_02212c00
    str r0, [r5, #0x238]
    mov r0, r5
    ldmia r1, {r1, r2}
    mov r3, #0x12c
    bl func_ov085_02213bd0
    add r0, r5, #0x200
    mov r1, #0x10
    strh r1, [r0, #0x34]
    mov r1, #0x0
    mov r0, r5
    str r1, [r5, #0x250]
    ldmia sp!, {r3, r4, r5, pc}
.L_02212bf4: .word data_ov085_022144f4
.L_02212bf8: .word 0x666
.L_02212bfc: .word 0xffff
.L_02212c00: .word data_ov085_02214338
.size func_ov085_02212aec, . - func_ov085_02212aec

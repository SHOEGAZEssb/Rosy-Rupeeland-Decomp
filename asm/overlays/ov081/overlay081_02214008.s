.text
; Matching fallback for the portable implementation in src/overlays/ov081/overlay081_recovery.c.
.extern data_ov081_02215368
.extern data_ov081_02215540
.extern func_0204cca8
.extern func_ov081_02212b94
.extern func_ov081_02213710

.global func_ov081_02214008
func_ov081_02214008:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov081_02212b94
    ldr r2, .L_02214090
    mov r1, r4
    add r0, r4, #0x244
    str r2, [r4, #0x0]
    bl func_0204cca8
    mov r2, #0x0
    add r0, r4, #0x200
    strh r2, [r0, #0x54]
    strb r2, [r4, #0x256]
    ldr r1, [r4, #0x5c]
    sub r0, r2, #0x10000
    and r0, r1, r0
    str r0, [r4, #0x5c]
    mov r0, #0x4000
    ldr r1, .L_02214094
    str r0, [r4, #0x240]
    mov r0, r4
    ldmia r1, {r1, r2}
    mov r3, #0x12c
    bl func_ov081_02213710
    add r0, r4, #0x200
    mov r2, #0x10
    ldr r1, .L_02214098
    strh r2, [r0, #0x3a]
    ldr r0, .L_0221409c
    str r1, [r4, #0x224]
    str r0, [r4, #0x228]
    mov r1, #0x0
    mov r0, r4
    strb r1, [r4, #0x257]
    ldmia sp!, {r4, pc}
.L_02214090: .word data_ov081_02215540
.L_02214094: .word data_ov081_02215368
.L_02214098: .word 0x666
.L_0221409c: .word 0xccd
.size func_ov081_02214008, . - func_ov081_02214008

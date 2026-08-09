.text
; Matching fallback for the portable implementation in src/overlays/ov096/overlay096_recovery.c.
.extern func_0203e7c8
.extern func_ov096_02218590

.global func_ov096_022185d8
func_ov096_022185d8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x14]
    tst r0, #0x200000
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    mov r0, r4
    bl func_ov096_02218590
    cmp r0, #0x0
    ldrnesh r0, [r4, #0xda]
    cmpne r0, #0x0
    ldrne r0, [r4, #0x260]
    bicne r0, r0, #0x8
    strne r0, [r4, #0x260]
    ldreq r0, [r4, #0x260]
    orreq r0, r0, #0x8
    streq r0, [r4, #0x260]
    mov r0, r4
    bl func_ov096_02218590
    cmp r0, #0x0
    bne .L_02218650
    ldrsh r0, [r4, #0xda]
    cmp r0, #0x0
    movne r0, #0x0
    strneh r0, [r4, #0xda]
    ldrne r0, [r4, #0xd0]
    orrne r0, r0, #0x1000
    strne r0, [r4, #0xd0]
.L_02218650:
    mov r0, r4
    bl func_0203e7c8
    ldmia sp!, {r4, pc}
.size func_ov096_022185d8, . - func_ov096_022185d8

.text
; Matching fallback for the portable implementation in src/overlays/ov089/overlay089_recovery.c.
.extern data_ov089_02219a20
.extern func_ov089_02218c9c

.global func_ov089_02218c44
func_ov089_02218c44:
    stmdb sp!, {r3, lr}
    add r2, r0, #0x200
    ldrsh r2, [r2, #0x14]
    cmp r2, #0x0
    moveq r1, #0x1
    streqh r1, [r0, #0xd6]
    ldmeqia sp!, {r3, pc}
    ldr r2, .L_02218c98
    ldrb r2, [r2, #0x0]
    cmp r2, #0x0
    bne .L_02218c7c
    add r0, r0, #0x218
    bl func_ov089_02218c9c
    ldmia sp!, {r3, pc}
.L_02218c7c:
    ldr r2, [r1, #0x4]
    rsb r2, r2, #0x0
    str r2, [r0, #0x21c]
    ldr r1, [r1, #0x8]
    rsb r1, r1, #0x0
    str r1, [r0, #0x220]
    ldmia sp!, {r3, pc}
.L_02218c98: .word data_ov089_02219a20
.size func_ov089_02218c44, . - func_ov089_02218c44

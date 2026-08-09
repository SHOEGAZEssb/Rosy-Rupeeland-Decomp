.text
; Matching fallback for the portable implementation in src/overlays/ov076/overlay076_recovery.c.
.extern func_02072b68

.global func_ov076_02212bec
func_ov076_02212bec:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrb r0, [r4, #0x29c]
    tst r0, #0x18
    ldmneia sp!, {r4, pc}
    ldr r0, [r4, #0x54]
    ldrsh r2, [r4, #0xda]
    ldrb r1, [r0, #0x38]
    cmp r2, #0x4
    movgt r2, #0x4
    cmp r2, r1
    beq .L_02212c24
    and r1, r2, #0xff
    bl func_02072b68
.L_02212c24:
    ldr r2, [r4, #0x54]
    mov r1, #0x0
    ldrh r0, [r2, #0x24]
    orr r0, r0, #0x2
    strh r0, [r2, #0x24]
    ldr r2, [r4, #0x54]
    ldrh r0, [r2, #0x24]
    bic r0, r0, #0x1
    strh r0, [r2, #0x24]
    ldr r0, [r4, #0x54]
    strh r1, [r0, #0x30]
    ldmia sp!, {r4, pc}
.size func_ov076_02212bec, . - func_ov076_02212bec

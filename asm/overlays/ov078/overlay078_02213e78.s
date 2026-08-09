.text
; Matching fallback for the portable implementation in src/overlays/ov078/overlay078_recovery.c.
.extern Sound_Play
.extern data_ov078_02215c88
.extern gSoundContext

.global func_ov078_02213e78
func_ov078_02213e78:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x260]
    mov r0, #0x8
    orr r1, r1, #0xa
    bic r1, r1, #0x1
    str r1, [r4, #0x260]
    strb r0, [r4, #0x24c]
    add r0, r4, #0x200
    ldrsh r1, [r0, #0x98]
    add r1, r1, #0x1
    strh r1, [r0, #0x98]
    ldrsh r2, [r0, #0x98]
    ldrsh r1, [r0, #0x9a]
    cmp r2, r1
    ble .L_02213ee0
    ldr r1, .L_02213f1c
    mov r2, #0x0
    ldr ip, [r1, #0x58]
    ldr r3, [r1, #0x5c]
    mov r1, #0x16
    str ip, [r4, #0x2a4]
    str r3, [r4, #0x2a8]
    strh r2, [r0, #0x98]
    strh r1, [r4, #0xd6]
    ldmia sp!, {r4, pc}
.L_02213ee0:
    cmp r2, #0x1e
    bne .L_02213efc
    ldr r0, .L_02213f20
    mov r1, #0x61
    ldr r0, [r0, #0x0]
    mov r2, #0x5
    bl Sound_Play
.L_02213efc:
    add r0, r4, #0x200
    ldrsh r0, [r0, #0x98]
    cmp r0, #0x3c
    movgt r0, #0x16
    strgth r0, [r4, #0xd6]
    movle r0, #0x15
    strleh r0, [r4, #0xd6]
    ldmia sp!, {r4, pc}
.L_02213f1c: .word data_ov078_02215c88
.L_02213f20: .word gSoundContext
.size func_ov078_02213e78, . - func_ov078_02213e78

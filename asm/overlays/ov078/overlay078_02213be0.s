.text
; Matching fallback for the portable implementation in src/overlays/ov078/overlay078_recovery.c.
.extern Sound_Play
.extern data_ov078_02215c88
.extern gSoundContext

.global func_ov078_02213be0
func_ov078_02213be0:
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0x260]
    add r2, r0, #0x200
    bic r1, r1, #0x1
    orr r1, r1, #0xa
    str r1, [r0, #0x260]
    mov r1, #0x0
    strh r1, [r2, #0x98]
    ldr r3, .L_02213c28
    ldr r2, .L_02213c2c
    ldr ip, [r3, #0x68]
    ldr r3, [r3, #0x6c]
    str ip, [r0, #0x2a4]
    str r3, [r0, #0x2a8]
    ldr r0, [r2, #0x0]
    mov r2, #0x10
    bl Sound_Play
    ldmia sp!, {r3, pc}
.L_02213c28: .word data_ov078_02215c88
.L_02213c2c: .word gSoundContext
.size func_ov078_02213be0, . - func_ov078_02213be0

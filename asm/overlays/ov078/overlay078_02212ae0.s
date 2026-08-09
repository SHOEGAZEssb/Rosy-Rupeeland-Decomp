.text
; Matching fallback for the portable implementation in src/overlays/ov078/overlay078_recovery.c.
.extern data_ov078_02215c88
.extern data_ov078_02215e10
.extern func_0203db80

.global func_ov078_02212ae0
func_ov078_02212ae0:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x30
    mov r4, r0
    mov r5, r1
    bl func_0203db80
    ldr r1, .L_02212b68
    mov r0, r4
    str r1, [r4, #0x0]
    ldr r2, [r0, #0x0]
    add r1, sp, #0x0
    ldr r2, [r2, #0xc8]
    blx r2
    add r1, r4, #0x200
    mov ip, #0x0
    strh ip, [r1, #0x98]
    strh ip, [r1, #0x9c]
    mov r0, #0xf0
    strh r0, [r1, #0x9a]
    strh ip, [r1, #0x9e]
    strh ip, [r1, #0xa2]
    ldrsh r3, [r5, #0x4e]
    ldr r2, .L_02212b6c
    mov r0, r4
    strh r3, [r1, #0xa0]
    ldr r3, [r2, #0x10]
    ldr r1, [r2, #0x14]
    str r3, [r4, #0x2a4]
    str r1, [r4, #0x2a8]
    str ip, [r4, #0x2ac]
    ldr r1, [r4, #0x260]
    orr r1, r1, #0x20
    str r1, [r4, #0x260]
    add sp, sp, #0x30
    ldmia sp!, {r3, r4, r5, pc}
.L_02212b68: .word data_ov078_02215e10
.L_02212b6c: .word data_ov078_02215c88
.size func_ov078_02212ae0, . - func_ov078_02212ae0

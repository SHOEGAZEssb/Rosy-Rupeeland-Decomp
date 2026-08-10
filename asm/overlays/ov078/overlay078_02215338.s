.text
; Matching fallback for the portable implementation in src/overlays/ov078/overlay078_recovery.c.
.extern gTrackedResourceActorRecordTable
.extern data_ov078_02216028
.extern func_ov078_02212ae0
.extern func_ov078_02214124

.global func_ov078_02215338
func_ov078_02215338:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x34
    mov r4, r0
    bl func_ov078_02212ae0
    ldr r1, .L_022153e8
    mov ip, #0x6
    str r1, [r4, #0x0]
    add r0, r4, #0x200
    mov r1, #0x0
    strh r1, [r0, #0xb0]
    strh r1, [r0, #0xb4]
    strh r1, [r0, #0xbc]
    add r0, r4, #0x8
    sub r1, ip, #0x14
    sub r2, ip, #0xc
    mov r3, #0xe
    str ip, [sp, #0x0]
    bl func_ov078_02214124
    mov r0, r4
    ldr r2, [r0, #0x0]
    add r1, sp, #0x4
    ldr r2, [r2, #0xc8]
    blx r2
    mov ip, #0x0
    ldrsb r5, [sp, #0x29]
    ldr r3, .L_022153ec
    mov lr, ip
    mov r0, #0x32
.L_022153a8:
    mul r2, lr, r0
    ldrsh r1, [r3, r2]
    add lr, lr, #0x1
    cmp r5, r1
    addeq ip, r3, r2
    cmp lr, #0x43
    blt .L_022153a8
    str ip, [r4, #0x2b8]
    ldrsh r2, [ip, #0x22]
    add r1, r4, #0x200
    mov r0, r4
    strh r2, [r1, #0xb2]
    ldrsh r2, [ip, #0x26]
    strh r2, [r1, #0xb6]
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, pc}
.L_022153e8: .word data_ov078_02216028
.L_022153ec: .word gTrackedResourceActorRecordTable
.size func_ov078_02215338, . - func_ov078_02215338

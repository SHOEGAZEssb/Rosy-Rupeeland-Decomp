.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.
.extern gTrackedResourceActorRecordTable
.extern data_ov075_02216f90
.extern ActorExtendedType2_Init

.global func_ov075_02212bb8
func_ov075_02212bb8:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x30
    mov r4, r0
    bl ActorExtendedType2_Init
    ldr r0, .L_02212c88
    mov r2, #0x0
    str r0, [r4, #0x0]
    str r2, [r4, #0x298]
    ldr r1, [r4, #0x14]
    add r0, r4, #0x200
    orr r1, r1, #0x150
    str r1, [r4, #0x14]
    ldr r1, [r4, #0x10]
    orr r1, r1, #0x60000
    str r1, [r4, #0x10]
    ldr r1, [r4, #0xd0]
    orr r1, r1, #0x20000
    str r1, [r4, #0xd0]
    ldrsb r0, [r0, #0x7e]
    cmp r0, #0xf
    moveq r2, #0x1
    cmp r2, #0x0
    bne .L_02212c24
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x1d4]
    blx r1
.L_02212c24:
    mov r0, r4
    ldr r2, [r0, #0x0]
    add r1, sp, #0x0
    ldr r2, [r2, #0xc8]
    blx r2
    mov lr, #0x0
    str lr, [r4, #0x2a0]
    ldrsb r1, [sp, #0x25]
    sub r0, lr, #0x1
    cmp r1, r0
    beq .L_02212c7c
    ldr ip, .L_02212c8c
    mov r0, #0x32
.L_02212c58:
    mul r3, lr, r0
    ldrsh r1, [ip, r3]
    ldrsb r2, [sp, #0x25]
    add r3, ip, r3
    add lr, lr, #0x1
    cmp r2, r1
    streq r3, [r4, #0x2a0]
    cmp lr, #0x43
    blt .L_02212c58
.L_02212c7c:
    mov r0, r4
    add sp, sp, #0x30
    ldmia sp!, {r4, pc}
.L_02212c88: .word data_ov075_02216f90
.L_02212c8c: .word gTrackedResourceActorRecordTable
.size func_ov075_02212bb8, . - func_ov075_02212bb8

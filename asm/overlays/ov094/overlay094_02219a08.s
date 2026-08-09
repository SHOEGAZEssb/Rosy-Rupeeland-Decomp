.text
; Matching fallback for the portable implementation in src/overlays/ov094/overlay094_recovery.c.
.extern GameWork_TestFlag
.extern func_02073e48
.extern func_02073ffc
.extern func_0209189c
.extern func_020918f4
.extern gGameWork

.global func_ov094_02219a08
func_ov094_02219a08:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0xc
    mov r7, r0
    add r0, r7, #0x14
    mov r1, #0x100
    bl func_020918f4
    ldr r1, .L_02219acc
    mov r5, r0
    ldr r0, [r1, #0x0]
    ldr r1, .L_02219ad0
    bl GameWork_TestFlag
    cmp r0, #0x0
    add r0, r7, #0x14
    beq .L_02219a4c
    mov r1, #0xc0
    bl func_020918f4
    b .L_02219a54
.L_02219a4c:
    mov r1, #0x180
    bl func_020918f4
.L_02219a54:
    mov r6, r0
    cmp r6, #0xc0
    ldrlt r0, [r7, #0x10]
    mov r1, r7
    ldrge r0, [r7, #0xc]
    mov r2, #0x1
    subge r6, r6, #0xc0
    bl func_02073ffc
    mov r4, r0
    add r0, r7, #0x14
    mov r1, #0x1
    mov r2, #0x2
    bl func_0209189c
    mov r2, #0x0
    str r2, [sp, #0x0]
    mov r1, r0
    str r2, [sp, #0x4]
    mov r0, #0x100
    str r0, [sp, #0x8]
    mov r0, r4
    mov r2, r5
    mov r3, r6
    bl func_02073e48
    add r0, r7, #0x14
    mov r1, #0x80
    mov r2, #0xc0
    bl func_0209189c
    strh r0, [r4, #0x36]
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_02219acc: .word gGameWork
.L_02219ad0: .word 0x3d5
.size func_ov094_02219a08, . - func_ov094_02219a08

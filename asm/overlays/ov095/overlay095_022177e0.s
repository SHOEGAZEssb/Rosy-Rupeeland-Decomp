.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.
.extern gTrackedResourceActorRecordTable
.extern data_ov095_0221cb8c
.extern data_ov095_0221cba8
.extern data_ov095_0221cca0
.extern VecFx32Object_Init
.extern func_ov075_02212ae0
.extern func_ov095_02217980

.global func_ov095_022177e0
func_ov095_022177e0:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x10
    mov r4, r0
    bl func_ov075_02212ae0
    ldr r0, .L_0221796c
    add r1, r4, #0x200
    str r0, [r4, #0x0]
    mov r2, #0x0
    strh r2, [r1, #0xb8]
    strh r2, [r1, #0xba]
    strh r2, [r1, #0xd4]
    strh r2, [r1, #0xd6]
    strh r2, [r1, #0xd8]
    strh r2, [r1, #0xda]
    strh r2, [r1, #0xdc]
    add r0, r4, #0x2e0
    strh r2, [r1, #0xde]
    bl VecFx32Object_Init
    add r0, r4, #0x2f0
    bl VecFx32Object_Init
    ldr r1, [r4, #0x314]
    ldr r0, .L_02217970
    bic r1, r1, #0x1
    orr r1, r1, #0x1
    bic r1, r1, #0x2
    and r0, r1, r0
    bic r0, r0, #0x3f0000
    bic r0, r0, #0x3fc00000
    bic r0, r0, #0x40000000
    bic r0, r0, #0x80000000
    str r0, [r4, #0x314]
    mov r0, #0x2
    strb r0, [r4, #0x318]
    mov r1, #0x0
    strb r1, [r4, #0x319]
    add r0, r4, #0x300
    strh r1, [r0, #0x1a]
    strh r1, [r0, #0x1c]
    strh r1, [r0, #0x1e]
    str r1, [r4, #0x320]
    ldr r1, [r4, #0x260]
    mov r2, #0x8
    bic r1, r1, #0x1000
    str r1, [r4, #0x260]
    add r0, r4, #0x8
    str r2, [sp, #0x0]
    sub r1, r2, #0x26
    sub r2, r2, #0x1c
    mov r3, #0x1e
    bl func_ov095_02217980
    ldr r0, .L_02217974
    ldr r3, .L_02217978
    ldr r1, [r0, #0x18]
    ldr r0, [r0, #0x1c]
    add r2, sp, #0x4
    str r1, [r4, #0x2a4]
    str r0, [r4, #0x2a8]
    mov r1, #0x6
.L_022178c8:
    ldrh r0, [r3], #0x2
    subs r1, r1, #0x1
    strh r0, [r2], #0x2
    bne .L_022178c8
    mov r8, #0x0
    ldr r3, .L_0221797c
    mov lr, r8
    add ip, sp, #0x4
    mov r0, #0x32
.L_022178ec:
    mov r1, r8, lsl #0x1
    ldrsh r7, [ip, r1]
    mov r5, lr
    mov r6, lr
.L_022178fc:
    mul r2, r6, r0
    ldrsh r1, [r3, r2]
    add r6, r6, #0x1
    cmp r1, r7
    addeq r5, r3, r2
    cmp r6, #0x43
    blt .L_022178fc
    add r1, r4, r8, lsl #0x2
    add r8, r8, #0x1
    str r5, [r1, #0x2bc]
    cmp r8, #0x6
    blt .L_022178ec
    mov r2, #0x0
    str r2, [r4, #0x300]
    mov r1, r2
.L_02217938:
    add r0, r4, r2, lsl #0x2
    add r2, r2, #0x1
    str r1, [r0, #0x304]
    cmp r2, #0x4
    blt .L_02217938
    mov r0, #0x14
    strh r0, [r4, #0xda]
    add r1, r4, #0x200
    mov r2, #0x19
    mov r0, r4
    strh r2, [r1, #0x9e]
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_0221796c: .word data_ov095_0221cca0
.L_02217970: .word 0xffff0003
.L_02217974: .word data_ov095_0221cba8
.L_02217978: .word data_ov095_0221cb8c
.L_0221797c: .word gTrackedResourceActorRecordTable
.size func_ov095_022177e0, . - func_ov095_022177e0

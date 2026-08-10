.text
; Matching fallback for the portable implementation in src/overlays/ov089/overlay089_recovery.c.
.extern data_ov089_02219928
.extern ActorDerivedRuntime_Init
.extern func_ov089_02217890

.global func_ov089_022177e4
func_ov089_022177e4:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl ActorDerivedRuntime_Init
    ldr r0, .L_0221788c
    mov r1, #0x0
    str r0, [r5, #0x0]
    str r1, [r5, #0x208]
    add r0, r5, #0x200
    strh r1, [r0, #0xc]
    strh r1, [r0, #0x14]
    strb r1, [r5, #0x216]
    add r0, r5, #0x218
    strb r1, [r5, #0x217]
    bl func_ov089_02217890
    mov r2, #0x0
    str r2, [r5, #0x224]
    str r2, [r5, #0x228]
    add r0, r5, #0x200
    strh r2, [r0, #0x34]
    mov r1, #0x1f4
    strh r1, [r0, #0x36]
    mov r1, #0x1800
    str r1, [r5, #0x238]
    strh r2, [r0, #0x3c]
    ldr r0, [r5, #0x14]
    tst r0, #0x400
    ldrne r0, [r5, #0xd0]
    orrne r0, r0, #0x4
    strne r0, [r5, #0xd0]
    ldr r1, [r4, #0x2c]
    cmp r1, #0x0
    beq .L_02217878
    mov r0, r5
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x74]
    blx r2
.L_02217878:
    mov r1, #0x0
    str r1, [r5, #0x240]
    mov r0, r5
    str r1, [r5, #0x244]
    ldmia sp!, {r3, r4, r5, pc}
.L_0221788c: .word data_ov089_02219928
.size func_ov089_022177e4, . - func_ov089_022177e4

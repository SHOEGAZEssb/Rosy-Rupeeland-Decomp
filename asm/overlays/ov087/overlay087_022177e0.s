.text
; Matching fallback for the portable implementation in src/overlays/ov087/overlay087_recovery.c.
.extern data_ov087_022189e0
.extern ActorDerivedRuntime_Init

.global func_ov087_022177e0
func_ov087_022177e0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl ActorDerivedRuntime_Init
    ldr r0, .L_02217880
    mov r2, #0x0
    str r0, [r5, #0x0]
    ldr r1, .L_02217884
    str r2, [r5, #0x208]
    str r1, [r5, #0x20c]
    ldr r0, .L_02217888
    mov r1, #0xf
    str r0, [r5, #0x210]
    add r0, r5, #0x200
    strh r2, [r0, #0x14]
    strh r2, [r0, #0x16]
    strh r1, [r0, #0x18]
    strh r2, [r0, #0x1a]
    strh r2, [r0, #0x1c]
    strh r2, [r0, #0x1e]
    str r2, [r5, #0x220]
    strh r2, [r0, #0x24]
    mov r1, #0xc
    strh r1, [r0, #0x26]
    str r2, [r5, #0x228]
    str r2, [r5, #0x22c]
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
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
.L_02217880: .word data_ov087_022189e0
.L_02217884: .word 0x4cd
.L_02217888: .word 0x19a
.size func_ov087_022177e0, . - func_ov087_022177e0

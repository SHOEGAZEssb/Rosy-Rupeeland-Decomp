.text
; Matching fallback for the portable implementation in src/overlays/ov092/overlay092_recovery.c.
.extern Actor_RebuildPrimaryAttachment
.extern func_ov092_022177e0

.global func_ov092_0221a0a0
func_ov092_0221a0a0:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    mov r5, r0
    mov r4, r1
    add r1, r5, #0x1f0
    mov r0, #0xc
    mla r0, r4, r0, r1
    mov r1, r2
    mov r2, r3
    mov ip, #0x1
    ldr r3, [sp, #0x18]
    str ip, [sp, #0x0]
    ldr r6, [sp, #0x1c]
    bl func_ov092_022177e0
    mov r0, #0x2
    str r0, [sp, #0x0]
    add r0, r5, r4, lsl #0x2
    ldrh r1, [r6, #0x0]
    ldrh r2, [r6, #0x2]
    ldr r0, [r0, #0x22c]
    ldrh r3, [r6, #0x4]
    bl Actor_RebuildPrimaryAttachment
    add r0, r5, r4, lsl #0x2
    ldr r0, [r0, #0x22c]
    ldr r1, [r0, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
.size func_ov092_0221a0a0, . - func_ov092_0221a0a0

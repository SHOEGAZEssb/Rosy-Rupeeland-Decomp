.text
; Matching fallback for the portable implementation in src/overlays/ov089/overlay089_recovery.c.
.extern func_02005afc

.global func_ov089_02217c14
func_ov089_02217c14:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r2, #0x4
    mov r4, r0
    str r2, [sp, #0x0]
    mov r3, r1
    ldr r0, [r4, #0x4]
    ldmib r3, {r1, r2, r3}
    bl func_02005afc
    ldr r3, [r4, #0x4]
    ldrsh r0, [r4, #0x18]
    ldrh r2, [r3, #0x28]
    mov r1, #0x1
    add r0, r2, r0
    strh r0, [r3, #0x28]
    ldr r0, [r4, #0x4]
    strb r1, [r0, #0x3a]
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
.size func_ov089_02217c14, . - func_ov089_02217c14

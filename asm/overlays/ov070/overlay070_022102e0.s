.text
; Matching fallback for the portable implementation in src/overlays/ov070/overlay070_recovery.c.

.global func_ov070_022102e0
func_ov070_022102e0:
    mov ip, #0x80000
    str ip, [r0, #0xd4]
    mov r1, r1, lsl #0xc
    str r1, [r0, #0xd8]
    str ip, [r0, #0xe0]
    ldr r3, [r0, #0xd8]
    mov r1, r2, lsl #0xc
    add r2, r3, #0x20000
    str r2, [r0, #0xe4]
    str ip, [r0, #0x60]
    str r1, [r0, #0x64]
    add r1, r0, #0x100
    mov r2, #0x0
    strh r2, [r1, #0x40]
    str r2, [r0, #0x144]
    bx lr
.size func_ov070_022102e0, . - func_ov070_022102e0

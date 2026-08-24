.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.
.extern gFx32CosSinTable

.global func_ov095_0221aedc
func_ov095_0221aedc:
    add r3, r0, #0x200
    ldrsh r3, [r3, #0xdc]
    ldr ip, .L_0221af08
    mov r3, r3, lsl #0x1a
    mov r3, r3, lsr #0x10
    mov r3, r3, asr #0x4
    mov r3, r3, lsl #0x2
    ldrsh r3, [ip, r3]
    mla r1, r2, r3, r1
    str r1, [r0, #0x24]
    bx lr
.L_0221af08: .word gFx32CosSinTable
.size func_ov095_0221aedc, . - func_ov095_0221aedc

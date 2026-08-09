.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.

.global func_ov075_02213368
func_ov075_02213368:
    ldr r2, [r0, #0x24]
    sub r1, r2, r1
    mov r1, r1, asr #0xc
    add r1, r1, #0x100
    mov r1, r1, lsl #0x10
    mov r1, r1, asr #0x10
    cmp r1, #0x20
    movlt r1, #0x20
    blt .L_02213394
    cmp r1, #0x200
    movgt r1, #0x200
.L_02213394:
    ldr r0, [r0, #0x54]
    strh r1, [r0, #0x32]
    strh r1, [r0, #0x34]
    bx lr
.size func_ov075_02213368, . - func_ov075_02213368

.text
; Matching fallback for the portable implementation in src/overlays/ov090/overlay090_recovery.c.

.global func_ov090_0221bc0c
func_ov090_0221bc0c:
    ldr r2, [r0, #0x14]
    sub r1, r2, r1
    mov r1, r1, asr #0xc
    mov r1, r1, lsl #0x2
    add r1, r1, #0x100
    mov r1, r1, lsl #0x10
    mov r2, r1, asr #0x10
    cmp r2, #0x20
    movlt r2, #0x20
    blt .L_0221bc3c
    cmp r2, #0x200
    movgt r2, #0x200
.L_0221bc3c:
    ldr r1, [r0, #0x4]
    ldr r0, [r1, #0x4]
    strh r2, [r0, #0x32]
    strh r2, [r0, #0x34]
    ldr r0, [r1, #0x8]
    strh r2, [r0, #0x32]
    strh r2, [r0, #0x34]
    bx lr
.size func_ov090_0221bc0c, . - func_ov090_0221bc0c

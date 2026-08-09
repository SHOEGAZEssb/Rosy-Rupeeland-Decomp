.text
; Matching fallback for the portable implementation in src/overlays/ov079/overlay079_recovery.c.
.extern data_ov079_02213b08

.global func_ov079_02213908
func_ov079_02213908:
    mov r2, #0x2
    ldr r1, .L_02213938
    strh r2, [r0, #0xd6]
    ldr r3, [r1, #0x50]
    ldr r2, [r1, #0x54]
    str r3, [r0, #0x298]
    str r2, [r0, #0x29c]
    ldr r2, [r1, #0x48]
    ldr r1, [r1, #0x4c]
    str r2, [r0, #0x220]
    str r1, [r0, #0x224]
    bx lr
.L_02213938: .word data_ov079_02213b08
.size func_ov079_02213908, . - func_ov079_02213908

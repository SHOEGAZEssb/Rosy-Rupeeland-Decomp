.text
; Matching fallback for the portable implementation in src/overlays/ov085/overlay085_recovery.c.
.extern func_ov085_02213ae4

.global func_ov085_02213d2c
func_ov085_02213d2c:
    mov r2, #0x2000
    str r2, [r0, #0xcc]
    str r2, [r0, #0xc8]
    mov r1, #0x1
    strb r1, [r0, #0xd5]
    strb r1, [r0, #0xd4]
    ldr ip, .L_02213d58
    add r1, r0, #0x100
    mov r2, #0x0
    strh r2, [r1, #0xea]
    bx ip
.L_02213d58: .word func_ov085_02213ae4
.size func_ov085_02213d2c, . - func_ov085_02213d2c

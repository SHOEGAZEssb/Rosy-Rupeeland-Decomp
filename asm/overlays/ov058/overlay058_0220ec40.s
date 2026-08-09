.text
; Matching fallback for the portable implementation in src/overlays/ov058/overlay058_recovery.c.

.global func_ov058_0220ec40
func_ov058_0220ec40:
    stmdb sp!, {r3, lr}
    ldr r2, .L_0220ec9c
    ldr r3, [r0, #0x48]
    ldr r1, [r0, #0x4c]
    sub lr, r3, #0x20
    ldr ip, .L_0220eca0
    sub r3, r1, #0x1e
    mov r1, r2, lsl #0x10
    and lr, lr, r2
    and r1, r1, r3, lsl #0x10
    orr r1, lr, r1
    str r1, [ip, #0x0]
    ldr r1, [r0, #0x48]
    ldr r0, [r0, #0x4c]
    sub r3, r1, #0x20
    sub r1, r0, #0xde
    mov r0, r2, lsl #0x10
    and r2, r3, r2
    and r0, r0, r1, lsl #0x10
    orr r1, r2, r0
    add r0, ip, #0x1000
    str r1, [r0, #0x0]
    ldmia sp!, {r3, pc}
.L_0220ec9c: .word 0x1ff
.L_0220eca0: .word 0x4000014
.size func_ov058_0220ec40, . - func_ov058_0220ec40

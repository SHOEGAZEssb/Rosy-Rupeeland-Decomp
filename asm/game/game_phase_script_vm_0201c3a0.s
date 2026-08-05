; Matching retail form; see src/graphics/sub_bg_control.c.
.text
.global func_0201c3a0
func_0201c3a0: ; 0x0201c3a0
    stmdb sp!, {r3, lr}
    ldr lr, L_0201c3c8
    ldrh ip, [lr, #0x0]
    and ip, ip, #0x43
    orr r0, ip, r0, lsl #0xe
    orr r0, r0, r1, lsl #0x7
    orr r0, r0, r2, lsl #0x8
    orr r0, r0, r3, lsl #0x2
    strh r0, [lr, #0x0]
    ldmia sp!, {r3, pc}
L_0201c3c8: .word 0x400100c
.size func_0201c3a0, . - func_0201c3a0

.text
; Matching fallback for the portable implementation in src/overlays/ov092/overlay092_recovery.c.

.global func_ov092_0221b120
func_ov092_0221b120:
    stmdb sp!, {r4, lr}
    ldr r1, [r0, #0x0]
    mov r4, r0
    ldr r1, [r1, #0xd0]
    blx r1
    cmp r0, #0x0
    ldmneia sp!, {r4, pc}
    add r0, r4, #0x100
    ldrsh r0, [r0, #0xf8]
    cmp r0, #0x8
    ldrgt r0, [r4, #0x10]
    bicgt r0, r0, #0x40000
    strgt r0, [r4, #0x10]
    ldmia sp!, {r4, pc}
.size func_ov092_0221b120, . - func_ov092_0221b120

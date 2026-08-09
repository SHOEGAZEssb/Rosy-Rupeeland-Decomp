.text
; Matching fallback for the portable implementation in src/overlays/ov092/overlay092_recovery.c.
.extern func_02050e2c

.global func_ov092_0221a8ec
func_ov092_0221a8ec:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02050e2c
    ldr r0, [r4, #0x14]
    orr r0, r0, #0x800000
    str r0, [r4, #0x14]
    ldmia sp!, {r4, pc}
.size func_ov092_0221a8ec, . - func_ov092_0221a8ec

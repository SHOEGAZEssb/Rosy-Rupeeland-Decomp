.text
; Matching fallback for the portable implementation in src/overlays/ov066/overlay066_recovery.c.
.extern data_021052fc
.extern func_0200e9e0
.extern func_0201218c

.global func_ov066_02210410
func_ov066_02210410:
    stmdb sp!, {r3, lr}
    ldr r0, .L_02210440
    ldr r0, [r0, #0x0]
    add r0, r0, #0x24
    bl func_0200e9e0
    ldr r0, .L_02210440
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xfb8]
    bl func_0201218c
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_02210440: .word data_021052fc
.size func_ov066_02210410, . - func_ov066_02210410

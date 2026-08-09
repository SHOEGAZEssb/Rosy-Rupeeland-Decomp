.text
; Matching fallback for the portable implementation in src/overlays/ov061/overlay061_recovery.c.
.extern data_021052fc

.global func_ov061_0221009c
func_ov061_0221009c:
    stmdb sp!, {r4, lr}
    ldr r1, .L_022100d8
    mov r4, r0
    ldr r0, [r1, #0x0]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    ldr r0, [r4, #0x28]
    ldr r1, .L_022100dc
    cmp r0, #0x0
    moveq r0, #0x5000000
    ldrne r0, .L_022100e0
    strh r1, [r0, #0x0]
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_022100d8: .word data_021052fc
.L_022100dc: .word 0x7fff
.L_022100e0: .word 0x5000400
.size func_ov061_0221009c, . - func_ov061_0221009c

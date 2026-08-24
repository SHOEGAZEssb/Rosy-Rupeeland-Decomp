.text
; Matching fallback for the portable implementation in src/overlays/ov060/overlay060_recovery.c.
.extern gGamePhaseRuntime

.global func_ov060_02210430
func_ov060_02210430:
    stmdb sp!, {r3, lr}
    ldr r0, .L_0221044c
    ldr r0, [r0, #0x0]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x10]
    blx r1
    ldmia sp!, {r3, pc}
.L_0221044c: .word gGamePhaseRuntime
.size func_ov060_02210430, . - func_ov060_02210430

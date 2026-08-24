.text
; Matching fallback for the portable implementation in src/overlays/ov072/overlay072_recovery.c.
.extern gGamePhaseRuntime

.global func_ov072_022107d4
func_ov072_022107d4:
    stmdb sp!, {r3, lr}
    ldr r0, .L_022107f4
    ldr r0, [r0, #0x0]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_022107f4: .word gGamePhaseRuntime
.size func_ov072_022107d4, . - func_ov072_022107d4

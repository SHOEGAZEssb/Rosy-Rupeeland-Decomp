.text
; Matching fallback for the portable implementation in src/overlays/ov062/overlay062_recovery.c.
.extern gGamePhaseRuntime

.global func_ov062_02211acc
func_ov062_02211acc:
    stmdb sp!, {r3, lr}
    ldr r0, .L_02211aec
    ldr r0, [r0, #0x0]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_02211aec: .word gGamePhaseRuntime
.size func_ov062_02211acc, . - func_ov062_02211acc

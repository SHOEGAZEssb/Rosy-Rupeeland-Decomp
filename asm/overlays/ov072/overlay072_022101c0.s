.text
; Matching fallback for the portable implementation in src/overlays/ov072/overlay072_recovery.c.
.extern data_021052fc
.extern GamePhaseRuntime_UpdateActorPresentationState
.extern func_ov072_02210214

.global func_ov072_022101c0
func_ov072_022101c0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl func_ov072_02210214
    ldr r1, .L_02210210
    mov r4, r0
    ldr r0, [r1, #0x0]
    mov r1, #0x2
    bl GamePhaseRuntime_UpdateActorPresentationState
    cmp r4, #0x0
    beq .L_02210208
    cmp r5, #0x0
    beq .L_02210200
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02210200:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_02210208:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_02210210: .word data_021052fc
.size func_ov072_022101c0, . - func_ov072_022101c0

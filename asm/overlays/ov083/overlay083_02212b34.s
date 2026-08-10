.text
; Matching fallback for the portable implementation in src/overlays/ov083/overlay083_recovery.c.
.extern ActorExtendedType2_InitializeReentryState

.global func_ov083_02212b34
func_ov083_02212b34:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorExtendedType2_InitializeReentryState
    ldr r0, [r4, #0x1fc]
    cmp r0, #0x0
    ldmgtia sp!, {r4, pc}
    ldr r0, [r4, #0x298]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x1dc]
    blx r1
    ldmia sp!, {r4, pc}
.size func_ov083_02212b34, . - func_ov083_02212b34

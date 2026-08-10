.text
; Matching fallback for the portable implementation in src/overlays/ov066/overlay066_recovery.c.
.extern data_021052fc
.extern GamePhaseState_UpdateRenderHelpers
.extern GamePhaseAreaScene_Update

.global func_ov066_02210410
func_ov066_02210410:
    stmdb sp!, {r3, lr}
    ldr r0, .L_02210440
    ldr r0, [r0, #0x0]
    add r0, r0, #0x24
    bl GamePhaseState_UpdateRenderHelpers
    ldr r0, .L_02210440
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xfb8]
    bl GamePhaseAreaScene_Update
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_02210440: .word data_021052fc
.size func_ov066_02210410, . - func_ov066_02210410

.text
; Matching fallback for the portable implementation in src/overlays/ov074/overlay074_recovery.c.
.extern data_021052fc
.extern func_02005058
.extern SplineMover_Evaluate2D
.extern GamePhaseAreaScene_ApplyPlacementState
.extern ActorCollection_DispatchEventToActors

.global func_ov074_022107f8
func_ov074_022107f8:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x20
    ldr r0, .L_02210874
    mov r5, r1
    ldr r0, [r0, #0x0]
    mov r1, #0x0
    add r0, r0, #0x2000
    ldr r4, [r0, #0xfb8]
    add r0, r4, #0x2000
    ldr r0, [r0, #0xebc]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x54]
    blx r2
    add r0, sp, #0x10
    mov r1, r5
    bl SplineMover_Evaluate2D
    add r1, sp, #0x10
    mov r0, r4
    bl GamePhaseAreaScene_ApplyPlacementState
    add r0, sp, #0x10
    bl func_02005058
    add r0, sp, #0x0
    mov r1, r5
    bl SplineMover_Evaluate2D
    add r1, sp, #0x0
    add r0, r4, #0x8
    bl ActorCollection_DispatchEventToActors
    add r0, sp, #0x0
    bl func_02005058
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, pc}
.L_02210874: .word data_021052fc
.size func_ov074_022107f8, . - func_ov074_022107f8

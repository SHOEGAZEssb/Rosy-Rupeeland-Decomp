.text
; Matching fallback for the portable implementation in src/overlays/ov107/overlay107_recovery.c.
.extern data_ov107_0221d720
.extern data_ov107_0221d734
.extern data_ov107_0221fb89
.extern data_ov107_02229d20
.extern data_ov107_02229d24
.extern GamePhaseRuntime_SetGlobalValue30F8
.extern ActorInteractionRuntime_Init
.extern ActorInteractionRuntime_NoOp
.extern ActorDescriptorBatch_RegisterAndSpawnCategory1
.extern ActorDescriptorBatch_SetCategory1Callback

.global Overlay107_RegisterCategory1Actors
Overlay107_RegisterCategory1Actors:
    stmdb sp!, {r3, lr}
    cmp r0, #0x0
    ldmneia sp!, {r3, pc}
    bl ActorInteractionRuntime_Init
    ldr r0, .L_0221d6fc
    ldr r2, .L_0221d700
    mov r1, #0x3
    bl ActorDescriptorBatch_RegisterAndSpawnCategory1
    ldr r0, .L_0221d704
    bl ActorInteractionRuntime_NoOp
    ldr r0, .L_0221d708
    bl GamePhaseRuntime_SetGlobalValue30F8
    ldr r0, .L_0221d70c
    bl ActorDescriptorBatch_SetCategory1Callback
    ldmia sp!, {r3, pc}
.L_0221d6fc: .word data_ov107_02229d24
.L_0221d700: .word data_ov107_0221d734
.L_0221d704: .word data_ov107_02229d20
.L_0221d708: .word data_ov107_0221d720
.L_0221d70c: .word data_ov107_0221fb89
.size Overlay107_RegisterCategory1Actors, . - Overlay107_RegisterCategory1Actors

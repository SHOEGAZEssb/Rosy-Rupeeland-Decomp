.text
; Matching fallback for the portable implementation in src/overlays/ov115/overlay115_recovery.c.
.extern data_ov115_0221d72c
.extern data_ov115_0221d740
.extern data_ov115_0221efc9
.extern data_ov115_02227660
.extern data_ov115_02227664
.extern GamePhaseRuntime_SetGlobalValue30F8
.extern ActorInteractionRuntime_Init
.extern ActorInteractionRuntime_NoOp
.extern ActorDescriptorBatch_RegisterAndSpawnCategory1
.extern ActorDescriptorBatch_SetCategory1Callback

.global func_ov115_0221d6c0
func_ov115_0221d6c0:
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
.L_0221d6fc: .word data_ov115_02227664
.L_0221d700: .word data_ov115_0221d740
.L_0221d704: .word data_ov115_02227660
.L_0221d708: .word data_ov115_0221d72c
.L_0221d70c: .word data_ov115_0221efc9
.size func_ov115_0221d6c0, . - func_ov115_0221d6c0

.text
; Matching fallback for the portable implementation in src/overlays/ov114/overlay114_recovery.c.
.extern data_ov114_0221d720
.extern data_ov114_0221d728
.extern data_ov114_0221d7a4
.extern data_ov114_0221eb91
.extern data_ov114_022203a0
.extern func_02008f58
.extern ActorInteractionRuntime_Init
.extern ActorInteractionRuntime_NoOp
.extern ActorDescriptorBatch_RegisterAndSpawnCategory1
.extern ActorDescriptorBatch_SetCategory1Callback

.global func_ov114_0221d6c0
func_ov114_0221d6c0:
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
    bl func_02008f58
    ldr r0, .L_0221d70c
    bl ActorDescriptorBatch_SetCategory1Callback
    ldmia sp!, {r3, pc}
.L_0221d6fc: .word data_ov114_022203a0
.L_0221d700: .word data_ov114_0221d7a4
.L_0221d704: .word data_ov114_0221d720
.L_0221d708: .word data_ov114_0221d728
.L_0221d70c: .word data_ov114_0221eb91
.size func_ov114_0221d6c0, . - func_ov114_0221d6c0

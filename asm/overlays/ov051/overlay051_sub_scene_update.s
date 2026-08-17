.text
; Matching fallback for the portable implementation in src/overlays/ov051/overlay051_sub_scene_recovery.c.
.extern GameWork_ClearFlag
.extern GameWork_TestFlag
.extern data_021052fc
.extern GamePhaseRuntime_GetActorCollection
.extern GamePhaseRuntime_ApplyScreenMode
.extern ActorCollection_SetEnabled
.extern func_ov051_0220d688
.extern gGameWork

.global func_ov051_0220da24
func_ov051_0220da24:
    stmdb sp!, {r4, lr}
    ldr r1, .L_0220da98
    mov r4, r0
    ldr r0, [r1, #0x0]
    mov r1, #0x2
    bl GamePhaseRuntime_GetActorCollection
    mov r1, #0x1
    bl ActorCollection_SetEnabled
    ldr r0, .L_0220da9c
    ldr r1, .L_0220daa0
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    beq .L_0220da88
    ldr r0, .L_0220da9c
    ldr r1, .L_0220daa0
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r0, .L_0220da98
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    mov r2, r1
    bl GamePhaseRuntime_ApplyScreenMode
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_0220da88:
    mov r0, r4
    bl func_ov051_0220d688
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_0220da98: .word data_021052fc
.L_0220da9c: .word gGameWork
.L_0220daa0: .word 0x40b
.size func_ov051_0220da24, . - func_ov051_0220da24

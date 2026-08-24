.text
; Matching fallback for the portable implementation in src/overlays/ov091/overlay091_recovery.c.
.extern gGamePhaseRuntime
.extern VecFx32Object_InitComponents
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern GamePhaseRuntime_FinalizeActorCollections
.extern GamePhaseRuntime_SynchronizeActorPlacement
.extern ActorMotion_SetTarget
.extern func_ov091_0221888c
.extern func_ov091_022188f8

.global func_ov091_02218930
func_ov091_02218930:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x40
    mov r4, r0
    ldr r1, [r4, #0x220]
    ldr r0, .L_02218a40
    add r1, r1, #0x52
    str r1, [r4, #0x220]
    cmp r1, r0
    strgt r0, [r4, #0x220]
    ldr r1, [r4, #0x1f0]
    add r0, r4, #0x210
    add r1, r1, #0x18
    bl VecFx32Object_Assign
    ldr r2, [r4, #0x220]
    add r0, sp, #0x20
    add r1, r4, #0x18
    rsb r2, r2, #0x1000
    bl func_ov091_0221888c
    ldr r2, [r4, #0x220]
    add r0, sp, #0x10
    add r1, r4, #0x210
    bl func_ov091_0221888c
    add r0, sp, #0x0
    add r1, sp, #0x20
    add r2, sp, #0x10
    bl func_ov091_022188f8
    add r0, r4, #0x18
    add r1, sp, #0x0
    bl VecFx32Object_Assign
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
    add r0, sp, #0x10
    bl VecFx32Object_Destroy
    add r0, sp, #0x20
    bl VecFx32Object_Destroy
    ldr r1, [r4, #0x24]
    add r0, sp, #0x30
    add r1, r1, r1, lsr #0x1f
    mov r1, r1, asr #0x1
    rsb r1, r1, #0x0
    sub r2, r1, #0x74000
    mov r1, #0x80000
    rsb r1, r1, #0x0
    mov r3, #0x0
    bl VecFx32Object_InitComponents
    ldr r0, .L_02218a44
    add r1, sp, #0x30
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotion_SetTarget
    ldr r0, .L_02218a44
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_SynchronizeActorPlacement
    ldr r0, .L_02218a44
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_SynchronizeActorPlacement
    ldr r0, .L_02218a44
    mov r1, #0x2
    ldr r0, [r0, #0x0]
    mov r2, #0x3
    bl GamePhaseRuntime_FinalizeActorCollections
    add r0, sp, #0x30
    bl VecFx32Object_Destroy
    add sp, sp, #0x40
    ldmia sp!, {r4, pc}
.L_02218a40: .word 0xccd
.L_02218a44: .word gGamePhaseRuntime
.size func_ov091_02218930, . - func_ov091_02218930

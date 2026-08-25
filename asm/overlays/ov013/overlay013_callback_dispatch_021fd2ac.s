    .text
    .extern gGamePhaseRuntime
    .extern GamePhaseRuntime_FinalizeActorCollections

/* Exact fallback; see the documented portable reconstruction in
 * src/overlays/ov013/overlay013_scene_lifecycle.c. */
    .global Overlay013_DispatchSceneCallback

Overlay013_DispatchSceneCallback:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x9a8]
    cmp r0, #0x0
    bne L_021fd2d4
    ldr r0, L_021fd30c
    mov r1, #0x9
    ldr r0, [r0, #0x0]
    mov r2, #0x2
    bl GamePhaseRuntime_FinalizeActorCollections
L_021fd2d4:
    ldr r0, [r4, #0x24]
    cmp r0, #0x0
    beq L_021fd304
    ldr r0, [r4, #0x28]
    tst r0, #0x1
    add r0, r4, r0, asr #0x1
    ldrne r2, [r0, #0x0]
    ldrne r1, [r4, #0x24]
    ldrne r1, [r2, r1]
    ldreq r1, [r4, #0x24]
    blx r1
    ldmia sp!, {r4, pc}
L_021fd304:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_021fd30c: .word gGamePhaseRuntime
    .size Overlay013_DispatchSceneCallback, . - Overlay013_DispatchSceneCallback

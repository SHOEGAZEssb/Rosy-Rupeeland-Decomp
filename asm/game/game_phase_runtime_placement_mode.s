; Matching retail form; see src/game/game_phase_runtime_placement_mode.c for
; the documented portable implementation and recovered behavior.
.text
.extern func_0200500c
.extern func_02005058
.extern GamePhaseRuntime_PrepareActorCollections
.extern GamePhaseRuntime_SynchronizeActorPlacement
.extern GamePhaseRuntime_GetActiveAreaPlacementVariant
.extern ActorMotion_SetTarget
.extern ActorMotion_UpdateFromBoundActor
.extern GamePhaseAreaScene_SetEnabled
.extern OS_Halt

    .global GamePhaseRuntime_SetPlacementMode
.type GamePhaseRuntime_SetPlacementMode, @function
GamePhaseRuntime_SetPlacementMode:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x40
    mov r7, r0
    mov r6, r1
    add r1, r7, #0x3000
    ldr r4, [r1, #0xfc]
    mov r5, r2
    cmp r6, #0x3
    addls pc, pc, r6, lsl #0x2
    b L_02008aa4
L_020088e0: ; jump table
    b L_020088f0 ; case 0
    b L_0200891c ; case 1
    b L_020089f8 ; case 2
    b L_02008a60 ; case 3
L_020088f0:
    ldr r0, [r1, #0xe8]
    mov r1, #0x0
    ldr r3, [r0, #0x0]
    mov r2, #0x1f
    ldr r3, [r3, #0xc]
    blx r3
    add r0, r7, #0x2000
    ldr r0, [r0, #0xfb8]
    mov r1, #0x0
    bl GamePhaseAreaScene_SetEnabled
    b L_02008aa8
L_0200891c:
    bl GamePhaseRuntime_GetActiveAreaPlacementVariant
    cmp r0, #0x0
    beq L_02008938
    cmp r0, #0x1
    cmpne r0, #0x2
    beq L_02008998
    b L_02008aa8
L_02008938:
    add r0, r7, #0x3000
    ldr r0, [r0, #0xe8]
    mov r1, #0x1
    ldr r3, [r0, #0x0]
    mov r2, #0x1f
    ldr r3, [r3, #0xc]
    blx r3
    mov r1, #0x58000
    rsb r1, r1, #0x0
    add r0, sp, #0x30
    add r2, r1, #0x14000
    mov r3, #0x0
    bl func_0200500c
    add r0, r7, #0x44
    add r1, sp, #0x30
    add r0, r0, #0x3000
    bl ActorMotion_SetTarget
    add r0, sp, #0x30
    bl func_02005058
    add r0, r7, #0x2000
    ldr r0, [r0, #0xfb8]
    mov r1, #0x1
    bl GamePhaseAreaScene_SetEnabled
    b L_02008aa8
L_02008998:
    add r0, r7, #0x3000
    ldr r0, [r0, #0xe8]
    mov r1, #0x0
    ldr r3, [r0, #0x0]
    mov r2, #0x1f
    ldr r3, [r3, #0xc]
    blx r3
    mov r1, #0x80000
    rsb r1, r1, #0x0
    add r0, sp, #0x20
    add r2, r1, #0xc000
    mov r3, #0x0
    bl func_0200500c
    add r0, r7, #0x44
    add r1, sp, #0x20
    add r0, r0, #0x3000
    bl ActorMotion_SetTarget
    add r0, sp, #0x20
    bl func_02005058
    add r0, r7, #0x2000
    ldr r0, [r0, #0xfb8]
    mov r1, #0x1
    bl GamePhaseAreaScene_SetEnabled
    b L_02008aa8
L_020089f8:
    ldr r0, [r1, #0xe8]
    mov r1, #0x0
    ldr r3, [r0, #0x0]
    mov r2, #0x1f
    ldr r3, [r3, #0xc]
    blx r3
    mov r1, #0x80000
    rsb r1, r1, #0x0
    add r0, sp, #0x10
    add r2, r1, #0x20000
    mov r3, #0x0
    bl func_0200500c
    add r0, r7, #0x44
    add r1, sp, #0x10
    add r0, r0, #0x3000
    bl ActorMotion_SetTarget
    add r0, sp, #0x10
    bl func_02005058
    add r0, r7, #0x44
    add r0, r0, #0x3000
    bl ActorMotion_UpdateFromBoundActor
    add r0, r7, #0x2000
    ldr r0, [r0, #0xfb8]
    mov r1, #0x1
    bl GamePhaseAreaScene_SetEnabled
    b L_02008aa8
L_02008a60:
    mov r1, #0x58000
    rsb r1, r1, #0x0
    add r0, sp, #0x0
    add r2, r1, #0x14000
    mov r3, #0x0
    bl func_0200500c
    add r0, r7, #0x44
    add r1, sp, #0x0
    add r0, r0, #0x3000
    bl ActorMotion_SetTarget
    add r0, sp, #0x0
    bl func_02005058
    add r0, r7, #0x2000
    ldr r0, [r0, #0xfb8]
    mov r1, #0x1
    bl GamePhaseAreaScene_SetEnabled
    b L_02008aa8
L_02008aa4:
    bl OS_Halt
L_02008aa8:
    cmp r5, #0x0
    cmpne r6, #0x0
    beq L_02008ae4
    ldr r1, [r7, #0x4]
    mov r0, r7
    mov r2, #0x3
    bl GamePhaseRuntime_PrepareActorCollections
    mov r0, r7
    mov r1, #0x1
    bl GamePhaseRuntime_SynchronizeActorPlacement
    add r0, r7, #0x3000
    ldr r0, [r0, #0xe8]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x10]
    blx r1
L_02008ae4:
    add r1, r7, #0x3000
    mov r0, r4
    str r6, [r1, #0xfc]
    add sp, sp, #0x40
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
    .size GamePhaseRuntime_SetPlacementMode, .-GamePhaseRuntime_SetPlacementMode


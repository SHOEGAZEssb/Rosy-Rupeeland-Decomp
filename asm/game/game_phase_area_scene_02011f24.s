; Matching retail form; see src/game/game_phase_area_scene_lifecycle.c.
.text
.extern data_020d5680
.extern gGamePhaseRuntime
.extern VecFx32Object_Destroy
.extern OverlaySlot_Destroy
.extern RuntimePresentationManager_DetachEffectsByKey
.extern ActorCollection_Destructor
.extern ActorCollection_UnregisterAndDestroyAllActors

    .global GamePhaseAreaScene_Destroy
GamePhaseAreaScene_Destroy: ; 0x02011f24
    stmdb sp!, {r4, lr}
    ldr r1, L_02011f90
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, L_02011f94
    mov r1, #0x37
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl RuntimePresentationManager_DetachEffectsByKey
    add r0, r4, #0x8
    bl ActorCollection_UnregisterAndDestroyAllActors
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq L_02011f6c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_02011f6c:
    add r0, r4, #0x2ec0
    bl VecFx32Object_Destroy
    add r0, r4, #0xeb0
    add r0, r0, #0x2000
    bl OverlaySlot_Destroy
    add r0, r4, #0x8
    bl ActorCollection_Destructor
    mov r0, r4
    ldmia sp!, {r4, pc}
L_02011f90: .word data_020d5680
L_02011f94: .word gGamePhaseRuntime
    .size GamePhaseAreaScene_Destroy, . - GamePhaseAreaScene_Destroy


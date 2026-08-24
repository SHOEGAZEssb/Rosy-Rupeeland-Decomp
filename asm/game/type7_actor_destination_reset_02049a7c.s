; Matching retail form; see src/game/type7_actor_destination_motion.c.
.extern gGamePhaseRuntime
.extern ActorDerivedType1_SetSpecialModeEnabled
.extern Type7Actor_SelectRandomCallback
.text
    .global Type7Actor_CompleteDestinationMotion
.type Type7Actor_CompleteDestinationMotion, @function
Type7Actor_CompleteDestinationMotion: ; 0x02049a7c
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x268]
    ldr r0, .L_02049acc
    ldr r2, .L_02049ad0
    and r0, r1, r0
    str r0, [r4, #0x268]
    ldr r0, [r4, #0x14]
    mov r1, #0x0
    bic r3, r0, #0x2
    bic r0, r3, #0x4
    orr r0, r0, #0x2000000
    str r0, [r4, #0x14]
    ldr r0, [r2, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    bl ActorDerivedType1_SetSpecialModeEnabled
    mov r0, r4
    bl Type7Actor_SelectRandomCallback
    ldmia sp!, {r4, pc}
.L_02049acc: .word 0xfff7fffb
.L_02049ad0: .word gGamePhaseRuntime
.size Type7Actor_CompleteDestinationMotion, . - Type7Actor_CompleteDestinationMotion


; Matching retail form; see src/game/actor_runtime_scene_callbacks.c for
; the documented portable implementation and recovered behavior.
.text
.extern gGamePhaseRuntime
.global ActorRuntimeScene_End
ActorRuntimeScene_End:
    stmdb sp!, {r3, lr}
    ldr r0, L_0200b800
    ldr r0, [r0, #0x0]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x10]
    blx r1
    mov r0, #0x0
    ldmia sp!, {r3, pc}
L_0200b800: .word gGamePhaseRuntime
.size ActorRuntimeScene_End, . - ActorRuntimeScene_End


; Matching retail form; see src/game/actor_runtime_scene_callbacks.c for
; the documented portable implementation and recovered behavior.
.text
.extern data_021052fc
.global ActorRuntimeScene_Begin
ActorRuntimeScene_Begin:
    stmdb sp!, {r3, lr}
    ldr r0, L_0200b7dc
    ldr r0, [r0, #0x0]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xc]
    blx r1
    mov r0, #0x0
    mov r1, #0x5000000
    strh r0, [r1, #0x0]
    ldmia sp!, {r3, pc}
L_0200b7dc: .word data_021052fc
.size ActorRuntimeScene_Begin, . - ActorRuntimeScene_Begin


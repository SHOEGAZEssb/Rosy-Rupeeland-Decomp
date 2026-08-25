; Matching retail form; see src/game/singleton_tracking_actor_state.c.
.extern Actor_InitializeFromDescriptor
.text
    .global SingletonTrackingActor_EnterInitialState
.type SingletonTrackingActor_EnterInitialState, @function
SingletonTrackingActor_EnterInitialState: ; 0x0204d220
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl Actor_InitializeFromDescriptor
    mov r0, r4
    ldr r2, [r0, #0x0]
    mov r1, #0x0
    ldr r2, [r2, #0x54]
    blx r2
    ldmia sp!, {r4, pc}
.size SingletonTrackingActor_EnterInitialState, . - SingletonTrackingActor_EnterInitialState

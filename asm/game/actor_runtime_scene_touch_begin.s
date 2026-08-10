; Matching retail form; see src/game/actor_runtime_scene_callbacks.c for
; the documented portable implementation and recovered behavior.
.text
.extern TouchPoint_Assign
.extern data_021052fc
.global ActorRuntimeScene_TouchBegin
ActorRuntimeScene_TouchBegin:
    stmdb sp!, {lr}
    sub sp, sp, #0xc
    add r0, sp, #0x0
    bl TouchPoint_Assign
    ldr r0, L_0200b838
    add r1, sp, #0x0
    ldr r0, [r0, #0x0]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x14]
    blx r2
    mov r0, #0x0
    add sp, sp, #0xc
    ldmia sp!, {pc}
L_0200b838: .word data_021052fc
.size ActorRuntimeScene_TouchBegin, . - ActorRuntimeScene_TouchBegin


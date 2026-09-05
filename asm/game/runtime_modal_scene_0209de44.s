.text
; Matching fallback for the portable implementation in src/game/runtime_modal_scene.c.
.extern GamePhaseState_UpdateRenderHelpers
.extern gGamePhaseRuntime

.global func_0209de44
func_0209de44:
    stmdb sp!, {r4, lr}
    ldr r1, .L_0209de78
    mov r4, r0
    ldr r0, [r1, #0x0]
    add r0, r0, #0x24
    bl GamePhaseState_UpdateRenderHelpers
    ldr r1, [r4, #0x34]
    cmp r1, #0x0
    ldrne r0, [r1, #0x20]
    eorne r0, r0, #0x1
    strne r0, [r1, #0x20]
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_0209de78: .word gGamePhaseRuntime
.size func_0209de44, . - func_0209de44

; Matching retail form; see src/game/actor_runtime_scene_callbacks.c for
; the documented portable implementation and recovered behavior.
.text
.extern gSceneTouchInitialData
.global func_0200b83c
func_0200b83c:
    ldr r2, L_0200b858
    str r2, [r0, #0x0]
    ldr r2, [r1, #0x4]
    str r2, [r0, #0x4]
    ldr r1, [r1, #0x8]
    str r1, [r0, #0x8]
    bx lr
L_0200b858: .word gSceneTouchInitialData
.size func_0200b83c, . - func_0200b83c


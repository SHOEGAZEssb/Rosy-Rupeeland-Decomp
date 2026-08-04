; Matching retail form; see src/game/actor_runtime_scene_callbacks.c for
; the documented portable implementation and recovered behavior.
.text
.extern data_021052fc
.global func_0200b7e0
func_0200b7e0:
    stmdb sp!, {r3, lr}
    ldr r0, L_0200b800
    ldr r0, [r0, #0x0]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x10]
    blx r1
    mov r0, #0x0
    ldmia sp!, {r3, pc}
L_0200b800: .word data_021052fc
.size func_0200b7e0, . - func_0200b7e0


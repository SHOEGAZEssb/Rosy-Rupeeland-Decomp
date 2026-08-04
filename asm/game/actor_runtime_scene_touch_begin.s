; Matching retail form; see src/game/actor_runtime_scene_callbacks.c for
; the documented portable implementation and recovered behavior.
.text
.extern func_0200b83c
.extern data_021052fc
.global func_0200b804
func_0200b804:
    stmdb sp!, {lr}
    sub sp, sp, #0xc
    add r0, sp, #0x0
    bl func_0200b83c
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
.size func_0200b804, . - func_0200b804


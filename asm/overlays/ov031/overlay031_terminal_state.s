.text

/* Exact fallback; see src/overlays/ov031/overlay031_scene_states.c for documented portable C. */
.extern GraphicsSpriteGroup_AdvanceAnimations
.extern func_ov031_021fd5c0
.extern func_ov031_021fdf20


    .global func_ov031_021fe5d4
func_ov031_021fe5d4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r1, #0x0
    bl func_ov031_021fdf20
    ldr r0, [r4, #0x58]
    bl GraphicsSpriteGroup_AdvanceAnimations
    ldr r0, [r4, #0x548]
    bl func_ov031_021fd5c0
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.size func_ov031_021fe5d4, .-func_ov031_021fe5d4

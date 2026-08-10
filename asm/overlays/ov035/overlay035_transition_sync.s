.text

/* Exact fallback; see src/overlays/ov035/overlay035_transition_object.c for documented portable C. */

    .extern Graphics3DSceneState_Apply
    .extern func_020773e4


    .global func_ov035_021fe5cc
func_ov035_021fe5cc: 
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0xc
    bl Graphics3DSceneState_Apply
    ldr r0, [r4, #0x100]
    add r1, r4, #0x64
    bl func_020773e4
    ldmia sp!, {r4, pc}
.size func_ov035_021fe5cc, .-func_ov035_021fe5cc


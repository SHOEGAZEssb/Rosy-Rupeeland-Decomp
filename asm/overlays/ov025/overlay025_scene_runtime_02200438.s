.text

/* Exact fallback; see src/overlays/ov025/overlay025_scene_runtime.c. */
.extern GraphicsSpriteState_ReleaseFromGroup


    .global func_ov025_02200438
func_ov025_02200438:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0xb8]
    mov r4, r1
    bl GraphicsSpriteState_ReleaseFromGroup
    mov r0, #0x0
    str r0, [r5, #0xb8]
    cmp r4, #0x0
    ldrne r0, [r5, #0x48]
    bicne r0, r0, #0x2
    strne r0, [r5, #0x48]
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov025_02200438, .-func_ov025_02200438


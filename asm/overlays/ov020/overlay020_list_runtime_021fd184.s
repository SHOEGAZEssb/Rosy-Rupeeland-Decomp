    .text
/* Exact fallback; see src/overlays/ov020/overlay020_list_runtime.c. */
    .extern GraphicsSpriteState_ReleaseFromGroup

.global func_ov020_021fd184
func_ov020_021fd184:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x40]
    cmp r1, r0
    ldmgeia sp!, {r3, r4, r5, pc}
    mov r0, #0xc
    mul r4, r1, r0
    ldr r0, [r5, #0x38]
    add r0, r0, r4
    ldr r0, [r0, #0x4]
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    bl GraphicsSpriteState_ReleaseFromGroup
    ldr r0, [r5, #0x38]
    mov r1, #0x0
    add r0, r0, r4
    str r1, [r0, #0x4]
    ldmia sp!, {r3, r4, r5, pc}
    .size func_ov020_021fd184, . - func_ov020_021fd184

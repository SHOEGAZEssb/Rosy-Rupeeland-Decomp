    .text
    .extern data_020f4e18
    .extern GraphicsArchive_ReleaseOwlvResource
    .extern GraphicsArchive_AcquireOwlvResource
/* Exact register-order fallback; see src/overlays/ov012/overlay012_transform_resource_set.c. */
    .global Overlay012_Transform_SetResource
Overlay012_Transform_SetResource:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    ldr r1, [r5, #4]
    cmp r1, #0
    beq L_021fced8
    ldr r0, L_021fcef0
    ldr r0, [r0]
    bl GraphicsArchive_ReleaseOwlvResource
L_021fced8:
    ldr r0, L_021fcef0
    mov r1, r4
    ldr r0, [r0]
    bl GraphicsArchive_AcquireOwlvResource
    str r0, [r5, #4]
    ldmia sp!, {r3, r4, r5, pc}
L_021fcef0:
    .word data_020f4e18
    .size Overlay012_Transform_SetResource, . - Overlay012_Transform_SetResource

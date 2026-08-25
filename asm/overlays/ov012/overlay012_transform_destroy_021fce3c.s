    .text
    .extern data_ov012_021fe5f4
    .extern data_020f4e18
    .extern GraphicsArchive_ReleaseOwlvResource
/* Exact register-allocation fallback; see src/overlays/ov012/overlay012_transform_destroy.c. */
    .global Overlay012_Transform_Destroy
Overlay012_Transform_Destroy:
    stmdb sp!, {r4, lr}
    ldr r1, L_021fce6c
    mov r4, r0
    str r1, [r4]
    ldr r1, [r4, #4]
    cmp r1, #0
    beq L_021fce64
    ldr r0, L_021fce70
    ldr r0, [r0]
    bl GraphicsArchive_ReleaseOwlvResource
L_021fce64:
    mov r0, r4
    ldmia sp!, {r4, pc}
L_021fce6c:
    .word data_ov012_021fe5f4
L_021fce70:
    .word data_020f4e18
    .size Overlay012_Transform_Destroy, . - Overlay012_Transform_Destroy

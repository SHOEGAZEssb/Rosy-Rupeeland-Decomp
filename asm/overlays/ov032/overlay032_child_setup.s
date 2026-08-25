.text

/* Exact fallback; see src/overlays/ov032/overlay032_child_setup.c for documented portable C. */
.extern data_020f4e18
.extern AnimationResourceState_ReplaceResources
.extern AnimationResourceState_ReleaseResources
.extern func_ov032_021fe0c4
.extern Overlay032Controller_CreateObject
.extern func_ov032_0220147c
.extern func_ov032_022014c0
.extern Overlay032Controller_SetScaleTarget

    .global func_ov032_02201020
func_ov032_02201020:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x14
    mov r6, r0
    add r0, r6, #0xc
    mov r7, r1
    mov r4, r2
    mov r5, r3
    bl AnimationResourceState_ReleaseResources
    add r0, r6, #0x18
    bl func_ov032_0220147c
    ldr r0, [sp, #0x28]
    cmp r0, #0x0
    beq L_02201060
    ldr r0, [r6, #0x4]
    cmp r0, #0x3
    beq L_0220117c
L_02201060:
    ldr r0, [r6, #0x4]
    cmp r0, #0x4
    bne L_02201078
    cmp r4, #0xa
    cmpne r4, r7
    beq L_0220117c
L_02201078:
    cmp r0, #0x2
    bne L_02201088
    cmp r4, #0x2
    blt L_0220117c
L_02201088:
    cmp r0, #0x1
    bne L_02201098
    cmp r4, #0x3
    blt L_0220117c
L_02201098:
    cmp r0, #0x0
    bne L_022010a8
    cmp r4, #0x4
    blt L_0220117c
L_022010a8:
    sub r0, r0, #0x3
    add r1, r4, r0
    mov r0, #0x18
    mul r4, r1, r0
    add r3, r5, r4
    ldr r1, [r3, #0x18]
    ldr r0, L_02201184
    str r1, [sp, #0x0]
    ldr r1, [r0, #0x0]
    ldr r2, [r3, #0x10]
    ldr r3, [r3, #0x14]
    add r0, r6, #0xc
    bl AnimationResourceState_ReplaceResources
    ldr r0, [r6, #0x4]
    add r2, r5, r4
    cmp r0, #0x2
    ldreq r1, [r6, #0x48]
    ldreq r0, [r2, #0x20]
    ldr r4, [r2, #0x1c]
    addeq r0, r1, r0
    ldrne r0, [r6, #0x48]
    add r2, r6, #0xc
    str r0, [r6, #0x50]
    ldr r1, [r6, #0x4c]
    add r0, r6, #0x18
    str r1, [r6, #0x54]
    ldr r1, [r6, #0x8]
    bl Overlay032Controller_CreateObject
    ldr r1, [r6, #0x54]
    mov r0, #0x3
    str r1, [sp, #0x0]
    str r0, [sp, #0x4]
    mov r0, #0x0
    str r0, [sp, #0x8]
    str r0, [sp, #0xc]
    str r0, [sp, #0x10]
    ldr r3, [r6, #0x50]
    mov r1, r4
    mov r2, r4
    add r0, r6, #0x18
    bl func_ov032_022014c0
    add r0, r6, #0x18
    bl func_ov032_021fe0c4
    ldr r0, [r6, #0x4]
    mov r2, #0x0
    cmp r0, #0x3
    add r0, r6, #0x18
    bne L_02201174
    mov r1, #0x100
    bl Overlay032Controller_SetScaleTarget
    b L_0220117c
L_02201174:
    mov r1, #0x80
    bl Overlay032Controller_SetScaleTarget
L_0220117c:
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, pc}
L_02201184: .word data_020f4e18
.size func_ov032_02201020, .-func_ov032_02201020


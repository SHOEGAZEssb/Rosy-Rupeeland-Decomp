.text

/* Exact fallback; see src/overlays/ov025/overlay025_effect_primary_config.c. */
.extern data_ov025_02202c84
.extern func_02073e48
.extern GraphicsSpriteGroup_ReplaceStateResourcesFromSource


    .global func_ov025_021fe174
func_ov025_021fe174:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0xc
    mov r6, r0
    ldr ip, [r6, #0xe8]
    ldr r4, L_021fe244
    mov r5, r1, lsl #0x3
    ldr r0, [ip, #0x14]
    ldrh r7, [r4, r5]
    ldr r0, [r0, #0x10]
    mov r5, r2
    mov r4, r3
    cmp r7, r0
    beq L_021fe1d4
    mov r0, #0xc
    mul r7, r1, r0
    add r8, r6, #0xb0
    ldr r0, [r6, #0xe0]
    mov r1, ip
    add r2, r8, r7
    bl GraphicsSpriteGroup_ReplaceStateResourcesFromSource
    ldr r0, [r6, #0xe4]
    ldr r1, [r6, #0xf0]
    add r2, r8, r7
    bl GraphicsSpriteGroup_ReplaceStateResourcesFromSource
L_021fe1d4:
    ldr ip, [r6, #0xe8]
    mov r3, #0x3
    ldrh r0, [ip, #0x24]
    mov r2, #0x2000
    mov r1, r5
    bic r0, r0, #0x46
    strh r0, [ip, #0x24]
    ldr r0, [r6, #0xe8]
    str r3, [sp, #0x0]
    stmib sp, {r2, r4}
    ldrsh r2, [r0, #0x2c]
    ldrsh r3, [r0, #0x2e]
    bl func_02073e48
    ldr ip, [r6, #0xf0]
    mov r3, #0x3
    ldrh r0, [ip, #0x24]
    mov r2, #0x2000
    mov r1, r5
    bic r0, r0, #0x46
    strh r0, [ip, #0x24]
    ldr r0, [r6, #0xf0]
    str r3, [sp, #0x0]
    stmib sp, {r2, r4}
    ldrsh r2, [r0, #0x2c]
    ldrsh r3, [r0, #0x2e]
    bl func_02073e48
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
L_021fe244: .word data_ov025_02202c84
.size func_ov025_021fe174, .-func_ov025_021fe174


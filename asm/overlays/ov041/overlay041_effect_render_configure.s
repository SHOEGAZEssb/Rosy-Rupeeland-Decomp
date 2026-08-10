.text

/* Exact fallback for the documented portable C implementation in
 * src/overlays/ov041/overlay041_effect_object_lifecycle.c. */
.extern GraphicsSpriteState_SetAnimationIndex

    .global func_ov041_02201364
func_ov041_02201364: ; 0x02201364
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r1
    ldrb r1, [sp, #0x14]
    ldr r0, [r6, #0xc]
    mov r5, r2
    mov r4, r3
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r3, [r6, #0xc]
    mov ip, #0x1
    ldrh r0, [r3, #0x24]
    mov r2, #0x32
    ldr r1, [sp, #0x10]
    orr r0, r0, #0x2
    strh r0, [r3, #0x24]
    ldr r3, [r6, #0xc]
    mov r0, #0x100
    strb ip, [r3, #0x3a]
    str r2, [r6, #0x44]
    str r5, [r6, #0x30]
    str r4, [r6, #0x34]
    str r1, [r6, #0x38]
    strh r0, [r6, #0x3c]
    strh r0, [r6, #0x3e]
    mov r0, #0x0
    strh r0, [r6, #0x40]
    ldmia sp!, {r4, r5, r6, pc}
    .size func_ov041_02201364, . - func_ov041_02201364


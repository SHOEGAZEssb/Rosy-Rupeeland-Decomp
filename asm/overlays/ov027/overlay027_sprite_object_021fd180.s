.text

/* Exact fallback; see src/overlays/ov027/overlay027_sprite_object.c. */
.extern func_02076be8


    .global func_ov027_021fd180
func_ov027_021fd180:
    stmdb sp!, {r4, r5, r6, lr}
    mov r4, r0
    mov r6, r2
    and r1, r1, #0xff
    mov r5, r3
    bl func_02076be8
    str r6, [r4, #0x20]
    ldr r0, [sp, #0x18]
    ldr r2, [sp, #0x10]
    str r5, [r4, #0x24]
    ldr r1, [sp, #0x14]
    str r2, [r4, #0x28]
    strb r1, [r4, #0x5a]
    ldrh r1, [r4, #0x50]
    mov r0, r0, lsl #0x10
    orr r0, r1, r0, lsr #0x10
    strh r0, [r4, #0x50]
    ldmia sp!, {r4, r5, r6, pc}
.size func_ov027_021fd180, .-func_ov027_021fd180


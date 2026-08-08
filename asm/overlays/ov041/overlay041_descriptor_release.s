.text

/* Exact fallback for the documented portable C implementation in
 * src/overlays/ov041/overlay041_scene_object_lifecycle.c. */
    .global func_ov041_021ff658
func_ov041_021ff658: ; 0x021ff658
    ldr r3, [r0, #0x80]
    mov r1, r1, lsl #0x1
    mvn r2, #0x0
    strh r2, [r3, r1]
    ldr r3, [r0, #0x98]
    ldrsh r3, [r3, r1]
    cmp r3, #0x0
    bxlt lr
    add r3, r0, r3, lsl #0x2
    ldr ip, [r3, #0x4c]
    ldrh r3, [ip, #0x42]
    orr r3, r3, #0x4
    strh r3, [ip, #0x42]
    ldr r3, [r0, #0x98]
    ldrsh r3, [r3, r1]
    add r3, r0, r3, lsl #0x2
    ldr r3, [r3, #0x4c]
    ldr ip, [r3, #0xc]
    ldrh r3, [ip, #0x24]
    orr r3, r3, #0x4
    strh r3, [ip, #0x24]
    ldr r0, [r0, #0x98]
    strh r2, [r0, r1]
    bx lr
    .size func_ov041_021ff658, . - func_ov041_021ff658


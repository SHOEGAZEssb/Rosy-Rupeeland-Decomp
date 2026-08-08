.text

/* Exact fallback for the documented portable C implementation in
 * src/overlays/ov041/overlay041_scene_object_reset.c. */
.extern func_ov041_021ff658

    .global func_ov041_021ff6b8
func_ov041_021ff6b8: ; 0x021ff6b8
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldr r5, [r6, #0x1ac]
    mvn r4, #0x0
    b .L_021ff6ec
.L_021ff6cc:
    ldr r1, [r6, #0x80]
    mov r0, r5, lsl #0x1
    ldrsh r0, [r1, r0]
    cmp r0, r4
    ble .L_021ff6ec
    mov r0, r6
    mov r1, r5
    bl func_ov041_021ff658
.L_021ff6ec:
    subs r5, r5, #0x1
    bpl .L_021ff6cc
    ldmia sp!, {r4, r5, r6, pc}
    .size func_ov041_021ff6b8, . - func_ov041_021ff6b8


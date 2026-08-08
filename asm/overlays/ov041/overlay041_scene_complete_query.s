.text

/* Exact fallback for the documented portable C implementation in
 * src/overlays/ov041/overlay041_scene_object_update.c. */

    .global func_ov041_021fff80
func_ov041_021fff80: ; 0x021fff80
    ldr r2, [r0, #0x1b8]
    mvn r1, #0x0
    cmp r2, r1
    bgt .L_021fffc0
    ldr ip, [r0, #0x1ac]
    b .L_021fffb0
.L_021fff98:
    ldr r3, [r0, #0x80]
    mov r2, ip, lsl #0x1
    ldrsh r2, [r3, r2]
    cmp r2, r1
    movgt r0, #0x0
    bxgt lr
.L_021fffb0:
    subs ip, ip, #0x1
    bpl .L_021fff98
    mov r0, #0x1
    bx lr
.L_021fffc0:
    mov r0, #0x0
    bx lr
    .size func_ov041_021fff80, . - func_ov041_021fff80


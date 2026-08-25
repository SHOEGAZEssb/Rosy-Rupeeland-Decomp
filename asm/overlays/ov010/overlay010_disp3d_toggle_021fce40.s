    .text

/* Exact fallback; see documented portable reconstruction in
 * src/overlays/ov010/overlay010_disp3d_toggle.c. */
    .global Overlay010_SetDisp3dEnabled
Overlay010_SetDisp3dEnabled: ; 0x021fce40
    cmp r0, #0x0
    ldreq r2, L_021fce74
    ldreq r0, L_021fce78
    ldreqh r1, [r2, #0x0]
    andeq r0, r1, r0
    streqh r0, [r2, #0x0]
    bxeq lr
    ldr r1, L_021fce74
    ldrh r0, [r1, #0x0]
    bic r0, r0, #0x3000
    orr r0, r0, #0x8
    strh r0, [r1, #0x0]
    bx lr
L_021fce74: .word 0x4000060
L_021fce78: .word 0xcff7

    .size Overlay010_SetDisp3dEnabled, . - Overlay010_SetDisp3dEnabled

    .text
/* Exact fallback; see src/overlays/ov022/overlay022_status_widget.c. */
    .extern Overlay022_StatusWidget_SetMode2
    .extern Overlay022_StatusWidget_SetMode1
    .extern Overlay022_StatusWidget_SetMode3
    .extern Overlay022_StatusWidget_SetMode4

.global Overlay022_StatusWidget_SetSelector
Overlay022_StatusWidget_SetSelector:
    stmdb sp!, {r3, lr}
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    ldmia sp!, {r3, pc}
L_021fd5e4: ; jump table
    b L_021fd5f4 ; case 0
    b L_021fd5fc ; case 1
    b L_021fd604 ; case 2
    b L_021fd60c ; case 3
L_021fd5f4:
    bl Overlay022_StatusWidget_SetMode2
    ldmia sp!, {r3, pc}
L_021fd5fc:
    bl Overlay022_StatusWidget_SetMode3
    ldmia sp!, {r3, pc}
L_021fd604:
    bl Overlay022_StatusWidget_SetMode4
    ldmia sp!, {r3, pc}
L_021fd60c:
    bl Overlay022_StatusWidget_SetMode1
    ldmia sp!, {r3, pc}
.size Overlay022_StatusWidget_SetSelector, . - Overlay022_StatusWidget_SetSelector

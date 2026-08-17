.text

/* Exact fallback; see src/overlays/ov032/overlay032_widget_helpers.c for documented portable C. */
.extern data_020f263c
.extern AnimationResourceState_InitEmbedded
.extern InventoryScroll_InitBase

    .global Overlay032ListBase_Init
Overlay032ListBase_Init:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl InventoryScroll_InitBase
    ldr r1, L_02201f7c
    add r0, r4, #0x54
    str r1, [r4, #0x0]
    bl AnimationResourceState_InitEmbedded
    mov r0, r4
    ldmia sp!, {r4, pc}
L_02201f7c: .word data_020f263c
.size Overlay032ListBase_Init, .-Overlay032ListBase_Init


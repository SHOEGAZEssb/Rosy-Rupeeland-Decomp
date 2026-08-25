    .text

/* Exact fallback; see src/overlays/ov016/overlay016_selection_helpers.c. */
    .extern func_ov016_021fd628
    .extern func_ov016_021fd9dc
    .extern Overlay016_PopulatePanel
.global Overlay016_SyncSelectedPanel
Overlay016_SyncSelectedPanel:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, [r5, #0x444]
    cmp r0, #0x0
    beq L_021ffc1c
    bl func_ov016_021fd628
    cmp r0, #0x0
    beq L_021ffc1c
    ldr r4, [r5, #0x444]
    mov r0, r4
    bl func_ov016_021fd628
    ldr r2, [r4, #0x58]
    mov r1, r0
    ldr r0, [r5, #0x448]
    ldr r2, [r2, #0x14]
    bl Overlay016_PopulatePanel
    ldmia sp!, {r3, r4, r5, pc}
L_021ffc1c:
    ldr r0, [r5, #0x448]
    mov r1, #0x1
    bl func_ov016_021fd9dc
    ldmia sp!, {r3, r4, r5, pc}
    .size Overlay016_SyncSelectedPanel, . - Overlay016_SyncSelectedPanel


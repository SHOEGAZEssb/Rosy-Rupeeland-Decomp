    .text

/* Exact fallback; see src/overlays/ov016/overlay016_selection_helpers.c. */
    .extern Overlay016_PopulatePanel
.global Overlay016_MoveDetailSelection
Overlay016_MoveDetailSelection:
    ldr r2, [r0, #0x480]
    adds r2, r2, r1
    str r2, [r0, #0x480]
    ldr r1, [r0, #0x444]
    ldrmi r1, [r1, #0x54]
    submi r1, r1, #0x1
    strmi r1, [r0, #0x480]
    bmi L_021ffe6c
    ldr r1, [r1, #0x54]
    cmp r2, r1
    movge r1, #0x0
    strge r1, [r0, #0x480]
L_021ffe6c:
    ldr r1, [r0, #0x444]
    ldr r2, [r0, #0x480]
    ldr r3, [r1, #0x4c]
    mov r1, #0x14
    mla r1, r2, r1, r3
    ldr ip, L_021ffe8c
    ldr r0, [r0, #0x448]
    bx ip
L_021ffe8c: .word Overlay016_PopulatePanel
    .size Overlay016_MoveDetailSelection, . - Overlay016_MoveDetailSelection


    .text
/* Exact fallback; see src/overlays/ov022/overlay022_menu_collection.c. */
    .extern TitleCharacterResourceCollection_Destroy
    .extern CxxArray_DestroyAndFree
    .extern Overlay022_MenuEntry_DestroyNoOp

.global Overlay022_Menu_Deinit
Overlay022_Menu_Deinit:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x30]
    cmp r0, #0x0
    beq L_021fda48
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fda48:
    ldr r0, [r4, #0x24]
    cmp r0, #0x0
    beq L_021fda64
    mov r1, #0x8
    ldr r3, L_021fda74
    mov r2, r1
    bl CxxArray_DestroyAndFree
L_021fda64:
    mov r0, r4
    bl TitleCharacterResourceCollection_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
L_021fda74: .word Overlay022_MenuEntry_DestroyNoOp
.size Overlay022_Menu_Deinit, . - Overlay022_Menu_Deinit

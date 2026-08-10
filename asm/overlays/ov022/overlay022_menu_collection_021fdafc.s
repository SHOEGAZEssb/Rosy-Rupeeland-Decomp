    .text
/* Exact fallback; see src/overlays/ov022/overlay022_menu_collection.c. */
    .extern GraphicsSpriteGroup_ReleaseIndexedEntries

.global func_ov022_021fdafc
func_ov022_021fdafc:
    stmdb sp!, {r3, lr}
    ldr r1, [r0, #0x2c]
    cmp r1, #0x0
    beq L_021fdb28
    ldr r2, [r0, #0x30]
    ldmib r2, {r0, r1}
    cmp r1, r0
    ldrlt r0, [r2, #0x50]
    movlt r1, #0x1
    strlt r1, [r0, #0x20]
    ldmia sp!, {r3, pc}
L_021fdb28:
    ldr r0, [r0, #0x30]
    ldr r0, [r0, #0x50]
    bl GraphicsSpriteGroup_ReleaseIndexedEntries
    ldmia sp!, {r3, pc}
.size func_ov022_021fdafc, . - func_ov022_021fdafc

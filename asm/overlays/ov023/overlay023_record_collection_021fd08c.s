.text

/* Exact fallback; see src/overlays/ov023/overlay023_record_collection.c. */
.extern GraphicsSpriteGroup_ReleaseIndexedEntries


    .global func_ov023_021fd08c
func_ov023_021fd08c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r3, #0x1
    str r3, [r4, #0x3c]
    ldr r0, [r4, #0x34]
    cmp r0, #0x0
    beq L_021fd0c0
    ldr r2, [r4, #0x38]
    ldmib r2, {r0, r1}
    cmp r1, r0
    ldrlt r0, [r2, #0x50]
    strlt r3, [r0, #0x20]
    b L_021fd0cc
L_021fd0c0:
    ldr r0, [r4, #0x38]
    ldr r0, [r0, #0x50]
    bl GraphicsSpriteGroup_ReleaseIndexedEntries
L_021fd0cc:
    ldr r0, [r4, #0x4]
    mov r1, #0x1
    str r1, [r0, #0x20]
    ldmia sp!, {r4, pc}
.size func_ov023_021fd08c, .-func_ov023_021fd08c


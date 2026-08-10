    .text
/* Exact fallback; see src/overlays/ov021/overlay021_list_helpers.c. */
    .extern GraphicsSpriteGroup_ReleaseIndexedEntries

.global func_ov021_021fd1cc
func_ov021_021fd1cc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r3, #0x1
    str r3, [r4, #0x5c]
    ldr r0, [r4, #0x54]
    cmp r0, #0x0
    beq L_021fd200
    ldr r2, [r4, #0x58]
    ldmib r2, {r0, r1}
    cmp r1, r0
    ldrlt r0, [r2, #0x50]
    strlt r3, [r0, #0x20]
    b L_021fd20c
L_021fd200:
    ldr r0, [r4, #0x58]
    ldr r0, [r0, #0x50]
    bl GraphicsSpriteGroup_ReleaseIndexedEntries
L_021fd20c:
    ldr r0, [r4, #0x1c]
    mov r1, #0x1
    str r1, [r0, #0x20]
    ldr r0, [r4, #0x20]
    str r1, [r0, #0x20]
    ldmia sp!, {r4, pc}
    .size func_ov021_021fd1cc, . - func_ov021_021fd1cc


    .text
/* Exact fallback; see src/overlays/ov021/overlay021_list_helpers.c. */
    .extern GraphicsSpriteGroup_ReleaseIndexedEntries

.global func_ov021_021fd224
func_ov021_021fd224:
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r0, #0x0
    str r0, [r4, #0x5c]
    ldr r0, [r4, #0x58]
    ldr r0, [r0, #0x50]
    bl GraphicsSpriteGroup_ReleaseIndexedEntries
    ldr r0, [r4, #0x1c]
    bl GraphicsSpriteGroup_ReleaseIndexedEntries
    ldr r0, [r4, #0x20]
    bl GraphicsSpriteGroup_ReleaseIndexedEntries
    ldmia sp!, {r4, pc}
    .size func_ov021_021fd224, . - func_ov021_021fd224


.text
; Matching fallback for the portable implementation in src/overlays/ov058/overlay058_recovery.c.
.extern GraphicsSpriteGroup_ReleaseIndexedEntries

.global func_ov058_0220f4e8
func_ov058_0220f4e8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0xc]
    cmp r1, #0x0
    movne r1, #0x1
    strne r1, [r0, #0x20]
    ldrne r0, [r4, #0x10]
    strne r1, [r0, #0x20]
    ldmneia sp!, {r4, pc}
    bl GraphicsSpriteGroup_ReleaseIndexedEntries
    ldr r0, [r4, #0x10]
    bl GraphicsSpriteGroup_ReleaseIndexedEntries
    ldmia sp!, {r4, pc}
.size func_ov058_0220f4e8, . - func_ov058_0220f4e8

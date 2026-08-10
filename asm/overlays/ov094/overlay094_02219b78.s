.text
; Matching fallback for the portable implementation in src/overlays/ov094/overlay094_recovery.c.
.extern GraphicsSpriteGroup_ReleaseIndexedEntries

.global func_ov094_02219b78
func_ov094_02219b78:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0xc]
    cmp r1, #0x1
    moveq r1, #0x1
    streq r1, [r0, #0x20]
    ldreq r0, [r4, #0x10]
    streq r1, [r0, #0x20]
    ldmeqia sp!, {r4, pc}
    bl GraphicsSpriteGroup_ReleaseIndexedEntries
    ldr r0, [r4, #0x10]
    bl GraphicsSpriteGroup_ReleaseIndexedEntries
    ldmia sp!, {r4, pc}
.size func_ov094_02219b78, . - func_ov094_02219b78

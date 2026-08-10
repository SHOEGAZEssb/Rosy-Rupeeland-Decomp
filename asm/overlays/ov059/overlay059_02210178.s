.text
; Matching fallback for the portable implementation in src/overlays/ov059/overlay059_recovery.c.
.extern GraphicsSpriteGroup_AdvanceAnimations
.extern GraphicsSpriteGroup_ReleaseIndexedEntries

.global func_ov059_02210178
func_ov059_02210178:
    stmdb sp!, {r4, lr}
    mov r4, r0
    str r1, [r4, #0x5c]
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    cmp r1, #0x0
    movne r1, #0x1
    strne r1, [r0, #0x20]
    bne .L_022101a4
    bl GraphicsSpriteGroup_ReleaseIndexedEntries
.L_022101a4:
    ldr r0, [r4, #0x0]
    bl GraphicsSpriteGroup_AdvanceAnimations
    ldmia sp!, {r4, pc}
.size func_ov059_02210178, . - func_ov059_02210178

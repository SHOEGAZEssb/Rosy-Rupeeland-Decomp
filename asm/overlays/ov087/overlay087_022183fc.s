.text
; Matching fallback for the portable implementation in src/overlays/ov087/overlay087_recovery.c.
.extern func_ov087_02218264
.extern gSystemState

.global func_ov087_022183fc
func_ov087_022183fc:
    stmdb sp!, {r3, lr}
    ldr r1, .L_02218450
    ldrh r1, [r1, #0x4]
    tst r1, #0x20
    mvnne r2, #0x0
    bne .L_02218420
    tst r1, #0x10
    movne r2, #0x1
    moveq r2, #0x0
.L_02218420:
    ldr r3, .L_02218450
    tst r1, #0x2
    ldrh r3, [r3, #0x6]
    movne r1, #0x1
    moveq r1, #0x0
    tst r3, #0x800
    addne r3, r0, #0x200
    ldrneh ip, [r3, #0x1a]
    orrne ip, ip, #0x100
    strneh ip, [r3, #0x1a]
    bl func_ov087_02218264
    ldmia sp!, {r3, pc}
.L_02218450: .word gSystemState
.size func_ov087_022183fc, . - func_ov087_022183fc

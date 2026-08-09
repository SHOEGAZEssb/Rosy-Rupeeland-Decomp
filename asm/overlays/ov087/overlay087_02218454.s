.text
; Matching fallback for the portable implementation in src/overlays/ov087/overlay087_recovery.c.
.extern func_ov087_02218264

.global func_ov087_02218454
func_ov087_02218454:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x200
    ldrh r0, [r0, #0x1a]
    tst r0, #0x8
    mvnne r2, #0x0
    bne .L_0221847c
    tst r0, #0x10
    movne r2, #0x1
    moveq r2, #0x0
.L_0221847c:
    tst r0, #0x20
    movne r1, #0x1
    bne .L_02218494
    tst r0, #0x40
    mvnne r1, #0x0
    moveq r1, #0x0
.L_02218494:
    mov r0, r4
    bl func_ov087_02218264
    add r0, r4, #0x200
    ldrh r1, [r0, #0x1a]
    bic r1, r1, #0x78
    strh r1, [r0, #0x1a]
    ldmia sp!, {r4, pc}
.size func_ov087_02218454, . - func_ov087_02218454

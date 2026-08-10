.text

/* Exact fallback; see src/overlays/ov026/overlay026_scene_render.c. */
.extern func_020773e4
.extern Graphics3DLight_Apply
.extern Graphics3DSceneState_Apply
.extern func_020b0558
.extern func_ov026_021fd300
.extern func_ov026_021fd540
.extern func_ov026_021fd6b0
.extern func_ov026_021fd900
.extern func_ov026_021fd964
.extern func_ov026_021fe72c
.extern func_ov026_021fea4c
.extern func_ov026_021feec8
.extern func_ov026_021ff4f8
.extern func_ov026_021ff51c
.extern func_ov026_022006f8
.extern func_ov043_0220b9bc
.extern func_ov048_0220bad4


    .global func_ov026_0220046c
func_ov026_0220046c:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r4, r0
    add r0, r4, #0x370
    bl func_ov043_0220b9bc ; func_ov048_0220b9bc
    cmp r0, #0x0
    ldreq r0, L_022006e4
    moveq r1, #0x0
    streq r1, [r4, #0x24c]
    movne r0, #0x0
    strne r0, [r4, #0x24c]
    str r0, [r4, #0x250]
    bl func_020b0558
    ldr r0, L_022006e8
    ldr r1, L_022006ec
    str r0, [r1, #0x0]
    ldr r0, [r4, #0x370]
    cmp r0, #0x1
    bne L_022004e0
    mov r0, #0x0
    str r0, [r1, #-0x7c]
    add r0, r4, #0x254
    bl Graphics3DSceneState_Apply
    ldr r0, [r4, #0x78]
    add r1, r4, #0x2ac
    bl func_020773e4
    ldr r0, L_022006f0
    mov r1, #0x1
    str r1, [r0, #0x0]
L_022004e0:
    ldr r1, L_022006f4
    mov r2, #0x0
    add r0, r4, #0x1c0
    str r2, [r1, #0x0]
    bl Graphics3DSceneState_Apply
    mov r6, #0x0
    add r5, r4, #0x180
L_022004fc:
    mov r1, r6
    add r0, r5, r6, lsl #0x4
    bl Graphics3DLight_Apply
    add r6, r6, #0x1
    cmp r6, #0x4
    blt L_022004fc
    ldr r0, [r4, #0x160]
    ldr r1, [r4, #0x158]
    ldr r0, [r0, #0x12c]
    tst r0, #0x200
    ldrneh r0, [r1, #0x50]
    bicne r0, r0, #0x4
    ldreqh r0, [r1, #0x50]
    orreq r0, r0, #0x4
    strh r0, [r1, #0x50]
    ldr r0, [r4, #0x160]
    ldr r1, [r0, #0x12c]
    tst r1, #0x2000
    beq L_02200558
    bl func_ov026_021ff4f8
    mov r1, r0
    mov r0, r4
    bl func_ov026_022006f8
L_02200558:
    ldr r0, [r4, #0x6c]
    add r1, r4, #0x218
    bl func_020773e4
    ldr r0, [r4, #0x160]
    ldr r0, [r0, #0x12c]
    tst r0, #0x4
    beq L_02200580
    ldr r0, [r4, #0x70]
    add r1, r4, #0x218
    bl func_020773e4
L_02200580:
    ldr r0, [r4, #0x160]
    ldr r0, [r0, #0x12c]
    tst r0, #0x8
    beq L_0220059c
    ldr r0, [r4, #0x74]
    add r1, r4, #0x218
    bl func_020773e4
L_0220059c:
    ldr r0, [r4, #0x160]
    ldr r0, [r0, #0x12c]
    tst r0, #0x10
    beq L_022005b4
    ldr r0, [r4, #0x164]
    bl func_ov026_021fd300
L_022005b4:
    ldr r0, [r4, #0x160]
    ldr r0, [r0, #0x12c]
    tst r0, #0x100
    beq L_022005cc
    ldr r0, [r4, #0x168]
    bl func_ov026_021fd540
L_022005cc:
    ldr r0, [r4, #0x160]
    bl func_ov026_021ff51c
    ldr r0, [r4, #0x160]
    ldr r0, [r0, #0x12c]
    tst r0, #0x20
    beq L_022005ec
    ldr r0, [r4, #0x16c]
    bl func_ov026_021fe72c
L_022005ec:
    ldr r0, [r4, #0x160]
    ldr r0, [r0, #0x12c]
    tst r0, #0x40
    beq L_02200604
    ldr r0, [r4, #0x170]
    bl func_ov026_021fea4c
L_02200604:
    ldr r0, [r4, #0x160]
    ldr r0, [r0, #0x12c]
    tst r0, #0x800
    beq L_0220061c
    ldr r0, [r4, #0x174]
    bl func_ov026_021feec8
L_0220061c:
    ldr r0, [r4, #0x160]
    ldr r0, [r0, #0x12c]
    tst r0, #0x40000
    beq L_02200638
    ldr r0, [r4, #0x17c]
    add r1, r4, #0x218
    bl func_ov026_021fd6b0
L_02200638:
    mov r1, #0x1f
    mov r0, #0x0
    str r1, [sp, #0x0]
    mov r1, r0
    mov r2, #0x3
    mov r3, #0x15
    str r0, [sp, #0x4]
    bl func_ov026_021fd964
    mov r0, #0x0
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    str r0, [sp, #0x8]
    mov r1, r0
    mov r2, r0
    mov r3, r0
    str r0, [sp, #0xc]
    bl func_ov026_021fd900
    ldr r5, [r4, #0x318]
    b L_02200698
L_02200684:
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
    ldr r5, [r5, #0x8]
L_02200698:
    cmp r5, #0x0
    bne L_02200684
    ldr r0, [r4, #0x160]
    ldr r0, [r0, #0x12c]
    tst r0, #0x4
    beq L_022006c0
    ldr r0, [r4, #0x178]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
L_022006c0:
    ldr r2, L_022006f0
    mov r0, #0x1
    str r0, [r2, #0x0]
    mov r1, #0x0
    add r0, r4, #0x370
    str r1, [r2, #0xf8]
    bl func_ov048_0220bad4
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
L_022006e4: .word 0x47e
L_022006e8: .word 0x7f107fff
L_022006ec: .word 0x40004c0
L_022006f0: .word 0x4000448
L_022006f4: .word 0x4000444
.size func_ov026_0220046c, .-func_ov026_0220046c


    .text

/* Exact fallback; see src/overlays/ov016/overlay016_scene_update.c. */
    .extern GraphicsSpriteGroup_AdvanceAnimations
    .extern func_020958d8
    .extern func_02096304
    .extern func_ov000_021fc164
    .extern func_ov016_021fd358
    .extern func_ov016_021fdf50
    .extern func_ov016_021fe63c
.global func_ov016_021ff7bc
func_ov016_021ff7bc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0xe8
    bl func_020958d8
    add r0, r4, #0x194
    bl func_020958d8
    add r0, r4, #0x240
    bl func_020958d8
    add r0, r4, #0x2ec
    bl func_020958d8
    add r0, r4, #0x398
    bl func_020958d8
    ldr r0, [r4, #0xe0]
    bl GraphicsSpriteGroup_AdvanceAnimations
    ldr r0, [r4, #0x444]
    cmp r0, #0x0
    beq L_021ff804
    bl func_ov016_021fd358
L_021ff804:
    ldr r0, [r4, #0x448]
    cmp r0, #0x0
    beq L_021ff814
    bl func_ov016_021fdf50
L_021ff814:
    ldr r0, [r4, #0x44c]
    cmp r0, #0x0
    beq L_021ff824
    bl func_ov000_021fc164
L_021ff824:
    ldr r0, [r4, #0x470]
    cmp r0, #0x0
    beq L_021ff834
    bl func_ov016_021fe63c
L_021ff834:
    ldr r0, [r4, #0x464]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    bl func_02096304
    ldmia sp!, {r4, pc}
    .size func_ov016_021ff7bc, . - func_ov016_021ff7bc


    .text
    .extern data_ov016_02201520
    .extern func_02071eb8
    .extern GraphicsSpriteGroup_Destroy
    .extern func_02095308
    .extern func_ov016_021fe0d4

/* Exact fallbacks for actor-group destruction; see src/overlays/ov016/overlay016_actor_group.c. */
    .global func_ov016_021fe24c

func_ov016_021fe24c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0xd0
    bl func_02095308
    ldr r0, [r4, #0xcc]
    cmp r0, #0x0
    beq L_021fe274
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fe274:
    ldr r0, [r4, #0x18]
    bl GraphicsSpriteGroup_Destroy
    ldr r1, L_021fe2ac
    add r0, r4, #0xd0
    str r1, [r4, #0xd0]
    bl func_02095308
    add r0, r4, #0x20
    bl func_ov016_021fe0d4
    add r0, r4, #0xc
    bl func_02071eb8
    mov r0, r4
    bl func_02071eb8
    mov r0, r4
    ldmia sp!, {r4, pc}
L_021fe2ac: .word data_ov016_02201520

    .size func_ov016_021fe24c, . - func_ov016_021fe24c

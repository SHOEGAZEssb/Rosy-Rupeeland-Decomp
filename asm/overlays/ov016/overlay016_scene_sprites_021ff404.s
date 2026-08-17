    .text

/* Exact fallback; see src/overlays/ov016/overlay016_scene_sprites.c. */
    .extern func_02073e48
    .extern GraphicsSpriteGroup_CreateStateFromSource
    .extern func_020957f0
    .extern func_02095820
    .extern func_02095940
.global Overlay016_CreateSceneSprite
Overlay016_CreateSceneSprite:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0xc
    mov r4, r0
    ldr r0, [r4, #0xe0]
    add r1, r4, #0xc8
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    str r0, [r4, #0xe4]
    mov r0, #0x2
    str r0, [sp, #0x0]
    mov r1, #0x0
    str r1, [sp, #0x4]
    str r0, [sp, #0x8]
    ldr r0, [r4, #0xe4]
    mov r2, #0x84
    mov r3, #0x20
    bl func_02073e48
    ldr r0, [r4, #0xe0]
    add r1, r4, #0xc8
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r1, r0
    mov r0, #0x0
    str r0, [sp, #0x0]
    add r0, r4, #0xe8
    mov r2, #0x7
    mov r3, #0x2
    bl func_020957f0
    add r0, r4, #0xe8
    mov r1, #0x80
    mov r2, #0xaa
    bl func_02095820
    ldr r0, [r4, #0x54]
    cmp r0, #0x0
    bne L_021ff4a0
    ldr r0, [r4, #0x444]
    ldr r0, [r0, #0x50]
    cmp r0, #0x0
    bne L_021ff4a8
L_021ff4a0:
    add r0, r4, #0xe8
    bl func_02095940
L_021ff4a8:
    ldr r0, [r4, #0xe0]
    add r1, r4, #0xc8
    mov r2, #0x1
    bl GraphicsSpriteGroup_CreateStateFromSource
    mov r1, r0
    mov ip, #0x0
    add r0, r4, #0x194
    mov r2, #0x9
    mov r3, #0x2
    str ip, [sp, #0x0]
    bl func_020957f0
    add r0, r4, #0x194
    mov r1, #0xe8
    mov r2, #0xaa
    bl func_02095820
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, pc}
    .size Overlay016_CreateSceneSprite, . - Overlay016_CreateSceneSprite


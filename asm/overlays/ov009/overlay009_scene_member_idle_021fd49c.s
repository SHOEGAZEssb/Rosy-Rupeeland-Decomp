    .text
    .extern data_ov009_021feb80
    .extern Overlay009_InitSceneFields

/* Exact fallback; see documented portable reconstruction in
 * src/overlays/ov009/overlay009_scene_member_idle.c. */
    .global Overlay009_IdleSceneMember
Overlay009_IdleSceneMember:
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x8
    ldr r1, [r0, #0x28]
    cmp r1, #0x0
    bne L_021fd4d8
    ldr r1, L_021fd4e4
    add r2, sp, #0x0
    ldr ip, [r1, #0x8]
    ldr r3, [r1, #0xc]
    str ip, [sp, #0x0]
    sub r1, r3, #0x48
    str r1, [sp, #0x4]
    add r0, r0, #0x24
    ldmia r2, {r1, r2}
    bl Overlay009_InitSceneFields
L_021fd4d8:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r3, pc}
L_021fd4e4: .word data_ov009_021feb80
    .size Overlay009_IdleSceneMember, . - Overlay009_IdleSceneMember

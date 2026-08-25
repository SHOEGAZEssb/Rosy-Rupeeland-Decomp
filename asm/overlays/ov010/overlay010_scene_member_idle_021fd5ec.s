    .text
    .extern data_ov010_021fea38
    .extern Overlay010_InitSceneFields
/* Exact fallback; see src/overlays/ov010/overlay010_scene_member_idle.c. */
    .global Overlay010_IdleSceneMember
Overlay010_IdleSceneMember:
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x8
    ldr r1, [r0, #0x28]
    cmp r1, #0x0
    bne L_021fd628
    ldr r1, L_021fd634
    add r2, sp, #0x0
    ldr ip, [r1, #0x28]
    ldr r3, [r1, #0x2c]
    str ip, [sp, #0x0]
    sub r1, r3, #0x48
    str r1, [sp, #0x4]
    add r0, r0, #0x24
    ldmia r2, {r1, r2}
    bl Overlay010_InitSceneFields
L_021fd628:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r3, pc}
L_021fd634: .word data_ov010_021fea38
    .size Overlay010_IdleSceneMember, . - Overlay010_IdleSceneMember

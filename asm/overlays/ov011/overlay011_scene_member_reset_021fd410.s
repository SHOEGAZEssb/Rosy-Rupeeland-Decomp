    .text
    .extern data_ov011_021fe3b0
    .extern Overlay011_InitSceneFields

    ; Exact matching fallback; see the documented portable reconstruction in
    ; src/overlays/ov011/overlay011_scene_member_reset.c.
    .global Overlay011_ResetSceneMember
Overlay011_ResetSceneMember:
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x8
    ldr r1, L_021fd44c
    add r2, sp, #0x0
    ldr ip, [r1, #0x28]
    ldr r3, [r1, #0x2c]
    str ip, [sp, #0x0]
    sub r1, r3, #0x48
    str r1, [sp, #0x4]
    add r0, r0, #0x24
    ldmia r2, {r1, r2}
    bl Overlay011_InitSceneFields
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r3, pc}
L_021fd44c: .word data_ov011_021fe3b0
    .size Overlay011_ResetSceneMember, . - Overlay011_ResetSceneMember

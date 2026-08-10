    .text
/* Exact fallback; see src/overlays/ov020/overlay020_scene_helpers.c. */
    .extern func_02071eb8
    .extern GraphicsSpriteGroup_Destroy
    .extern func_020927b8

.global func_ov020_021fd404
func_ov020_021fd404:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4c]
    cmp r0, #0x0
    beq L_021fd424
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fd424:
    ldr r0, [r4, #0xc]
    bl GraphicsSpriteGroup_Destroy
    add r0, r4, #0x28
    bl func_020927b8
    add r0, r4, #0x1c
    bl func_02071eb8
    add r0, r4, #0x10
    bl func_02071eb8
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_ov020_021fd404, . - func_ov020_021fd404

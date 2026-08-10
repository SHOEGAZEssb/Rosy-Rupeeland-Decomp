    .text
/* Exact fallback; see src/overlays/ov020/overlay020_list_runtime.c. */
    .extern func_02071eb8
    .extern GraphicsSpriteGroup_Destroy
    .extern func_020927b8
    .extern func_020c0c24
    .extern func_ov020_021fd034

.global func_ov020_021fcfd4
func_ov020_021fcfd4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    bl GraphicsSpriteGroup_Destroy
    ldr r0, [r4, #0x44]
    cmp r0, #0x0
    beq L_021fcffc
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_021fcffc:
    ldr r0, [r4, #0x38]
    cmp r0, #0x0
    beq L_021fd018
    ldr r3, L_021fd030
    mov r1, #0xc
    mov r2, #0x8
    bl func_020c0c24
L_021fd018:
    add r0, r4, #0x14
    bl func_020927b8
    add r0, r4, #0x8
    bl func_02071eb8
    mov r0, r4
    ldmia sp!, {r4, pc}
L_021fd030: .word func_ov020_021fd034
    .size func_ov020_021fcfd4, . - func_ov020_021fcfd4

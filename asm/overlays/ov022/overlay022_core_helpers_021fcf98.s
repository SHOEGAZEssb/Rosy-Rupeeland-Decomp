    .text
/* Exact fallback; see src/overlays/ov022/overlay022_core_helpers.c. */
    .extern data_ov022_02200654
    .extern func_02071eb8
    .extern GraphicsSpriteGroup_Destroy
    .extern PresentationList_DeleteAll

.global func_ov022_021fcf98
func_ov022_021fcf98:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x48
    bl PresentationList_DeleteAll
    ldr r0, [r4, #0x0]
    bl GraphicsSpriteGroup_Destroy
    ldr r1, L_021fcfd0
    add r0, r4, #0x48
    str r1, [r4, #0x48]
    bl PresentationList_DeleteAll
    add r0, r4, #0x4
    bl func_02071eb8
    mov r0, r4
    ldmia sp!, {r4, pc}
L_021fcfd0: .word data_ov022_02200654
.size func_ov022_021fcf98, . - func_ov022_021fcf98

.text

/* Exact fallback; see src/overlays/ov025/overlay025_effect_controller.c. */
.extern __destroy_arr
.extern data_ov025_02203354
.extern func_02071eb8
.extern GraphicsSpriteGroup_Destroy
.extern func_ov025_021fdec8
.extern Heap_Free


    .global func_ov025_021fe118
func_ov025_021fe118:
    stmdb sp!, {r4, lr}
    ldr r1, L_021fe16c
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0xe0]
    bl GraphicsSpriteGroup_Destroy
    ldr r0, [r4, #0xe4]
    bl GraphicsSpriteGroup_Destroy
    add r0, r4, #0xd4
    bl func_02071eb8
    add r0, r4, #0xb0
    mov r1, #0x3
    mov r2, #0xc
    ldr r3, L_021fe170
    bl __destroy_arr
    mov r0, r4
    bl func_ov025_021fdec8
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
L_021fe16c: .word data_ov025_02203354
L_021fe170: .word func_02071eb8
.size func_ov025_021fe118, .-func_ov025_021fe118


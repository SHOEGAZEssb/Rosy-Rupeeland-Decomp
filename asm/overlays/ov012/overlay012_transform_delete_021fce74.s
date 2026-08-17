    .text
    .extern data_ov012_021fe5f4
    .extern data_020f4e18
    .extern GraphicsArchive_ReleaseOwlvResource
    .extern Heap_Free
/* Exact register-allocation fallback; see src/overlays/ov012/overlay012_transform_delete.c. */
    .global func_ov012_021fce74
func_ov012_021fce74:
    stmdb sp!, {r4, lr}
    ldr r1, L_021fceac
    mov r4, r0
    str r1, [r4]
    ldr r1, [r4, #4]
    cmp r1, #0
    beq L_021fce9c
    ldr r0, L_021fceb0
    ldr r0, [r0]
    bl GraphicsArchive_ReleaseOwlvResource
L_021fce9c:
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
L_021fceac:
    .word data_ov012_021fe5f4
L_021fceb0:
    .word data_020f4e18
    .size func_ov012_021fce74, . - func_ov012_021fce74

.text
/* Exact fallback; see overlay039_embedded_destroy.c for portable C. */
    .extern VecFx32Object_Destroy
    .extern __destroy_arr
    .extern func_ov039_021fd06c
    .extern func_ov039_021fce5c

    .global func_ov039_021fd01c
func_ov039_021fd01c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x320
    bl VecFx32Object_Destroy
    add r0, r4, #0x310
    bl VecFx32Object_Destroy
    ldr r3, L_021fd064
    add r0, r4, #0x1d8
    mov r1, #0x27
    mov r2, #0x8
    bl __destroy_arr
    add r0, r4, #0x4
    mov r1, #0x27
    mov r2, #0xc
    ldr r3, L_021fd068
    bl __destroy_arr
    mov r0, r4
    ldmia sp!, {r4, pc}
L_021fd064: .word func_ov039_021fd06c
L_021fd068: .word func_ov039_021fce5c
    .size func_ov039_021fd01c, .-func_ov039_021fd01c

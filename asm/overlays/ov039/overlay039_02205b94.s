.text
/* Exact fallback; see overlay039_resource_objects.c for portable C. */
    .extern VecFx32Object_Destroy
    .extern func_02099fb0
    .global func_ov039_02205b94
func_ov039_02205b94:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0xc4
    bl VecFx32Object_Destroy
    add r0, r4, #0x94
    bl VecFx32Object_Destroy
    add r0, r4, #0x84
    bl VecFx32Object_Destroy
    mov r0, r4
    bl func_02099fb0
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_ov039_02205b94, .-func_ov039_02205b94


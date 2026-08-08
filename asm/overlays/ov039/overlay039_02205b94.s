.text
/* Exact fallback; see overlay039_resource_objects.c for portable C. */
    .extern func_02005058
    .extern func_02099fb0
    .global func_ov039_02205b94
func_ov039_02205b94:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0xc4
    bl func_02005058
    add r0, r4, #0x94
    bl func_02005058
    add r0, r4, #0x84
    bl func_02005058
    mov r0, r4
    bl func_02099fb0
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_ov039_02205b94, .-func_ov039_02205b94


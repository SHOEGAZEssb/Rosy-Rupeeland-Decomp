.text
/* Exact fallback; see overlay039_resource_objects.c for portable C. */
    .extern data_ov039_02208464
    .global func_ov039_02204900
func_ov039_02204900:
    ldr r2, L_02204918
    mov r1, #0x0
    str r2, [r0, #0x0]
    strh r1, [r0, #0x4]
    strh r1, [r0, #0x6]
    bx lr
L_02204918: .word data_ov039_02208464
    .size func_ov039_02204900, .-func_ov039_02204900


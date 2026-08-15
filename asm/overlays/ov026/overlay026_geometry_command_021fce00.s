.text

/* Exact fallback; see src/overlays/ov026/overlay026_geometry_command.c. */
.extern data_ov026_02204a28
.extern Presentation_Init

    .global func_ov026_021fce00
func_ov026_021fce00:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    mov r6, r1
    mov r5, r2
    mov r4, r3
    bl Presentation_Init
    ldr r1, L_021fce4c
    mov r0, #0x0
    str r1, [r7, #0x0]
    str r6, [r7, #0x9c]
    str r5, [r7, #0xa0]
    strh r4, [r7, #0xa4]
    strh r0, [r7, #0xa6]
    strh r0, [r7, #0xa8]
    strh r0, [r7, #0xaa]
    mov r1, #0x1
    mov r0, r7
    str r1, [r7, #0xac]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
L_021fce4c: .word data_ov026_02204a28
.size func_ov026_021fce00, .-func_ov026_021fce00


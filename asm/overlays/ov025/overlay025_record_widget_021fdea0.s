.text

/* Exact fallback; see src/overlays/ov025/overlay025_record_widget.c. */
.extern func_ov025_021fdc60


    .global func_ov025_021fdea0
func_ov025_021fdea0:
    ldr r3, [r0, #0x78]
    mov r2, #0x3c
    mul r2, r3, r2
    add r3, r2, #0x28
    ldr r2, [r0, #0xc]
    add r3, r1, r3
    ldr ip, L_021fdec4
    str r3, [r2, #0x1c]
    bx ip
L_021fdec4: .word func_ov025_021fdc60
.size func_ov025_021fdea0, .-func_ov025_021fdea0


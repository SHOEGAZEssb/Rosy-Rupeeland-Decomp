.text
; Matching fallback for the portable implementation in src/overlays/ov069/overlay069_recovery.c.
.extern __construct_array
.extern func_02004fe0
.extern func_02005058
.extern func_ov069_02210a24

.global func_ov069_022109c4
func_ov069_022109c4:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    ldr ip, .L_02210a1c
    ldr r3, .L_02210a20
    add r0, r4, #0x4
    mov r1, #0x5a
    mov r2, #0x10
    str ip, [sp, #0x0]
    bl __construct_array
    ldr ip, .L_02210a1c
    ldr r3, .L_02210a20
    add r0, r4, #0xa90
    mov r1, #0x5a
    mov r2, #0x10
    str ip, [sp, #0x0]
    bl __construct_array
    mov r0, r4
    bl func_ov069_02210a24
    mov r0, r4
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
.L_02210a1c: .word func_02005058
.L_02210a20: .word func_02004fe0
.size func_ov069_022109c4, . - func_ov069_022109c4

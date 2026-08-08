.text
/* Exact fallback; see overlay039_target_update.c for portable C. */
    .extern func_ov039_022014f8
    .global func_ov039_022014e0
func_ov039_022014e0:
    ldr ip, L_022014f4
    mov r2, r1
    add r1, r2, #0x2c
    add r2, r2, #0xac
    bx ip
L_022014f4: .word func_ov039_022014f8
    .size func_ov039_022014e0, .-func_ov039_022014e0


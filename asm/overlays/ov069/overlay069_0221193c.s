.text
; Matching fallback for the portable implementation in src/overlays/ov069/overlay069_recovery.c.
.extern func_02005058
.extern func_02099fb0

.global func_ov069_0221193c
func_ov069_0221193c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x50
    bl func_02005058
    mov r0, r4
    bl func_02099fb0
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov069_0221193c, . - func_ov069_0221193c

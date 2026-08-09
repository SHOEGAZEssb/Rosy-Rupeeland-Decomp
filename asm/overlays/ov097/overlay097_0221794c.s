.text
; Matching fallback for the portable implementation in src/overlays/ov097/overlay097_recovery.c.
.extern func_02005058
.extern func_ov078_02212ba0

.global func_ov097_0221794c
func_ov097_0221794c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x2d8
    bl func_02005058
    add r0, r4, #0x2c8
    bl func_02005058
    mov r0, r4
    bl func_ov078_02212ba0
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov097_0221794c, . - func_ov097_0221794c

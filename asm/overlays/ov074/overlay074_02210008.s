.text
; Matching fallback for the portable implementation in src/overlays/ov074/overlay074_recovery.c.
.extern func_ov074_02211b58

.global func_ov074_02210008
func_ov074_02210008:
    stmdb sp!, {r4, lr}
    mov r4, r0
    cmp r4, r1
    beq .L_0221001c
    bl func_ov074_02211b58
.L_0221001c:
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov074_02210008, . - func_ov074_02210008

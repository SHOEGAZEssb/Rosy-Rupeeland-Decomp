.text
; Matching fallback for the portable implementation in src/overlays/ov091/overlay091_recovery.c.
.extern func_02004fe0
.extern VecFx32Triple_Set

.global func_ov091_02218848
func_ov091_02218848:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    mov r6, r1
    mov r5, r2
    mov r4, r3
    bl func_02004fe0
    add r0, r7, #0x10
    bl func_02004fe0
    add r0, r7, #0x20
    bl func_02004fe0
    mov r1, r6
    mov r2, r5
    mov r3, r4
    mov r0, r7
    bl VecFx32Triple_Set
    mov r0, r7
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.size func_ov091_02218848, . - func_ov091_02218848

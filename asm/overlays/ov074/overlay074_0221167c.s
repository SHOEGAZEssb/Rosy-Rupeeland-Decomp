.text
; Matching fallback for the portable implementation in src/overlays/ov074/overlay074_recovery.c.
.extern func_02004fe0
.extern func_020068b0

.global func_ov074_0221167c
func_ov074_0221167c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r1, #0x0
    strh r1, [r4, #0x0]
    add r0, r4, #0x8
    strh r1, [r4, #0x2]
    bl func_02004fe0
    add r0, r4, #0x18
    bl func_020068b0
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov074_0221167c, . - func_ov074_0221167c

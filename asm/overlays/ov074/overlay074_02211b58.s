.text
; Matching fallback for the portable implementation in src/overlays/ov074/overlay074_recovery.c.
.extern func_ov074_02211b28

.global func_ov074_02211b58
func_ov074_02211b58:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    add r0, r5, #0x4
    add r1, r4, #0x4
    bl func_ov074_02211b28
    add r0, r5, #0xc
    add r1, r4, #0xc
    bl func_ov074_02211b28
    ldr r0, [r4, #0x14]
    str r0, [r5, #0x14]
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov074_02211b58, . - func_ov074_02211b58

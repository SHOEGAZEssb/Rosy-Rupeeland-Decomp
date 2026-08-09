.text
; Matching fallback for the portable implementation in src/overlays/ov079/overlay079_recovery.c.
.extern func_ov079_0221317c
.extern func_ov079_0221340c

.global func_ov079_0221365c
func_ov079_0221365c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r1
    ldrh r1, [r4, #0x1e]
    mov r5, r0
    mov r1, r1, lsl #0x1e
    mov r1, r1, lsr #0x1e
    bl func_ov079_0221317c
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    mov r0, r5
    bl func_ov079_0221340c
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, [r5, #0x224]
    tst r0, #0x1
    add r0, r5, r0, asr #0x1
    ldrne r2, [r0, #0x0]
    ldrne r1, [r5, #0x220]
    ldrne r2, [r2, r1]
    mov r1, r4
    ldreq r2, [r5, #0x220]
    blx r2
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov079_0221365c, . - func_ov079_0221365c

.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.

.global func_ov075_0221343c
func_ov075_0221343c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x29c]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa8]
    blx r1
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, pc}
    ldr r0, [r4, #0x264]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, pc}
.size func_ov075_0221343c, . - func_ov075_0221343c

.text
; Matching fallback for the portable implementation in src/overlays/ov056/overlay056_recovery.c.
.extern Heap_Free
.extern func_ov056_0220e71c

.global func_ov056_0220e890
func_ov056_0220e890:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    cmp r1, r0
    ldreq r0, [r1, #0x0]
    streq r0, [r4, #0x4]
    ldrne r2, [r1, #0x0]
    ldrne r0, [r1, #0x4]
    strne r2, [r0, #0x0]
    ldr r0, [r4, #0x8]
    cmp r1, r0
    ldreq r0, [r1, #0x4]
    streq r0, [r4, #0x8]
    ldmneia r1, {r0, r2}
    strne r2, [r0, #0x4]
    cmp r1, #0x0
    beq .L_0220e8dc
    mov r0, r1
    bl Heap_Free
.L_0220e8dc:
    ldr r0, [r4, #0xc]
    subs r0, r0, #0x1
    str r0, [r4, #0xc]
    ldmneia sp!, {r4, pc}
    mov r0, r4
    bl func_ov056_0220e71c
    ldmia sp!, {r4, pc}
.size func_ov056_0220e890, . - func_ov056_0220e890

.text
; Matching fallback for the portable implementation in src/overlays/ov090/overlay090_recovery.c.
.extern func_ov090_0221b97c
.extern func_ov090_0221bc5c

.global func_ov090_0221c3dc
func_ov090_0221c3dc:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r7, #0x10
    mov r6, r0
    mov r5, r1
    mov r4, #0x0
    mov r8, r7
    b .L_0221c424
.L_0221c3f8:
    ldr r0, [r6, #0x4]
    cmp r5, #0x0
    ldr r0, [r0, r4, lsl #0x2]
    ldr r0, [r0, #0x4]
    beq .L_0221c418
    mov r1, r8
    bl func_ov090_0221bc5c
    b .L_0221c420
.L_0221c418:
    mov r1, r7
    bl func_ov090_0221b97c
.L_0221c420:
    add r4, r4, #0x1
.L_0221c424:
    ldrsh r0, [r6, #0x8]
    cmp r4, r0
    blt .L_0221c3f8
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.size func_ov090_0221c3dc, . - func_ov090_0221c3dc

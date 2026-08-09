.text
; Matching fallback for the portable implementation in src/overlays/ov090/overlay090_recovery.c.
.extern func_02005070
.extern func_02005084
.extern func_020be334
.extern func_ov090_0221b3d0

.global func_ov090_0221c350
func_ov090_0221c350:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r1
    mov r7, r0
    mov r0, r6
    bl func_02005070
    ldr r1, [r7, #0xc]
    mov r4, r0
    sub r0, r4, r1
    bl func_020be334
    mov r5, r0
    cmp r5, #0x1000
    ble .L_0221c3d4
    ldr r0, [r6, #0x4]
    cmp r0, #0x0
    ldreq r0, [r6, #0x8]
    cmpeq r0, #0x0
    ldreq r0, [r6, #0xc]
    cmpeq r0, #0x0
    beq .L_0221c3d4
    mov r0, r6
    bl func_02005084
    ldr r0, [r7, #0xc]
    cmp r4, r0
    bge .L_0221c3c0
    mov r1, #0x2000
    mov r0, r6
    rsb r1, r1, #0x0
    bl func_ov090_0221b3d0
.L_0221c3c0:
    mov r0, r6
    mov r1, r5
    bl func_ov090_0221b3d0
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0221c3d4:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.size func_ov090_0221c350, . - func_ov090_0221c350

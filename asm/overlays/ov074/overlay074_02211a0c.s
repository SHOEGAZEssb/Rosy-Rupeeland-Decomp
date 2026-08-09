.text
; Matching fallback for the portable implementation in src/overlays/ov074/overlay074_recovery.c.
.extern GX_SetGraphicsMode
.extern func_ov074_022116a8
.extern func_ov074_02211994

.global func_ov074_02211a0c
func_ov074_02211a0c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r1, [r4, #0x0]
    cmp r1, #0x0
    beq .L_02211a2c
    cmp r1, #0x1
    beq .L_02211a40
    ldmia sp!, {r4, pc}
.L_02211a2c:
    bl func_ov074_02211994
    ldrh r0, [r4, #0x0]
    add r0, r0, #0x1
    strh r0, [r4, #0x0]
    ldmia sp!, {r4, pc}
.L_02211a40:
    mov r1, #0x0
    mov r2, r1
    mov r0, #0x6
    bl GX_SetGraphicsMode
    mov r0, r4
    bl func_ov074_022116a8
    ldrh r0, [r4, #0x0]
    add r0, r0, #0x1
    strh r0, [r4, #0x0]
    ldmia sp!, {r4, pc}
.size func_ov074_02211a0c, . - func_ov074_02211a0c

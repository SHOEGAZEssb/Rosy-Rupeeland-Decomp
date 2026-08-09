.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.
.extern func_020050a4
.extern func_02034b60
.extern func_ov095_0221bed0

.global func_ov095_0221b720
func_ov095_0221b720:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x200
    ldrh r0, [r0, #0x98]
    mov r1, #0x2
    cmp r0, #0x0
    movne r0, #0x28
    moveq r0, #0x23
    strh r0, [r4, #0xae]
    ldrsh r2, [r4, #0xae]
    add r0, r4, #0x200
    strh r2, [r0, #0x9a]
    strh r1, [r4, #0xac]
    ldrh r0, [r0, #0x98]
    cmp r0, #0x0
    moveq r0, #0x0
    streqh r0, [r4, #0xda]
    beq .L_0221b788
    mov r3, #0x1
    mov r0, r4
    mov r1, #0x0
    mov r2, #0x1000
    strh r3, [r4, #0xda]
    bl func_02034b60
    mov r0, r4
    bl func_ov095_0221bed0
.L_0221b788:
    add r0, r4, #0x29c
    add r1, r4, #0x18
    bl func_020050a4
    ldmia sp!, {r4, pc}
.size func_ov095_0221b720, . - func_ov095_0221b720

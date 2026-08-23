.text
; Matching fallback for the portable implementation in src/overlays/ov059/overlay059_recovery.c.
.extern GamePhaseRegionTable_GetRegion
.extern GamePhaseRegionTable_IsRegionRevealed
.extern GamePhaseRegionTable_GetRegionCount
.extern func_020befec
.extern func_ov059_0221026c
.extern func_ov059_022102ac

.global func_ov059_022101b0
func_ov059_022101b0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r5, r0
    mov r4, r1
    mov r8, #0x0
    mov r11, #0xc0
    b .L_02210258
.L_022101c8:
    mov r0, r4
    mov r1, r8
    bl GamePhaseRegionTable_GetRegion
    mov r6, r0
    ldrsh r10, [r6, #0x0]
    ldrsh r0, [r6, #0x2]
    mov r1, r11
    mov r2, r10, asr #0x7
    add r2, r10, r2, lsr #0x18
    mov r9, r2, asr #0x8
    bl func_020befec
    ldrsh r1, [r6, #0x4]
    mov r7, r0
    mov r0, r6
    sub r1, r1, r10
    mov r1, r1, lsl #0x10
    mov r2, r1, asr #0x10
    mov r1, r2, asr #0x7
    add r1, r2, r1, lsr #0x18
    mov r10, r1, asr #0x8
    bl func_ov059_0221026c
    mov r1, #0xc0
    bl func_020befec
    mov r6, r0
    mov r0, r4
    mov r1, r8
    bl GamePhaseRegionTable_IsRegionRevealed
    cmp r0, #0x0
    beq .L_02210254
    mov r0, r5
    mov r1, r9
    mov r2, r7
    mov r3, r10
    str r6, [sp, #0x0]
    bl func_ov059_022102ac
.L_02210254:
    add r8, r8, #0x1
.L_02210258:
    mov r0, r4
    bl GamePhaseRegionTable_GetRegionCount
    cmp r8, r0
    blt .L_022101c8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
.size func_ov059_022101b0, . - func_ov059_022101b0

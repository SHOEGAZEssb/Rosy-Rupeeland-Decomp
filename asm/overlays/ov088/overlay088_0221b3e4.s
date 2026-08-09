.text
; Matching fallback for the portable implementation in src/overlays/ov088/overlay088_recovery.c.
.extern func_ov088_02219d9c
.extern gTouchPanelManager

.global func_ov088_0221b3e4
func_ov088_0221b3e4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov088_02219d9c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, .L_0221b424
    ldr r0, [r0, #0x0]
    ldr r0, [r0, #0x4]
    cmp r0, #0x1
    addeq r0, r4, #0x200
    ldreqh r1, [r0, #0x1a]
    orreq r1, r1, #0x800
    streqh r1, [r0, #0x1a]
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_0221b424: .word gTouchPanelManager
.size func_ov088_0221b3e4, . - func_ov088_0221b3e4

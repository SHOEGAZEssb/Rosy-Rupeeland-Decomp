.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.
.extern data_ov095_0221cf4c
.extern func_02004fe0
.extern Actor_QueryTerrainHeight
.extern func_0203db80

.global func_ov095_0221b23c
func_ov095_0221b23c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0203db80
    ldr r1, .L_0221b29c
    add r0, r4, #0x200
    str r1, [r4, #0x0]
    mov r1, #0x0
    strh r1, [r0, #0x98]
    strh r1, [r0, #0x9a]
    add r0, r4, #0x29c
    bl func_02004fe0
    ldr r1, [r4, #0x230]
    ldr r2, [r4, #0x234]
    mov r0, r4
    mov r1, r1, asr #0x10
    mov r2, r2, asr #0x10
    bl Actor_QueryTerrainHeight
    mov r0, r0, lsl #0x10
    str r0, [r4, #0x238]
    ldr r1, [r4, #0x260]
    mov r0, r4
    orr r1, r1, #0x40000
    str r1, [r4, #0x260]
    ldmia sp!, {r4, pc}
.L_0221b29c: .word data_ov095_0221cf4c
.size func_ov095_0221b23c, . - func_ov095_0221b23c

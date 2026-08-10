.text
; Matching fallback for the portable implementation in src/overlays/ov061/overlay061_recovery.c.
.extern data_021052fc
.extern func_02008570
.extern GamePhaseRuntime_SetPlacementMode
.extern func_0200ec6c
.extern func_0201140c
.extern gLupyContext

.global func_ov061_022101dc
func_ov061_022101dc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x28]
    mov r1, #0x1
    cmp r0, #0x0
    bne .L_02210220
    ldr r0, .L_02210258
    ldr r0, [r0, #0x0]
    add r0, r0, #0x24
    bl func_0200ec6c
    mov r2, #0x4000000
    ldr r1, [r2, #0x0]
    ldrh r0, [r4, #0x24]
    bic r1, r1, #0x1f00
    orr r0, r1, r0, lsl #0x8
    str r0, [r2, #0x0]
    b .L_02210244
.L_02210220:
    ldr r0, .L_02210258
    mov r2, r1
    ldr r0, [r0, #0x0]
    bl func_02008570
    ldr r0, .L_02210258
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    mov r2, r1
    bl GamePhaseRuntime_SetPlacementMode
.L_02210244:
    ldr r0, .L_0221025c
    ldr r1, [r4, #0x30]
    ldr r0, [r0, #0x0]
    bl func_0201140c
    ldmia sp!, {r4, pc}
.L_02210258: .word data_021052fc
.L_0221025c: .word gLupyContext
.size func_ov061_022101dc, . - func_ov061_022101dc

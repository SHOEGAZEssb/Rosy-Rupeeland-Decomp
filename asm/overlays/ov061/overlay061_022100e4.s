.text
; Matching fallback for the portable implementation in src/overlays/ov061/overlay061_recovery.c.
.extern data_021052fc
.extern GamePhaseRuntime_GetActorCollection
.extern GamePhaseRuntime_SetPlacementMode
.extern func_0200ec6c
.extern func_0201140c
.extern func_0202d68c
.extern gLupyContext

.global func_ov061_022100e4
func_ov061_022100e4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x28]
    ldr r2, .L_022101c8
    cmp r0, #0x0
    bne .L_02210158
    mov r3, #0x4000000
    ldr r0, [r3, #0x0]
    mov r1, #0x5000000
    and r0, r0, #0x1f00
    mov r0, r0, lsr #0x8
    strh r0, [r4, #0x24]
    ldr r0, [r3, #0x0]
    bic r0, r0, #0x1f00
    orr r0, r0, #0x1000
    str r0, [r3, #0x0]
    strh r2, [r1, #0x0]
    ldr r0, .L_022101cc
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x24
    bl func_0200ec6c
    ldr r0, .L_022101cc
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_GetActorCollection
    mov r1, #0x0
    bl func_0202d68c
    b .L_02210198
.L_02210158:
    ldr ip, .L_022101d0
    ldr r1, .L_022101d4
    ldr r0, [ip, #0x0]
    and r0, r0, #0x1f00
    mov r0, r0, lsr #0x8
    strh r0, [r4, #0x24]
    ldr r3, [ip, #0x0]
    ldr r0, .L_022101cc
    bic r3, r3, #0x1f00
    orr r3, r3, #0x1000
    str r3, [ip, #0x0]
    strh r2, [r1, #0x0]
    ldr r0, [r0, #0x0]
    mov r1, #0x0
    mov r2, #0x1
    bl GamePhaseRuntime_SetPlacementMode
.L_02210198:
    ldr r0, .L_022101d8
    ldr r0, [r0, #0x0]
    ldrh r0, [r0, #0xb0]
    tst r0, #0x1
    moveq r1, #0x1
    movne r1, #0x0
    str r1, [r4, #0x30]
    ldr r0, .L_022101d8
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    bl func_0201140c
    ldmia sp!, {r4, pc}
.L_022101c8: .word 0x7fff
.L_022101cc: .word data_021052fc
.L_022101d0: .word 0x4001000
.L_022101d4: .word 0x5000400
.L_022101d8: .word gLupyContext
.size func_ov061_022100e4, . - func_ov061_022100e4

.text
; Matching fallback for the portable implementation in src/overlays/ov072/overlay072_recovery.c.
.extern GameWork_TestFlag
.extern gGamePhaseRuntime
.extern data_ov072_022109dc
.extern gGameWork

.global func_ov072_02210818
func_ov072_02210818:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r0, .L_022108dc
    mov r4, #0x0
    ldr r1, [r0, #0x0]
    mov lr, #0x1c
    add r0, r1, #0x2000
    ldr r2, [r0, #0xea4]
    add r0, r1, #0x3000
    ldr r5, [r0, #0xbc]
    ldr r1, [r2, #0x1c]
    ldr r0, [r2, #0x20]
    mov r3, r1, asr #0xc
    mov ip, r0, asr #0xc
    ldr r2, [r5, #0x0]
    ldr r0, .L_022108e0
    b .L_022108cc
.L_02210858:
    mul r1, r4, lr
    ldr r5, [r0, r1]
    add r1, r0, r1
    cmp r5, r2
    bne .L_022108c8
    ldr r6, [r1, #0x4]
    cmp r6, r3
    ldrle r5, [r1, #0xc]
    addle r5, r6, r5
    cmple r3, r5
    ldrle r6, [r1, #0x8]
    cmple r6, ip
    ldrle r5, [r1, #0x10]
    addle r5, r6, r5
    cmple ip, r5
    bgt .L_022108c8
    ldr r1, [r1, #0x18]
    mvn r0, #0x0
    cmp r1, r0
    beq .L_022108c0
    ldr r0, .L_022108e4
    ldr r0, [r0, #0x0]
    bl GameWork_TestFlag
    cmp r0, #0x0
    movne r0, r4
    ldmneia sp!, {r4, r5, r6, pc}
.L_022108c0:
    mvn r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_022108c8:
    add r4, r4, #0x1
.L_022108cc:
    cmp r4, #0x3
    blt .L_02210858
    mvn r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_022108dc: .word gGamePhaseRuntime
.L_022108e0: .word data_ov072_022109dc
.L_022108e4: .word gGameWork
.size func_ov072_02210818, . - func_ov072_02210818

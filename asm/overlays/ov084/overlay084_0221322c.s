.text
; Matching fallback for the portable implementation in src/overlays/ov084/overlay084_recovery.c.
.extern gGamePhaseRuntime
.extern data_ov084_02214108
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern GamePhaseRuntime_GetActorCollection
.extern ActorExtendedType2_GetDescriptorValue25
.extern func_020befec
.extern func_ov084_022134f0

.global func_ov084_0221322c
func_ov084_0221322c:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r5, r0
    ldr r2, [r5, #0x14]
    mov r4, r1
    bic r1, r2, #0x40
    str r1, [r5, #0x14]
    bl ActorExtendedType2_GetDescriptorValue25
    cmp r0, #0x0
    bne .L_022132dc
    add r0, r5, #0x200
    ldrsh r2, [r0, #0x9c]
    ldr r1, .L_02213410
    cmp r2, r1
    blt .L_02213288
    mov r0, r5
    bl func_ov084_022134f0
    ldr r2, [r5, #0x54]
    mov r0, #0x0
    ldrh r1, [r2, #0x24]
    orr r1, r1, #0x4
    strh r1, [r2, #0x24]
    b .L_02213408
.L_02213288:
    cmp r2, #0xf0
    blt .L_022132dc
    ldr r1, [r5, #0x260]
    mov r2, #0x11
    bic r1, r1, #0x3
    str r1, [r5, #0x260]
    ldrsh r0, [r0, #0x9c]
    add r1, r5, #0x200
    cmp r0, #0xf0
    ldreq r0, [r5, #0x14]
    orreq r0, r0, #0x40
    streq r0, [r5, #0x14]
    ldr r0, [r5, #0x24]
    add r0, r0, #0x6000
    str r0, [r5, #0x24]
    ldrsh r3, [r1, #0x9c]
    mov r0, #0x0
    add r3, r3, #0x1
    strh r3, [r1, #0x9c]
    strh r2, [r5, #0xd6]
    b .L_02213408
.L_022132dc:
    add r0, r5, #0x200
    ldrsh r0, [r0, #0x9c]
    cmp r0, #0xf0
    blt .L_022132fc
    mov r0, r5
    bl func_ov084_022134f0
    mov r0, #0x0
    b .L_02213408
.L_022132fc:
    ldr r1, [r5, #0x260]
    mov r0, r5
    orr r1, r1, #0x3
    str r1, [r5, #0x260]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x38]
    blx r1
    cmp r0, #0x0
    movne r0, #0x0
    bne .L_02213408
    ldrh r0, [r4, #0x1a]
    tst r0, #0x2
    beq .L_02213348
    ldr r0, .L_02213414
    ldr r1, [r0, #0x28]
    ldr r0, [r0, #0x2c]
    str r1, [r5, #0x218]
    str r0, [r5, #0x21c]
    b .L_02213404
.L_02213348:
    ldr r0, .L_02213418
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl GamePhaseRuntime_GetActorCollection
    add r0, r0, #0x2000
    ldr r0, [r0, #0xe7c]
    ldr r0, [r0, #0xd0]
    tst r0, #0x100
    bne .L_022133f4
    ldr r0, [r5, #0x228]
    ldr r3, [r5, #0x1c]
    ldr r2, [r0, #0x1c]
    ldr r1, [r5, #0x20]
    sub r3, r3, r2
    ldr r0, [r0, #0x20]
    mov r4, r3, asr #0xc
    sub r2, r1, r0
    add r0, sp, #0x0
    add r1, r5, #0x18
    mov r6, r2, asr #0xc
    bl VecFx32Object_InitCopy
    add r0, r5, #0x200
    ldrsh r0, [r0, #0x9c]
    mov r1, #0x3c
    bl func_020befec
    cmp r1, #0x14
    ble .L_022133cc
    ldr r1, [sp, #0x4]
    ldr r0, [sp, #0x8]
    add r1, r1, r4, lsl #0xc
    add r0, r0, r6, lsl #0xc
    str r1, [sp, #0x4]
    str r0, [sp, #0x8]
.L_022133cc:
    ldr r1, [r5, #0xd0]
    mov r0, r5
    orr r1, r1, #0x2
    str r1, [r5, #0xd0]
    ldr r2, [r0, #0x0]
    add r1, sp, #0x0
    ldr r2, [r2, #0xd0]
    blx r2
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
.L_022133f4:
    add r0, r5, #0x200
    ldrsh r1, [r0, #0x9c]
    add r1, r1, #0x1
    strh r1, [r0, #0x9c]
.L_02213404:
    mov r0, #0x0
.L_02213408:
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
.L_02213410: .word 0x10e
.L_02213414: .word data_ov084_02214108
.L_02213418: .word gGamePhaseRuntime
.size func_ov084_0221322c, . - func_ov084_0221322c

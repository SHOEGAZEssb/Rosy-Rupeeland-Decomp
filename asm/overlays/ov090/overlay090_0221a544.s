.text
; Matching fallback for the documented portable implementation in
; src/overlays/ov090/overlay090_title_render_callback.c.
.extern gGamePhaseRuntime
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern GraphicsSpriteState_SetDepthOrderedWorldPositionFromOrigin
.extern GraphicsSpriteState_SetDepthOrderedWorldPosition
.extern Actor_UpdatePresentation

.global func_ov090_0221a544
func_ov090_0221a544:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x18
    mov r6, r1
    mov r5, r2
    bl Actor_UpdatePresentation
    ldr r1, .L_0221a6a4
    ldr r0, [r6, #0x200]
    ldr r1, [r1, #0x0]
    cmp r0, #0x0
    add r1, r1, #0x2000
    ldr r4, [r1, #0xea4]
    beq .L_0221a5d8
    ldrb r1, [r6, #0x1ec]
    ldr r2, [r4, #0x24]
    cmp r1, #0x1f
    movne ip, #0x0
    moveq ip, #0x18000
    mov r1, #0x8
    str r2, [sp, #0x0]
    str r1, [sp, #0x4]
    ldr r3, [r4, #0x20]
    rsbeq ip, ip, #0x0
    ldr r2, [r4, #0x1c]
    mov r1, r5
    add r3, r3, ip
    bl GraphicsSpriteState_SetDepthOrderedWorldPositionFromOrigin
    ldr r0, [r4, #0x20]
    cmp r0, #0x200000
    blt .L_0221a5c4
    ldrb r0, [r6, #0x222]
    tst r0, #0x4
    beq .L_0221a5d8
.L_0221a5c4:
    ldr r0, [r6, #0x200]
    mov r1, #0x0
    strb r1, [r0, #0x3a]
    ldr r0, [r6, #0x200]
    strh r1, [r0, #0x28]
.L_0221a5d8:
    ldrb r0, [r6, #0x1ec]
    add r0, r0, #0xf2
    and r0, r0, #0xff
    cmp r0, #0x1
    bhi .L_0221a68c
    add r0, sp, #0x8
    add r1, r4, #0x18
    bl VecFx32Object_InitCopy
    ldrb r0, [r6, #0x1ec]
    ldr r2, [sp, #0x14]
    cmp r0, #0xe
    addne r0, r6, #0x100
    ldrneh r0, [r0, #0xf0]
    moveq r3, #0x80
    rsbne r3, r0, #0x7f
    ldr r0, .L_0221a6a8
    mov r1, r0, lsr #0x1
    mul r0, r3, r0
    mul r1, r3, r1
    sub r3, r2, r0
    ldr r2, [sp, #0x10]
    add r0, r1, #0x10000
    sub r0, r2, r0
    str r0, [sp, #0x10]
    str r3, [sp, #0x14]
    mov r0, #0x4
    str r0, [sp, #0x0]
    ldr r0, [r6, #0x248]
    ldr r1, [sp, #0xc]
    ldr r2, [sp, #0x10]
    ldr r3, [sp, #0x14]
    bl GraphicsSpriteState_SetDepthOrderedWorldPosition
    ldr r4, [r6, #0x248]
    mov r3, #0x0
    ldrh r1, [r4, #0x24]
    add r0, sp, #0x8
    mov r2, #0x10
    bic r1, r1, #0x10
    strh r1, [r4, #0x24]
    ldr r1, [r6, #0x248]
    strb r3, [r1, #0x3a]
    ldr r1, [r6, #0x248]
    strh r2, [r1, #0x28]
    bl VecFx32Object_Destroy
    b .L_0221a69c
.L_0221a68c:
    ldr r1, [r6, #0x248]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x10
    strh r0, [r1, #0x24]
.L_0221a69c:
    add sp, sp, #0x18
    ldmia sp!, {r4, r5, r6, pc}
.L_0221a6a4: .word gGamePhaseRuntime
.L_0221a6a8: .word 0x4cd
.size func_ov090_0221a544, . - func_ov090_0221a544

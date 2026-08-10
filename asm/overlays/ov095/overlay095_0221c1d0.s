.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.
.extern Heap_Alloc
.extern data_ov095_0221d288
.extern AuxiliaryTimedSpritePresentation_Init
.extern func_02032228
.extern GraphicsSpriteState_SetAnimationIndex
.extern gHeapContext

.global func_ov095_0221c1d0
func_ov095_0221c1d0:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x18
    mov r4, r0
    add r1, r4, #0x100
    ldrh r1, [r1, #0xf0]
    mov r1, r1, lsl #0x11
    mov r1, r1, lsr #0x11
    cmp r1, #0x1
    bhs .L_0221c20c
    ldr r2, [r4, #0x54]
    mov r1, #0xa
    ldrh r0, [r2, #0x24]
    bic r0, r0, #0x2
    strh r0, [r2, #0x24]
    b .L_0221c264
.L_0221c20c:
    ldr r1, [r4, #0x3c]
    ldr r2, [r4, #0x40]
    mov r3, #0x800
    bl func_02032228
    ldrb r2, [r4, #0x200]
    mov r1, r0
    cmp r2, #0x0
    beq .L_0221c244
    mov r0, #0x0
    str r0, [r4, #0x3c]
    str r0, [r4, #0x40]
    ldrb r0, [r4, #0x200]
    sub r0, r0, #0x1
    strb r0, [r4, #0x200]
.L_0221c244:
    add r0, r4, #0x200
    ldrh r0, [r0, #0x2]
    ldr r2, [r4, #0x54]
    cmp r0, #0x0
    ldrh r0, [r2, #0x24]
    addne r1, r1, #0xb
    orr r0, r0, #0x2
    strh r0, [r2, #0x24]
.L_0221c264:
    ldr r0, [r4, #0x54]
    ldrb r2, [r0, #0x38]
    cmp r1, r2
    beq .L_0221c28c
    and r1, r1, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
.L_0221c28c:
    add r0, r4, #0x200
    ldrh r0, [r0, #0x2]
    cmp r0, #0x0
    beq .L_0221c324
    ldrb r0, [r4, #0x201]
    cmp r0, #0x0
    bne .L_0221c308
    ldr r1, .L_0221c32c
    ldr r3, .L_0221c330
    mov r0, #0x14
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0221c308
    ldr r3, .L_0221c334
    mov r1, #0xc
    str r3, [sp, #0x0]
    add r2, r3, #0x1
    str r2, [sp, #0x4]
    mov r2, #0x0
    str r2, [sp, #0x8]
    str r1, [sp, #0xc]
    sub r1, r1, #0xd
    str r1, [sp, #0x10]
    mov r1, #0x1
    str r1, [sp, #0x14]
    ldr r2, [r4, #0x54]
    add r1, r4, #0x18
    ldr r2, [r2, #0x0]
    sub r3, r3, #0x1
    bl AuxiliaryTimedSpritePresentation_Init
.L_0221c308:
    ldrb r0, [r4, #0x201]
    add r1, r0, #0x1
    and r0, r1, #0xff
    cmp r0, #0x1e
    strb r1, [r4, #0x201]
    movhi r0, #0x0
    strhib r0, [r4, #0x201]
.L_0221c324:
    add sp, sp, #0x18
    ldmia sp!, {r4, pc}
.L_0221c32c: .word data_ov095_0221d288
.L_0221c330: .word gHeapContext
.L_0221c334: .word 0x162c
.size func_ov095_0221c1d0, . - func_ov095_0221c1d0

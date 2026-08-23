.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.
.extern Heap_Alloc
.extern data_ov095_0221d3cc
.extern AuxiliaryTimedSpritePresentation_Init
.extern Actor_PlayHorizontalSpatialSound
.extern GraphicsSpriteState_SetAnimationIndex
.extern gHeapContext

.global func_ov095_0221c7d4
func_ov095_0221c7d4:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x18
    mov r4, r0
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldr r0, [r4, #0x54]
    ldrb r1, [r0, #0x38]
    cmp r1, #0x0
    beq .L_0221c818
    mov r1, #0x0
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
.L_0221c818:
    ldrb r0, [r4, #0x201]
    cmp r0, #0x0
    bne .L_0221c8a4
    ldr r1, .L_0221c8c8
    ldr r3, .L_0221c8cc
    mov r0, #0x14
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0221c890
    ldr r5, [r4, #0x1ec]
    mov r3, #0xc
    ldr r1, [r5, #0x8]
    mov ip, #0x1
    ldr r1, [r1, #0x10]
    sub r2, r3, #0xd
    str r1, [sp, #0x0]
    ldr lr, [r5, #0xc]
    add r1, r4, #0x18
    ldr lr, [lr, #0x10]
    str lr, [sp, #0x4]
    str ip, [sp, #0x8]
    str r3, [sp, #0xc]
    str r2, [sp, #0x10]
    str ip, [sp, #0x14]
    ldr r2, [r4, #0x54]
    ldr r3, [r5, #0x4]
    ldr r2, [r2, #0x0]
    ldr r3, [r3, #0x10]
    bl AuxiliaryTimedSpritePresentation_Init
.L_0221c890:
    mov r2, #0x200
    mov r0, r4
    rsb r2, r2, #0x0
    mov r1, #0xa
    bl Actor_PlayHorizontalSpatialSound
.L_0221c8a4:
    ldrb r0, [r4, #0x201]
    add r1, r0, #0x1
    and r0, r1, #0xff
    cmp r0, #0x14
    strb r1, [r4, #0x201]
    movhi r0, #0x0
    strhib r0, [r4, #0x201]
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, pc}
.L_0221c8c8: .word data_ov095_0221d3cc
.L_0221c8cc: .word gHeapContext
.size func_ov095_0221c7d4, . - func_ov095_0221c7d4

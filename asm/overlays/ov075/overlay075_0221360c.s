.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.
.extern Heap_Alloc
.extern data_ov075_02216cc8
.extern data_ov075_02217170
.extern AuxiliaryTimedSpritePresentation_Init
.extern Actor_SetPosition
.extern func_020593dc
.extern GraphicsSpriteState_SetAnimationIndex
.extern func_ov075_02212f10
.extern gHeapContext
.extern gSoundContext

.global func_ov075_0221360c
func_ov075_0221360c:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x18
    mov r4, r0
    bl Actor_SetPosition
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x38
    str r1, [r4, #0x264]
    bl func_ov075_02212f10
    mov r1, #0x0
    mov r2, r1
    mov r3, r1
    add r0, r4, #0x88
    bl func_ov075_02212f10
    mov r1, #0x0
    add r0, r4, #0x98
    mov r2, r1
    mov r3, r1
    bl func_ov075_02212f10
    ldr r0, [r4, #0xd0]
    orr r0, r0, #0x20000
    str r0, [r4, #0xd0]
    ldr r0, [r4, #0x1fc]
    cmp r0, #0x0
    bgt .L_022136b8
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x100]
    blx r1
    mov r3, #0x0
    add r0, r4, #0x200
    mov r2, r3
    b .L_022136a8
.L_02213694:
    ldr r1, [r4, #0x2a4]
    ldr r1, [r1, r3, lsl #0x2]
    add r3, r3, #0x1
    cmp r1, #0x0
    strne r2, [r1, #0x1fc]
.L_022136a8:
    ldrsh r1, [r0, #0xa8]
    cmp r3, r1
    blt .L_02213694
    b .L_02213784
.L_022136b8:
    ldr r0, .L_0221378c
    mov r1, #0x15
    ldr r2, [r0, #0x40]
    ldr r0, [r0, #0x44]
    str r2, [r4, #0x218]
    str r0, [r4, #0x21c]
    ldr r0, [r4, #0x54]
    bl GraphicsSpriteState_SetAnimationIndex
    ldr ip, [r4, #0x54]
    mov r1, #0x100
    ldrh r3, [ip, #0x24]
    mov r2, #0x3
    add r0, r4, #0x200
    bic r3, r3, #0x17
    strh r3, [ip, #0x24]
    str r2, [r4, #0x298]
    mov r2, #0x78
    strh r2, [r0, #0x6a]
    mov r0, #0x0
    str r0, [sp, #0x0]
    ldr r0, .L_02213790
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r3, r4
    add r1, r1, #0xe9
    mov r2, #0x1
    bl func_020593dc
    ldr r1, .L_02213794
    ldr r3, .L_02213798
    mov r0, #0x14
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02213784
    ldr r3, .L_0221379c
    mov r1, #0x0
    str r3, [sp, #0x0]
    add r2, r3, #0x1
    str r2, [sp, #0x4]
    str r1, [sp, #0x8]
    mov r1, #0x80
    str r1, [sp, #0xc]
    mov r1, #0x2
    str r1, [sp, #0x10]
    mov r1, #0x1
    str r1, [sp, #0x14]
    ldr r2, [r4, #0x54]
    add r1, r4, #0x18
    ldr r2, [r2, #0x0]
    sub r3, r3, #0x1
    bl AuxiliaryTimedSpritePresentation_Init
.L_02213784:
    add sp, sp, #0x18
    ldmia sp!, {r4, pc}
.L_0221378c: .word data_ov075_02216cc8
.L_02213790: .word gSoundContext
.L_02213794: .word data_ov075_02217170
.L_02213798: .word gHeapContext
.L_0221379c: .word 0x1632
.size func_ov075_0221360c, . - func_ov075_0221360c

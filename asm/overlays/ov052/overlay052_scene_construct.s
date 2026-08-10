.text
; Matching fallback for the portable implementation in src/overlays/ov052/overlay052_recovery.c.
.extern Heap_Alloc
.extern data_020f4dc8
.extern data_020f4e18
.extern data_021052fc
.extern data_ov052_0220e200
.extern data_ov052_0220e21c
.extern data_ov052_0220e224
.extern DisplayBrightness_StartTransition
.extern DisplayBrightnessPair_GetScreen
.extern AnimationResource_Init
.extern GraphicsSpriteState_Create
.extern GamePhaseRuntime_SetPlacementMode
.extern func_0201140c
.extern func_02071980
.extern func_020742cc
.extern func_020755bc
.extern func_02092cc0
.extern func_ov052_0220d600
.extern gDebugFont
.extern gHeapContext
.extern gLupyContext

.global func_ov052_0220d618
func_ov052_0220d618:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0xc
    ldr r3, .L_0220d858
    mov r4, r0
    mov ip, #0x0
    str r3, [r4, #0x0]
    strh ip, [r4, #0x4]
    ldr r3, [r4, #0x8]
    sub r0, ip, #0x10000
    and r0, r3, r0
    str r0, [r4, #0x8]
    str ip, [r4, #0xc]
    str ip, [r4, #0x10]
    str ip, [r4, #0x28]
    ldr r3, [r4, #0x2c]
    sub r0, ip, #0x10000
    mov r1, r1, lsl #0x10
    and r0, r3, r0
    orr r3, r0, r1, lsr #0x10
    mov r0, r3, lsl #0x10
    mov r1, r2, lsl #0x10
    orr r1, r1, r0, lsr #0x10
    str r3, [r4, #0x2c]
    str r1, [r4, #0x2c]
    ldr r0, .L_0220d85c
    ldr r1, .L_0220d860
    ldr r0, [r0, #0x0]
    bl func_02071980
    str r0, [r4, #0xc]
    ldr r1, .L_0220d864
    ldr r3, .L_0220d868
    mov r0, #0xec
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0220d6b8
    ldr r1, .L_0220d86c
    ldr r2, [r4, #0xc]
    ldr r1, [r1, #0x0]
    bl func_02092cc0
.L_0220d6b8:
    str r0, [r4, #0x10]
    mov r0, #0x50
    str r0, [sp, #0x0]
    ldr r0, [r4, #0x10]
    mov r1, #0x47
    mov r2, #0x2f
    mov r3, #0x86
    bl func_ov052_0220d600
    mov r0, #0x9
    ldr r1, [r4, #0x10]
    mov r3, #0x0
    str r3, [r1, #0xc0]
    ldr r1, [r4, #0x10]
    sub r2, r0, #0xb
    str r0, [r1, #0xd0]
    str r3, [r1, #0xd4]
    ldr r1, [r4, #0x10]
    ldr r0, .L_0220d86c
    str r2, [r1, #0xbc]
    ldr r0, [r0, #0x0]
    bl func_020742cc
    str r0, [r4, #0x1c]
    ldr r1, .L_0220d870
    ldr r3, .L_0220d868
    mov r0, #0x10
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0220d73c
    ldr r1, .L_0220d874
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl AnimationResource_Init
.L_0220d73c:
    mov r2, #0x0
    str r0, [r4, #0x20]
    str r2, [sp, #0x0]
    str r2, [sp, #0x4]
    mov r0, #0x2
    str r0, [sp, #0x8]
    ldr r0, [r4, #0x1c]
    ldr r1, [r4, #0x20]
    mov r3, r2
    bl GraphicsSpriteState_Create
    str r0, [r4, #0x18]
    mov r1, #0x26
    strh r1, [r0, #0x2c]
    mov r1, #0x5b
    strh r1, [r0, #0x2e]
    mov r3, #0x0
    str r3, [sp, #0x0]
    str r3, [sp, #0x4]
    mov r2, #0x2
    str r2, [sp, #0x8]
    ldr r0, [r4, #0x1c]
    ldr r1, [r4, #0x20]
    bl GraphicsSpriteState_Create
    mov r2, r0
    str r0, [r4, #0x14]
    mov r0, #0x26
    strh r0, [r2, #0x2c]
    mov r1, #0x6d
    strh r1, [r2, #0x2e]
    mov r2, #0x4
    ldr r0, .L_0220d878
    mov r1, #0x1
    str r2, [r4, #0x24]
    bl DisplayBrightnessPair_GetScreen
    mov r1, #0x0
    sub r2, r1, #0x10
    mov r3, r1
    bl DisplayBrightness_StartTransition
    ldr r0, .L_0220d87c
    ldr r2, [r4, #0x30]
    ldr r0, [r0, #0x0]
    ldrh r0, [r0, #0xb0]
    tst r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    mov r1, r0, lsl #0x10
    mov r0, #0x10000
    rsb r0, r0, #0x0
    mov r1, r1, asr #0x10
    and r2, r2, r0
    mov r0, r1, lsl #0x10
    orr r1, r2, r0, lsr #0x10
    mov r0, r1, lsl #0x10
    str r1, [r4, #0x30]
    movs r0, r0, asr #0x10
    beq .L_0220d82c
    ldr r0, .L_0220d87c
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    bl func_0201140c
.L_0220d82c:
    ldr r0, .L_0220d880
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x1
    bl GamePhaseRuntime_SetPlacementMode
    ldr r0, .L_0220d86c
    ldr r0, [r0, #0x0]
    bl func_020755bc
    mov r0, r4
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, pc}
.L_0220d858: .word data_ov052_0220e200
.L_0220d85c: .word data_020f4e18
.L_0220d860: .word 0x7007
.L_0220d864: .word data_ov052_0220e21c
.L_0220d868: .word gHeapContext
.L_0220d86c: .word gDebugFont
.L_0220d870: .word data_ov052_0220e224
.L_0220d874: .word 0x14ec
.L_0220d878: .word data_020f4dc8
.L_0220d87c: .word gLupyContext
.L_0220d880: .word data_021052fc
.size func_ov052_0220d618, . - func_ov052_0220d618

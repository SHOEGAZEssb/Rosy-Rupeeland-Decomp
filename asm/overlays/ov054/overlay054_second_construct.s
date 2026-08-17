.text
; Matching fallback for the portable implementation in src/overlays/ov054/overlay054_recovery.c.
.extern data_ov054_0220f108
.extern VecFx32Object_Init
.extern TimedSpritePresentation_InitBase
.extern AnimationResourceState_InitEmbedded
.extern gGameWork
.extern genrand_int32

.global func_ov054_0220ec6c
func_ov054_0220ec6c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    mov r5, r1
    bl TimedSpritePresentation_InitBase
    ldr r1, .L_0220ed04
    add r0, r4, #0x8
    str r1, [r4, #0x0]
    bl VecFx32Object_Init
    add r0, r4, #0x24
    str r5, [r4, #0x18]
    bl AnimationResourceState_InitEmbedded
    add r0, r4, #0x30
    bl VecFx32Object_Init
    add r0, r4, #0x40
    bl VecFx32Object_Init
    bl genrand_int32
    ldr r2, .L_0220ed08
    mov r3, #0xcd
    ldr r1, [r2, #0x0]
    mov r0, r4
    add r1, r1, #0x100
    ldrsh r1, [r1, #0xa0]
    mov r1, r1, lsl #0xc
    str r1, [r4, #0x34]
    ldr r1, [r2, #0x0]
    add r1, r1, #0x100
    ldrsh r1, [r1, #0xa2]
    mov r1, r1, lsl #0xc
    str r1, [r4, #0x38]
    ldr r1, [r2, #0x0]
    add r1, r1, #0x100
    ldrsh r1, [r1, #0xa4]
    mov r1, r1, lsl #0xc
    str r1, [r4, #0x3c]
    ldr r1, [r2, #0x0]
    add r1, r1, #0x100
    strh r3, [r1, #0x96]
    ldmia sp!, {r3, r4, r5, pc}
.L_0220ed04: .word data_ov054_0220f108
.L_0220ed08: .word gGameWork
.size func_ov054_0220ec6c, . - func_ov054_0220ec6c

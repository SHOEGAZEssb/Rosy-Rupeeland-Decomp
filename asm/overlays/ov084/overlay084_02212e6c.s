.text
; Matching fallback for the portable implementation in src/overlays/ov084/overlay084_recovery.c.
.extern Heap_Alloc
.extern Sound_Play
.extern data_020c9670
.extern data_021052fc
.extern data_ov084_02214108
.extern data_ov084_022143a4
.extern func_02005030
.extern func_02005058
.extern func_020050a4
.extern VecFx32Triple_Set
.extern VecFx32Bezier_Evaluate3D
.extern ActorMotionAreaFollower_GetPosition
.extern func_02010b64
.extern func_02010c00
.extern func_0201ded4
.extern func_02022cb0
.extern func_020befec
.extern func_ov084_02212cbc
.extern func_ov084_02212d28
.extern func_ov084_022131fc
.extern gHeapContext
.extern gLupyContext
.extern gSoundContext

.global func_ov084_02212e6c
func_ov084_02212e6c:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x88
    mov r7, r0
    mov r0, #0x6
    strh r0, [r7, #0xd6]
    ldr r1, [r7, #0x14]
    add r0, r7, #0x200
    orr r1, r1, #0x40
    str r1, [r7, #0x14]
    ldrsh r0, [r0, #0x9c]
    mov r1, #0x14
    mov r0, r0, lsl #0xc
    bl func_020befec
    add r1, r7, #0x200
    ldrsh r1, [r1, #0x9e]
    mov r4, r0
    cmp r1, #0x0
    bne .L_02212f28
    ldr r0, [r7, #0x2a4]
    ldr r1, [r7, #0x228]
    add r0, r0, #0x10
    add r1, r1, #0x18
    bl func_020050a4
    ldr r1, [r7, #0x2a4]
    add r0, sp, #0x38
    mov r2, #0x800
    bl func_ov084_02212cbc
    ldr r1, [r7, #0x228]
    add r0, sp, #0x28
    add r1, r1, #0x18
    mov r2, #0x800
    bl func_ov084_02212cbc
    add r0, sp, #0x78
    add r1, sp, #0x38
    add r2, sp, #0x28
    bl func_ov084_02212d28
    add r0, sp, #0x28
    bl func_02005058
    add r0, sp, #0x38
    bl func_02005058
    ldr r0, [r7, #0x2a4]
    ldr r1, [r7, #0x228]
    add r0, r0, #0x20
    add r1, r1, #0x18
    bl func_020050a4
    add r0, sp, #0x78
    bl func_02005058
.L_02212f28:
    ldr r1, [r7, #0x2a4]
    add r0, sp, #0x68
    mov r2, r4
    bl VecFx32Bezier_Evaluate3D
    add r0, r7, #0x200
    ldrsh r0, [r0, #0x9c]
    mov r1, #0x14
    mov r0, r0, lsl #0xf
    bl func_020befec
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r0, asr #0x4
    ldr r0, .L_022131dc
    mov r1, r1, lsl #0x2
    ldrsh r1, [r0, r1]
    ldr r2, [sp, #0x74]
    mov r0, #0x28
    smlabb r2, r1, r0, r2
    add r1, sp, #0x68
    add r0, r7, #0x18
    str r2, [sp, #0x74]
    bl func_020050a4
    mov r1, #0x0
    add r0, r7, #0x38
    mov r2, r1
    mov r3, r1
    bl func_ov084_022131fc
    mov r1, #0x0
    add r0, r7, #0x88
    mov r2, r1
    mov r3, r1
    bl func_ov084_022131fc
    mov r1, #0x0
    add r0, r7, #0x98
    mov r2, r1
    mov r3, r1
    bl func_ov084_022131fc
    add r2, r7, #0x200
    ldrsh r0, [r2, #0x9e]
    cmp r0, #0x0
    ldrsh r0, [r2, #0x9c]
    add r0, r0, #0x1
    bne .L_02213154
    strh r0, [r2, #0x9c]
    ldrsh r0, [r2, #0x9c]
    cmp r0, #0x14
    ble .L_022131c8
    mov r0, #0x1
    strh r0, [r2, #0x9e]
    mov r0, #0x0
    strh r0, [r2, #0x9c]
    ldr r0, .L_022131e0
    ldr r6, [r7, #0x114]
    ldr r0, [r0, #0x0]
    bl func_02010b64
    cmp r0, r6
    bgt .L_0221301c
    ldr r0, .L_022131e0
    ldr r0, [r0, #0x0]
    bl func_02010b64
    sub r6, r0, #0x1
.L_0221301c:
    ldr r0, .L_022131e0
    rsb r5, r6, #0x0
    ldr r0, [r0, #0x0]
    mov r1, r5
    mov r2, #0x0
    bl func_02010c00
    ldr r1, [r7, #0x14]
    ldr r0, .L_022131e4
    bic r1, r1, #0x30000
    str r1, [r7, #0x14]
    ldr r0, [r0, #0x0]
    mov r1, #0x0
    mov r2, #0x20
    bl Sound_Play
    ldr r1, .L_022131e8
    ldr r3, .L_022131ec
    mov r0, #0x44
    mov r2, #0x4
    bl Heap_Alloc
    movs r4, r0
    beq .L_022130ac
    ldr r0, .L_022131f0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl ActorMotionAreaFollower_GetPosition
    mov ip, #0x2000
    mov r1, r0
    mov r0, r4
    mov r2, r7
    mov r3, r5
    str ip, [sp, #0x0]
    sub r4, ip, #0x20c0
    str r4, [sp, #0x4]
    bl func_02022cb0
    mov r4, r0
.L_022130ac:
    ldr r0, .L_022131f0
    mov r1, r4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201ded4
    ldr r1, [r7, #0x298]
    ldr r0, .L_022131f4
    add r1, r1, r6
    cmp r1, r0
    strlt r1, [r7, #0x298]
    ldr r1, [r7, #0x2a4]
    add r0, sp, #0x58
    bl func_02005030
    ldr r1, [r7, #0x228]
    add r0, sp, #0x18
    add r1, r1, #0x18
    mov r2, #0x800
    bl func_ov084_02212cbc
    add r0, sp, #0x8
    add r1, sp, #0x58
    mov r2, #0x800
    bl func_ov084_02212cbc
    add r0, sp, #0x48
    add r1, sp, #0x18
    add r2, sp, #0x8
    bl func_ov084_02212d28
    add r0, sp, #0x8
    bl func_02005058
    add r0, sp, #0x18
    bl func_02005058
    ldr r1, [r7, #0x228]
    ldr r0, [r7, #0x2a4]
    add r2, sp, #0x58
    add r1, r1, #0x18
    add r3, sp, #0x48
    bl VecFx32Triple_Set
    add r0, sp, #0x48
    bl func_02005058
    add r0, sp, #0x58
    bl func_02005058
    b .L_022131c8
.L_02213154:
    strh r0, [r2, #0x9c]
    ldrsh r0, [r2, #0x9c]
    cmp r0, #0x14
    ble .L_022131c8
    mov r0, #0x0
    strh r0, [r2, #0x9e]
    ldrh r4, [r2, #0xa0]
    ldr r1, .L_022131f0
    ldr r3, .L_022131f8
    orr r4, r4, #0x1
    strh r4, [r2, #0xa0]
    ldr r1, [r1, #0x0]
    add r1, r1, #0x2000
    ldr r1, [r1, #0xea4]
    str r1, [r7, #0x228]
    ldr r4, [r3, #0x20]
    ldr r1, [r3, #0x24]
    str r4, [r7, #0x218]
    str r1, [r7, #0x21c]
    ldr r4, [r3, #0x8]
    ldr r1, [r3, #0xc]
    str r4, [r7, #0x220]
    str r1, [r7, #0x224]
    strh r0, [r2, #0xa2]
    strh r0, [r2, #0x9c]
    ldr r0, [r7, #0x14]
    bic r0, r0, #0x2
    bic r0, r0, #0x4
    str r0, [r7, #0x14]
.L_022131c8:
    add r0, sp, #0x68
    bl func_02005058
    mov r0, #0x0
    add sp, sp, #0x88
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_022131dc: .word data_020c9670
.L_022131e0: .word gLupyContext
.L_022131e4: .word gSoundContext
.L_022131e8: .word data_ov084_022143a4
.L_022131ec: .word gHeapContext
.L_022131f0: .word data_021052fc
.L_022131f4: .word 0x7fff
.L_022131f8: .word data_ov084_02214108
.size func_ov084_02212e6c, . - func_ov084_02212e6c

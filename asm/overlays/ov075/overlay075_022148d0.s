.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.
.extern Heap_Alloc
.extern SceneManager_GetCurrent
.extern data_021052fc
.extern data_02105310
.extern data_ov075_02217280
.extern data_ov075_02217288
.extern func_0200222c
.extern func_020022dc
.extern func_02005030
.extern func_02005058
.extern func_0200b04c
.extern func_0201f864
.extern func_02031748
.extern Actor_UpdateAnimationState
.extern func_02034464
.extern func_0203b798
.extern func_020593dc
.extern func_0205940c
.extern func_020594a4
.extern func_020befec
.extern func_ov059_0220fd20
.extern func_ov075_02214770
.extern func_ov075_02214d88
.extern func_ov075_02214f18
.extern gHeapContext
.extern gSceneManager
.extern gSoundContext

.global func_ov075_022148d0
func_ov075_022148d0:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x38
    mov r5, r0
    ldr r1, [r5, #0x10]
    tst r1, #0x1000000
    beq .L_022148f0
    bl func_0203b798
    b .L_02214d58
.L_022148f0:
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x18]
    blx r1
    mov r0, r5
    bl func_02031748
    ldr r0, .L_02214d60
    bl func_0200b04c
    cmp r0, #0x0
    beq .L_02214928
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x20]
    blx r1
    b .L_02214d58
.L_02214928:
    mov r1, #0x0
    str r1, [r5, #0x40]
    str r1, [r5, #0x3c]
    ldrsh r0, [r5, #0xd6]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_02214d30
.L_02214944:
    b .L_02214954
    b .L_02214a30
    b .L_02214a64
    b .L_02214d04
.L_02214954:
    ldr r0, .L_02214d64
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r4, [r0, #0xea4]
    mov r0, r4
    bl func_ov075_02214d88
    cmp r0, #0x0
    beq .L_02214d30
    ldr r0, [r4, #0x230]
    tst r0, #0x20000
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    bne .L_02214d30
    ldr r1, [r4, #0x1c]
    ldr r2, [r4, #0x20]
    mov r0, r4
    mov r1, r1, asr #0x10
    mov r2, r2, asr #0x10
    bl func_02034464
    mov r1, r0, lsl #0x12
    mov r1, r1, lsr #0x1c
    str r0, [sp, #0x1c]
    str r0, [sp, #0x24]
    cmp r1, #0x8
    add r0, r5, #0x200
    bne .L_02214a24
    ldrsh r1, [r0, #0x22]
    add r1, r1, #0x1
    strh r1, [r0, #0x22]
    ldrsh r0, [r0, #0x22]
    cmp r0, #0xf0
    ble .L_02214d30
    mov r0, r5
    mov r1, r4
    bl func_ov075_02214f18
    cmp r0, #0x0
    beq .L_02214d30
    mov r0, #0x1
    strh r0, [r5, #0xd6]
    add r0, r5, #0x200
    mov r1, #0x0
    strh r1, [r0, #0x22]
    str r1, [sp, #0x0]
    mov r2, #0x100
    ldr r0, .L_02214d68
    str r2, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r3, r5
    mov r2, #0x78
    bl func_020593dc
    b .L_02214d30
.L_02214a24:
    mov r1, #0x0
    strh r1, [r0, #0x22]
    b .L_02214d30
.L_02214a30:
    ldr r0, [r5, #0x54]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq .L_02214d30
    mov r0, #0x2
    strh r0, [r5, #0xd6]
    add r0, r5, #0x200
    ldr r2, .L_02214d6c
    strh r1, [r0, #0x20]
    str r2, [r5, #0x224]
    b .L_02214d30
.L_02214a64:
    add r0, r5, #0x200
    ldrsh r1, [r0, #0x20]
    add r1, r1, #0x1
    strh r1, [r0, #0x20]
    ldrsh r0, [r0, #0x20]
    cmp r0, #0x1e0
    movgt r0, #0x3
    strgth r0, [r5, #0xd6]
    bgt .L_02214d30
    ldr r1, [r5, #0x208]
    add r0, sp, #0x28
    add r1, r1, #0x18
    bl func_02005030
    add r1, sp, #0x28
    mov r0, r5
    bl func_ov075_02214770
    cmp r0, #0x0
    mov r2, #0x78
    bne .L_02214acc
    mov r1, #0x3
    strh r1, [r5, #0xd6]
    ldr r0, .L_02214d68
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    bl func_0205940c
    b .L_02214cf8
.L_02214acc:
    ldr r0, .L_02214d68
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    bl func_020594a4
    cmp r0, #0x0
    bne .L_02214b08
    mov r1, #0x0
    str r1, [sp, #0x0]
    mov r2, #0x100
    ldr r0, .L_02214d68
    str r2, [sp, #0x4]
    ldr r0, [r0, #0x0]
    mov r3, r5
    mov r2, #0x78
    bl func_020593dc
.L_02214b08:
    ldr r1, [r5, #0x224]
    ldr r0, .L_02214d70
    add r1, r1, #0x29
    str r1, [r5, #0x224]
    cmp r1, r0
    strgt r0, [r5, #0x224]
    ldr r0, .L_02214d64
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r4, [r0, #0xea4]
    ldr r1, [r4, #0x1c]
    ldr r2, [r4, #0x20]
    mov r0, r4
    mov r1, r1, asr #0x10
    mov r2, r2, asr #0x10
    bl func_02034464
    ldr r1, .L_02214d74
    str r0, [sp, #0x18]
    str r0, [sp, #0x20]
    ldr r0, [r1, #0x0]
    bl SceneManager_GetCurrent
    ldr r0, [r0, #0x4]
    cmp r0, #0x1
    ldreq r0, [sp, #0x20]
    moveq r0, r0, lsl #0x12
    moveq r0, r0, lsr #0x1c
    cmpeq r0, #0x8
    bne .L_02214c38
    mov r0, r4
    bl func_ov075_02214d88
    cmp r0, #0x0
    beq .L_02214c38
    ldr r0, [r4, #0x230]
    tst r0, #0x20000
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    bne .L_02214c38
    ldr r1, [sp, #0x30]
    ldr r0, [r5, #0x20]
    ldr r2, [sp, #0x2c]
    sub r0, r1, r0
    mov r1, r0, asr #0xc
    mul r0, r1, r1
    ldr r1, [r5, #0x1c]
    sub r1, r2, r1
    mov r1, r1, asr #0xc
    mla r0, r1, r1, r0
    cmp r0, #0x100
    bge .L_02214c58
    ldr r4, [r5, #0x54]
    ldr r0, .L_02214d68
    ldrh r3, [r4, #0x24]
    mov r1, #0x0
    mov r2, #0x78
    orr r3, r3, #0x10
    strh r3, [r4, #0x24]
    ldr r0, [r0, #0x0]
    bl func_0205940c
    bl func_020022dc
    ldr r2, .L_02214d78
    mov r1, #0x2
    bl func_0200222c
    ldr r1, .L_02214d7c
    ldr r3, .L_02214d80
    mov r0, #0x88
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02214c2c
    mov r1, #0x1
    mov r2, #0x7d0
    bl func_ov059_0220fd20
.L_02214c2c:
    add r0, sp, #0x28
    bl func_02005058
    b .L_02214d58
.L_02214c38:
    ldr r0, [r5, #0x3c]
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    str r0, [r5, #0x3c]
    ldr r0, [r5, #0x40]
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    str r0, [r5, #0x40]
.L_02214c58:
    add r0, r5, #0x200
    ldrsh r1, [r0, #0x28]
    cmp r1, #0x0
    bgt .L_02214cf0
    ldr r1, .L_02214d84
    ldr r3, .L_02214d80
    mov r0, #0x14
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02214cd4
    mov r3, #0x1200
    str r3, [sp, #0x0]
    add r2, r3, #0x3
    mov r1, #0x0
    str r2, [sp, #0x4]
    str r1, [sp, #0x8]
    ldr r2, [r5, #0x5c]
    sub r1, r1, #0x1
    mov r2, r2, lsl #0x10
    mov r2, r2, asr #0x10
    sub r2, r2, #0x8
    str r2, [sp, #0xc]
    str r1, [sp, #0x10]
    mov r1, #0x1
    str r1, [sp, #0x14]
    ldr r2, [r5, #0x54]
    add r1, r5, #0x18
    ldr r2, [r2, #0x0]
    add r3, r3, #0x2
    bl func_0201f864
.L_02214cd4:
    ldr r1, [r5, #0x224]
    mov r0, #0xa000
    add r1, r1, #0x100
    bl func_020befec
    add r1, r5, #0x200
    strh r0, [r1, #0x28]
    b .L_02214cf8
.L_02214cf0:
    sub r1, r1, #0x1
    strh r1, [r0, #0x28]
.L_02214cf8:
    add r0, sp, #0x28
    bl func_02005058
    b .L_02214d30
.L_02214d04:
    ldr r0, [r5, #0x54]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq .L_02214d30
    ldr r0, .L_02214d68
    strh r1, [r5, #0xd6]
    ldr r0, [r0, #0x0]
    mov r2, #0x78
    bl func_0205940c
.L_02214d30:
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xa4]
    blx r1
    mov r0, r5
    bl Actor_UpdateAnimationState
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x20]
    blx r1
.L_02214d58:
    add sp, sp, #0x38
    ldmia sp!, {r3, r4, r5, pc}
.L_02214d60: .word data_02105310
.L_02214d64: .word data_021052fc
.L_02214d68: .word gSoundContext
.L_02214d6c: .word 0x4cd
.L_02214d70: .word 0x1333
.L_02214d74: .word gSceneManager
.L_02214d78: .word 0x40
.L_02214d7c: .word data_ov075_02217280
.L_02214d80: .word gHeapContext
.L_02214d84: .word data_ov075_02217288
.size func_ov075_022148d0, . - func_ov075_022148d0

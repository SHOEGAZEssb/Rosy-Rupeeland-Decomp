; Matching retail form; see src/game/game_phase_effect_scene.c for the
; documented portable implementation and recovered behavior.
.text
.extern Heap_Alloc
.extern Heap_Free
.extern Scene_Destroy
.extern Scene_Init
.extern Sound_Play
.extern data_020d53b8
.extern data_020d5400
.extern data_020d542c
.extern data_020cdc1c
.extern data_021052fc
.extern AnimationResource_Init
.extern func_02005c3c
.extern func_02007f0c
.extern ActorCollection_GetSpriteOwner
.extern func_02072b68
.extern func_02074038
.extern func_020740a4
.extern gHeapContext
.extern gSoundContext
    .global func_0200c9fc
func_0200c9fc: ; 0x0200c9fc
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0xc
    mov r6, r0
    mov r5, r1
    bl Scene_Init
    ldr r0, L_0200cc20
    mov r1, #0x0
    str r0, [r6, #0x0]
    ldr r0, L_0200cc24
    str r1, [r6, #0x34]
    ldr r0, [r0, #0x0]
    cmp r5, #0x4
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    ldr r4, [r0, #0x54]
    addls pc, pc, r5, lsl #0x2
    b L_0200cc00
L_0200ca40: ; jump table
    b L_0200cbec ; case 0
    b L_0200ca54 ; case 1
    b L_0200cadc ; case 2
    b L_0200cbec ; case 3
    b L_0200cb64 ; case 4
L_0200ca54:
    ldr r1, L_0200cc28
    ldr r3, L_0200cc2c
    mov r0, #0x10
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_0200ca80
    ldr r1, L_0200cc30
    sub r2, r1, #0xa
    add r3, r1, #0x1
    bl AnimationResource_Init
L_0200ca80:
    ldr r1, L_0200cc24
    str r0, [r6, #0x24]
    ldr r0, [r1, #0x0]
    mov r1, #0x1
    bl func_02007f0c
    bl ActorCollection_GetSpriteOwner
    ldrh r3, [r4, #0x28]
    mov r2, #0x4
    mov r1, #0x2
    str r3, [sp, #0x0]
    str r2, [sp, #0x4]
    str r1, [sp, #0x8]
    ldrb r3, [r4, #0x3a]
    ldr r1, [r6, #0x24]
    mov r2, #0x24
    bl func_02005c3c
    ldr r1, L_0200cc34
    str r0, [r6, #0x28]
    ldr r2, [r1, #0x0]
    ldr r0, [r1, #0x4]
    str r2, [r6, #0x2c]
    str r0, [r6, #0x30]
    b L_0200cc00
L_0200cadc:
    ldr r1, L_0200cc28
    ldr r3, L_0200cc2c
    mov r0, #0x10
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_0200cb08
    ldr r1, L_0200cc38
    sub r2, r1, #0x1a
    add r3, r1, #0x1
    bl AnimationResource_Init
L_0200cb08:
    ldr r1, L_0200cc24
    str r0, [r6, #0x24]
    ldr r0, [r1, #0x0]
    mov r1, #0x1
    bl func_02007f0c
    bl ActorCollection_GetSpriteOwner
    ldrh r3, [r4, #0x28]
    mov r2, #0x4
    mov r1, #0x2
    str r3, [sp, #0x0]
    str r2, [sp, #0x4]
    str r1, [sp, #0x8]
    ldrb r3, [r4, #0x3a]
    ldr r1, [r6, #0x24]
    mov r2, #0x35
    bl func_02005c3c
    ldr r1, L_0200cc34
    str r0, [r6, #0x28]
    ldr r2, [r1, #0x8]
    ldr r0, [r1, #0xc]
    str r2, [r6, #0x2c]
    str r0, [r6, #0x30]
    b L_0200cc00
L_0200cb64:
    ldr r1, L_0200cc28
    ldr r3, L_0200cc2c
    mov r0, #0x10
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_0200cb90
    ldr r1, L_0200cc3c
    sub r2, r1, #0x2
    add r3, r1, #0x1
    bl AnimationResource_Init
L_0200cb90:
    ldr r1, L_0200cc24
    str r0, [r6, #0x24]
    ldr r0, [r1, #0x0]
    mov r1, #0x1
    bl func_02007f0c
    bl ActorCollection_GetSpriteOwner
    ldrh r3, [r4, #0x28]
    mov r2, #0x4
    mov r1, #0x2
    str r3, [sp, #0x0]
    str r2, [sp, #0x4]
    str r1, [sp, #0x8]
    ldrb r3, [r4, #0x3a]
    ldr r1, [r6, #0x24]
    mov r2, #0x16
    bl func_02005c3c
    ldr r1, L_0200cc34
    str r0, [r6, #0x28]
    ldr r2, [r1, #0x18]
    ldr r0, [r1, #0x1c]
    str r2, [r6, #0x2c]
    str r0, [r6, #0x30]
    b L_0200cc00
L_0200cbec:
    ldr r0, L_0200cc40
    ldr r1, [r0, #0x0]
    ldr r0, [r0, #0x4]
    str r1, [r6, #0x2c]
    str r0, [r6, #0x30]
L_0200cc00:
    ldrsh r3, [r4, #0x2e]
    ldrsh r1, [r4, #0x2c]
    ldr r2, [r6, #0x28]
    mov r0, r6
    strh r1, [r2, #0x2c]
    strh r3, [r2, #0x2e]
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, pc}
L_0200cc20: .word data_020d5400
L_0200cc24: .word data_021052fc
L_0200cc28: .word data_020d542c
L_0200cc2c: .word gHeapContext
L_0200cc30: .word 0x100b
L_0200cc34: .word data_020d53b8
L_0200cc38: .word 0x101b
L_0200cc3c: .word 0x1003
L_0200cc40: .word data_020cdc1c
    .size func_0200c9fc, . - func_0200c9fc

    .global func_0200cc44
func_0200cc44: ; 0x0200cc44
    stmdb sp!, {r4, lr}
    ldr r1, L_0200cc88
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r1, [r4, #0x28]
    ldr r0, [r1, #0x0]
    bl func_02074038
    ldr r0, [r4, #0x24]
    cmp r0, #0x0
    beq L_0200cc78
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_0200cc78:
    mov r0, r4
    bl Scene_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
L_0200cc88: .word data_020d5400
    .size func_0200cc44, . - func_0200cc44

    .global func_0200cc8c
func_0200cc8c: ; 0x0200cc8c
    stmdb sp!, {r4, lr}
    ldr r1, L_0200ccd8
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r1, [r4, #0x28]
    ldr r0, [r1, #0x0]
    bl func_02074038
    ldr r0, [r4, #0x24]
    cmp r0, #0x0
    beq L_0200ccc0
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_0200ccc0:
    mov r0, r4
    bl Scene_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
L_0200ccd8: .word data_020d5400
    .size func_0200cc8c, . - func_0200cc8c

    .global func_0200ccdc
func_0200ccdc: ; 0x0200ccdc
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [r4, #0x30]
    tst r0, #0x1
    add r0, r4, r0, asr #0x1
    ldrne r2, [r0, #0x0]
    ldrne r1, [r4, #0x2c]
    ldrne r1, [r2, r1]
    ldreq r1, [r4, #0x2c]
    blx r1
    ldr r1, [r4, #0x28]
    mov r5, r0
    ldr r0, [r1, #0x0]
    bl func_020740a4
    ldr r1, L_0200cd50
    ldr r0, L_0200cd54
    cmp r5, #0x0
    str r1, [r0, #0x0]
    beq L_0200cd48
    cmp r4, #0x0
    beq L_0200cd40
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_0200cd40:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
L_0200cd48:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
L_0200cd50: .word 0xc0310010
L_0200cd54: .word 0x4000064
    .size func_0200ccdc, . - func_0200ccdc

    .global func_0200cd58
func_0200cd58: ; 0x0200cd58
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq L_0200cd78
    cmp r0, #0x1
    beq L_0200cdc4
    b L_0200cde0
L_0200cd78:
    add r1, r0, #0x1
    ldr r0, L_0200cde8
    str r1, [r4, #0x8]
    ldr r0, [r0, #0x0]
    ldr r3, L_0200cdec
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    mov r1, #0x0
    ldr ip, [r0, #0x54]
    mov r2, #0x2d
    ldrh r0, [ip, #0x24]
    orr r0, r0, #0x4
    strh r0, [ip, #0x24]
    ldr ip, [r4, #0x28]
    ldrh r0, [ip, #0x24]
    bic r0, r0, #0x4
    strh r0, [ip, #0x24]
    ldr r0, [r3, #0x0]
    bl Sound_Play
L_0200cdc4:
    ldr r0, [r4, #0x28]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    movne r0, #0x1
    ldmneia sp!, {r4, pc}
L_0200cde0:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_0200cde8: .word data_021052fc
L_0200cdec: .word gSoundContext
    .size func_0200cd58, . - func_0200cd58

    .global func_0200cdf0
func_0200cdf0: ; 0x0200cdf0
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq L_0200ce18
    cmp r0, #0x1
    beq L_0200ce64
    cmp r0, #0x2
    beq L_0200ceb0
    b L_0200cef0
L_0200ce18:
    add r1, r0, #0x1
    ldr r0, L_0200cef8
    str r1, [r4, #0x8]
    ldr r0, [r0, #0x0]
    ldr r3, L_0200cefc
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    mov r1, #0x0
    ldr ip, [r0, #0x54]
    mov r2, #0x2d
    ldrh r0, [ip, #0x24]
    orr r0, r0, #0x4
    strh r0, [ip, #0x24]
    ldr ip, [r4, #0x28]
    ldrh r0, [ip, #0x24]
    bic r0, r0, #0x4
    strh r0, [ip, #0x24]
    ldr r0, [r3, #0x0]
    bl Sound_Play
L_0200ce64:
    ldr r0, [r4, #0x28]
    ldrh r1, [r0, #0x24]
    and r1, r1, #0x1
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    beq L_0200cef0
    mov r1, #0x17
    bl func_02072b68
    ldr r1, [r4, #0x28]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x1
    strh r0, [r1, #0x24]
    ldr r1, [r4, #0x28]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x2
    strh r0, [r1, #0x24]
    ldr r0, [r4, #0x8]
    add r0, r0, #0x1
    str r0, [r4, #0x8]
L_0200ceb0:
    ldr r0, [r4, #0x34]
    add r1, r0, #0x1
    cmp r1, #0x5a
    str r1, [r4, #0x34]
    movgt r0, #0x1
    ldmgtia sp!, {r4, pc}
    ldr r0, L_0200cef8
    add r1, r1, r1, lsr #0x1f
    ldr r0, [r0, #0x0]
    ldr r2, [r4, #0x28]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    ldr r0, [r0, #0x54]
    ldrsh r0, [r0, #0x2e]
    sub r0, r0, r1, asr #0x1
    strh r0, [r2, #0x2e]
L_0200cef0:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_0200cef8: .word data_021052fc
L_0200cefc: .word gSoundContext
    .size func_0200cdf0, . - func_0200cdf0

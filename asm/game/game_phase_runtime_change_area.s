; Matching retail form; see src/game/game_phase_runtime_change_area.c for
; the documented portable implementation and recovered behavior.
.text
.extern data_02105310
.extern func_02004fe0
.extern func_02005030
.extern func_02005058
.extern func_020050a4
.extern func_020050c8
.extern GamePhaseRuntime_GetActorCollection
.extern GamePhaseRuntime_CreateSecondaryActorSubsystem
.extern func_02008b6c
.extern func_02008bb8
.extern func_020091d8
.extern func_02009d78
.extern func_0200ae8c
.extern func_0200e714
.extern func_0201140c
.extern func_020122a0
.extern func_02012528
.extern func_02020060
.extern func_02026174
.extern func_02028388
.extern ActorCollection_DispatchEventToActors
.extern func_020be8c0
.extern func_020beae4
.extern func_020beb18
.extern func_020beb6c
.extern func_ov056_0220f054
.extern gLupyContext

    .global GamePhaseRuntime_ChangeToNeighborArea
.type GamePhaseRuntime_ChangeToNeighborArea, @function
GamePhaseRuntime_ChangeToNeighborArea:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x2c
    mov r7, r0
    add r0, r7, #0x3000
    ldr r2, [r0, #0xbc]
    mov r6, r1
    add r0, r2, r6, lsl #0x1
    ldrsh r5, [r0, #0x14]
    mvn r0, #0x0
    ldrsb r4, [r2, #0x4c]
    cmp r5, r0
    moveq r0, #0x0
    beq L_02007ef8
    mov r0, r5
    bl func_02028388
    add r1, r7, #0x3000
    str r0, [r1, #0xbc]
    add r0, sp, #0x1c
    bl func_02004fe0
    cmp r6, #0x0
    bne L_02007bb8
    add r0, r7, #0x2000
    ldr r0, [r0, #0xed4]
    ldr r0, [r0, #0x20]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0xc
    cmp r0, #0x0
    mov r0, r0, lsl #0xc
    ble L_02007ba0
    bl func_020beb18
    mov r1, r0
    mov r0, #0x3f000000
    bl func_020be8c0
    b L_02007bac
L_02007ba0:
    bl func_020beb18
    mov r1, #0x3f000000
    bl func_020beb6c
L_02007bac:
    bl func_020beae4
    str r0, [sp, #0x20]
    b L_02007cb8
L_02007bb8:
    cmp r6, #0x1
    bne L_02007c10
    add r0, r7, #0x2000
    ldr r0, [r0, #0xed4]
    ldr r0, [r0, #0x20]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0xc
    rsb r0, r0, #0x0
    cmp r0, #0x0
    mov r0, r0, lsl #0xc
    ble L_02007bf8
    bl func_020beb18
    mov r1, r0
    mov r0, #0x3f000000
    bl func_020be8c0
    b L_02007c04
L_02007bf8:
    bl func_020beb18
    mov r1, #0x3f000000
    bl func_020beb6c
L_02007c04:
    bl func_020beae4
    str r0, [sp, #0x20]
    b L_02007cb8
L_02007c10:
    cmp r6, #0x2
    bne L_02007c64
    add r0, r7, #0x2000
    ldr r0, [r0, #0xed4]
    ldr r0, [r0, #0x20]
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x4
    cmp r0, #0x0
    mov r0, r0, lsl #0xc
    ble L_02007c4c
    bl func_020beb18
    mov r1, r0
    mov r0, #0x3f000000
    bl func_020be8c0
    b L_02007c58
L_02007c4c:
    bl func_020beb18
    mov r1, #0x3f000000
    bl func_020beb6c
L_02007c58:
    bl func_020beae4
    str r0, [sp, #0x24]
    b L_02007cb8
L_02007c64:
    cmp r6, #0x3
    bne L_02007cb8
    add r0, r7, #0x2000
    ldr r0, [r0, #0xed4]
    ldr r0, [r0, #0x20]
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x4
    rsb r0, r0, #0x0
    cmp r0, #0x0
    mov r0, r0, lsl #0xc
    ble L_02007ca4
    bl func_020beb18
    mov r1, r0
    mov r0, #0x3f000000
    bl func_020be8c0
    b L_02007cb0
L_02007ca4:
    bl func_020beb18
    mov r1, #0x3f000000
    bl func_020beb6c
L_02007cb0:
    bl func_020beae4
    str r0, [sp, #0x24]
L_02007cb8:
    add r0, r7, #0x3bc
    add r0, r0, #0x2c00
    bl func_02009d78
    mov r1, r0
    add r0, sp, #0xc
    bl func_02005030
    add r0, sp, #0xc
    add r1, sp, #0x1c
    bl func_020050c8
    add r0, r7, #0x3bc
    add r1, sp, #0xc
    add r0, r0, #0x2c00
    bl func_020091d8
    add r0, r7, #0x2000
    ldr r0, [r0, #0xea8]
    cmp r0, #0x0
    beq L_02007d24
    ldr r1, [r0, #0x268]
    tst r1, #0x10
    movne r2, #0x1
    moveq r2, #0x0
    cmp r2, #0x0
    beq L_02007d24
    tst r1, #0x20
    addeq r1, r5, #0x1
    addeq r0, r0, #0x200
    streqh r1, [r0, #0x7e]
L_02007d24:
    ldr r0, L_02007f00
    bl func_0200ae8c
    add r0, r7, #0x3000
    ldr r1, [r0, #0xbc]
    mov r0, r7
    mov r2, #0x1
    bl GamePhaseRuntime_CreateSecondaryActorSubsystem
    add r0, r7, #0x3000
    ldr r1, [r0, #0xb8]
    add r2, sp, #0xc
    orr r1, r1, #0x30
    str r1, [r0, #0xb8]
    ldr r1, [r0, #0xbc]
    add r0, r7, #0x24
    bl func_0200e714
    add r1, sp, #0xc
    add r0, r7, #0x28
    bl ActorCollection_DispatchEventToActors
    add r0, r7, #0x3000
    ldr r5, [r0, #0xbc]
    ldrsh r0, [r5, #0x12]
    cmp r0, #0x0
    blt L_02007d94
    add r0, r7, #0x3bc
    add r0, r0, #0x2c00
    bl func_02009d78
    mov r1, r5
    bl func_02020060
L_02007d94:
    ldr r0, L_02007f04
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl func_0201140c
    ldr r0, L_02007f04
    mov r1, #0xfa
    ldr r2, [r0, #0x0]
    mov r0, #0x1e
    strh r1, [r2, #0xbc]
    strh r0, [r2, #0xbe]
    add r0, r7, #0x3000
    ldr r1, [r0, #0xbc]
    ldrsb r0, [r1, #0x4c]
    cmp r4, r0
    beq L_02007ddc
    mov r0, r7
    mov r2, #0x1
    bl func_02008bb8
L_02007ddc:
    add r1, r7, #0x3000
    ldr r0, [r1, #0xbc]
    ldr r0, [r0, #0x40]
    mov r0, r0, lsl #0xc
    mov r0, r0, lsr #0x1e
    cmp r0, #0x1
    add r0, r7, #0x2000
    ldr r0, [r0, #0xfb8]
    bne L_02007e0c
    ldr r1, [r1, #0xec]
    bl func_02012528
    b L_02007e14
L_02007e0c:
    mov r1, #0x0
    bl func_020122a0
L_02007e14:
    add r0, r7, #0x3000
    ldr r1, [r0, #0xec]
    cmp r1, #0x0
    beq L_02007e44
    ldr r2, [r0, #0xbc]
    add r0, sp, #0x0
    mov r1, r7
    bl func_02008b6c
    add r0, r7, #0x3000
    ldr r0, [r0, #0xec]
    add r1, sp, #0x0
    bl func_ov056_0220f054
L_02007e44:
    add r1, r7, #0x3000
    ldr r0, [r1, #0xe8]
    ldr r1, [r1, #0xbc]
    bl func_02026174
    add r0, r7, #0x2000
    ldr r3, [r0, #0xea4]
    add r2, r7, #0x3000
    mov r0, r7
    mov r1, #0x1
    str r3, [r2, #0xf0]
    bl GamePhaseRuntime_GetActorCollection
    add r1, r7, #0x2000
    ldr r1, [r1, #0xfb8]
    add r0, r0, #0x2000
    add r1, r1, #0x2000
    ldr r2, [r1, #0xebc]
    ldr r1, [r0, #0xe7c]
    add r0, r2, #0x18
    add r1, r1, #0x18
    bl func_020050a4
    add r2, r7, #0x2000
    ldr r1, [r2, #0xfb8]
    add r0, sp, #0xc
    add r1, r1, #0x2000
    ldr r4, [r1, #0xebc]
    mov r3, #0x0
    ldr r1, [r4, #0x1c]
    add r1, r1, r1, lsr #0x1f
    mov r1, r1, asr #0x1
    str r1, [r4, #0x1c]
    ldr r1, [r2, #0xfb8]
    add r1, r1, #0x2000
    ldr r4, [r1, #0xebc]
    ldr r1, [r4, #0x20]
    add r1, r1, r1, lsr #0x1f
    mov r1, r1, asr #0x1
    str r1, [r4, #0x20]
    ldr r1, [r2, #0xfb8]
    add r1, r1, #0x2000
    ldr r1, [r1, #0xebc]
    str r3, [r1, #0x24]
    bl func_02005058
    add r0, sp, #0x1c
    bl func_02005058
    mov r0, #0x1
L_02007ef8:
    add sp, sp, #0x2c
    ldmia sp!, {r4, r5, r6, r7, pc}
L_02007f00: .word data_02105310
L_02007f04: .word gLupyContext
    .size GamePhaseRuntime_ChangeToNeighborArea, .-GamePhaseRuntime_ChangeToNeighborArea


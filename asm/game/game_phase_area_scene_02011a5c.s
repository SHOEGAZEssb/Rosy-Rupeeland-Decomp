; Matching retail form; see src/game/game_phase_area_scene_lifecycle.c.
.text
.extern GXS_SetGraphicsMode
.extern GX_SetBankForSubBG
.extern GameWork_ClearFlag
.extern GameWork_ClearPointerBank
.extern Heap_Alloc
.extern data_020d5680
.extern data_020d5688
.extern func_02004fe0
.extern OverlaySlot_Init
.extern func_02029218
.extern func_02029360
.extern func_02029ca4
.extern func_0202bc18
.extern func_0202c0b8
.extern func_0202c4f4
.extern func_0202c8a8
.extern ActorCollection_Init
.extern func_020aea7c
.extern gGameWork
.extern gHeapContext

    .global func_02011a5c
func_02011a5c: ; 0x02011a5c
    stmdb sp!, {r4, r5, r6, lr}
    ldr r3, L_02011e98
    mov r6, r0
    str r3, [r6, #0x0]
    mov r3, #0x0
    add r0, r6, #0x8
    mov r5, r1
    mov r4, r2
    str r3, [r6, #0x4]
    bl ActorCollection_Init
    add r1, r6, #0x2000
    ldr r2, [r1, #0xea8]
    add r0, r6, #0xeb0
    bic r2, r2, #0x1f
    orr r2, r2, #0x3f
    str r2, [r1, #0xea8]
    add r0, r0, #0x2000
    str r5, [r1, #0xeac]
    bl OverlaySlot_Init
    add r1, r6, #0x2000
    mov r2, #0x0
    add r0, r6, #0x2ec0
    str r2, [r1, #0xebc]
    bl func_02004fe0
    add r0, r6, #0x2000
    mov r1, #0x0
    str r1, [r0, #0xed0]
    str r1, [r0, #0xed4]
    cmp r4, #0x0
    beq L_02011e48
    ldr r0, [r0, #0xeac]
    ldr r0, [r0, #0x40]
    mov r0, r0, lsl #0xc
    mov r0, r0, lsr #0x1e
    cmp r0, #0x1
    beq L_02011b10
    ldr r2, L_02011e9c
    ldr r1, [r2, #0x0]
    ldr r0, [r2, #0x0]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    bic r0, r3, #0xc
    orr r0, r1, r0, lsl #0x8
    str r0, [r2, #0x0]
L_02011b10:
    mov r0, #0x4
    bl GX_SetBankForSubBG
    mov r0, #0x80
    bl func_020aea7c
    add r0, r6, #0x2000
    ldr r1, [r0, #0xeac]
    ldr r0, [r1, #0x0]
    cmp r0, #0x2
    cmpne r0, #0xc7
    bne L_02011bac
    mov r0, #0x0
    bl GXS_SetGraphicsMode
    ldr r0, L_02011ea0
    ldr r1, L_02011ea4
    ldr r3, L_02011ea8
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02011b60
    bl func_0202bc18
L_02011b60:
    str r0, [r6, #0x4]
    add r1, r6, #0x2000
    ldr r1, [r1, #0xeac]
    ldr r4, [r0, #0x0]
    ldr r1, [r1, #0x8]
    ldr r4, [r4, #0x14]
    mov r2, #0x2
    mov r3, #0x0
    blx r4
    ldr r1, L_02011eac
    ldrh r0, [r1, #0x0]
    bic r0, r0, #0x3
    orr r0, r0, #0x1
    strh r0, [r1, #0x0]
    ldrh r0, [r1, #0x2]
    bic r0, r0, #0x3
    orr r0, r0, #0x2
    strh r0, [r1, #0x2]
    b L_02011e14
L_02011bac:
    cmp r0, #0x3
    bne L_02011c28
    mov r0, #0x0
    bl GXS_SetGraphicsMode
    ldr r0, L_02011ea0
    ldr r1, L_02011ea4
    ldr r3, L_02011ea8
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02011bdc
    bl func_0202c0b8
L_02011bdc:
    str r0, [r6, #0x4]
    add r1, r6, #0x2000
    ldr r1, [r1, #0xeac]
    ldr r4, [r0, #0x0]
    ldr r1, [r1, #0x8]
    ldr r4, [r4, #0x14]
    mov r2, #0x2
    mov r3, #0x0
    blx r4
    ldr r1, L_02011eac
    ldrh r0, [r1, #0x0]
    bic r0, r0, #0x3
    orr r0, r0, #0x1
    strh r0, [r1, #0x0]
    ldrh r0, [r1, #0x2]
    bic r0, r0, #0x3
    orr r0, r0, #0x2
    strh r0, [r1, #0x2]
    b L_02011e14
L_02011c28:
    cmp r0, #0x4
    bne L_02011ca4
    mov r0, #0x0
    bl GXS_SetGraphicsMode
    ldr r0, L_02011ea0
    ldr r1, L_02011ea4
    ldr r3, L_02011ea8
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02011c58
    bl func_0202c4f4
L_02011c58:
    str r0, [r6, #0x4]
    add r1, r6, #0x2000
    ldr r1, [r1, #0xeac]
    ldr r4, [r0, #0x0]
    ldr r1, [r1, #0x8]
    ldr r4, [r4, #0x14]
    mov r2, #0x2
    mov r3, #0x0
    blx r4
    ldr r1, L_02011eac
    ldrh r0, [r1, #0x0]
    bic r0, r0, #0x3
    orr r0, r0, #0x1
    strh r0, [r1, #0x0]
    ldrh r0, [r1, #0x2]
    bic r0, r0, #0x3
    orr r0, r0, #0x2
    strh r0, [r1, #0x2]
    b L_02011e14
L_02011ca4:
    cmp r0, #0x5d
    bne L_02011cfc
    mov r0, #0x0
    bl GXS_SetGraphicsMode
    ldr r0, L_02011ea0
    ldr r1, L_02011ea4
    ldr r3, L_02011ea8
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02011cd4
    bl func_0202c8a8
L_02011cd4:
    str r0, [r6, #0x4]
    add r1, r6, #0x2000
    ldr r1, [r1, #0xeac]
    ldr r4, [r0, #0x0]
    ldr r1, [r1, #0x8]
    ldr r4, [r4, #0x14]
    mov r2, #0x2
    mov r3, #0x0
    blx r4
    b L_02011e14
L_02011cfc:
    ldr r0, [r1, #0x40]
    mov r0, r0, lsl #0xc
    mov r0, r0, lsr #0x1e
    cmp r0, #0x1
    beq L_02011e14
    cmp r0, #0x3
    ldr r0, [r1, #0x40]
    ldreq r5, [r1, #0x4]
    mov r0, r0, lsl #0xa
    ldrne r5, [r1, #0x8]
    movs r0, r0, lsr #0x1e
    beq L_02011d3c
    cmp r0, #0x1
    beq L_02011d98
    cmp r0, #0x2
    b L_02011df0
L_02011d3c:
    mov r0, #0x0
    bl GXS_SetGraphicsMode
    ldr r0, L_02011ea0
    ldr r1, L_02011ea4
    ldr r3, L_02011ea8
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02011d64
    bl func_02029218
L_02011d64:
    str r0, [r6, #0x4]
    mov r1, #0x4
    mov r2, #0x1c
    mov r3, #0x1e
    bl func_02029360
    ldr r0, [r6, #0x4]
    mov r1, r5
    ldr r4, [r0, #0x0]
    mov r2, #0x2
    ldr r4, [r4, #0x14]
    mov r3, #0x0
    blx r4
    b L_02011df0
L_02011d98:
    mov r0, #0x0
    bl GXS_SetGraphicsMode
    ldr r0, L_02011ea0
    ldr r1, L_02011ea4
    ldr r3, L_02011ea8
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02011dc0
    bl func_02029218
L_02011dc0:
    str r0, [r6, #0x4]
    mov r1, #0x4
    mov r2, #0x1c
    mov r3, #0x1e
    bl func_02029360
    ldr r0, [r6, #0x4]
    mov r2, #0x2
    ldr r4, [r0, #0x0]
    mov r1, r5
    ldr r4, [r4, #0x14]
    mov r3, r2
    blx r4
L_02011df0:
    ldr r1, L_02011eac
    ldrh r0, [r1, #0x0]
    bic r0, r0, #0x3
    orr r0, r0, #0x1
    strh r0, [r1, #0x0]
    ldrh r0, [r1, #0x2]
    bic r0, r0, #0x3
    orr r0, r0, #0x2
    strh r0, [r1, #0x2]
L_02011e14:
    add r0, r6, #0x2000
    ldr r1, [r0, #0xeac]
    ldr r0, [r1, #0x40]
    mov r0, r0, lsl #0xc
    movs r0, r0, lsr #0x1e
    cmpne r0, #0x3
    bne L_02011e3c
    ldr r0, [r6, #0x4]
    add r1, r1, #0x34
    bl func_02029ca4
L_02011e3c:
    ldr r0, L_02011eb0
    mov r1, #0x0
    strh r1, [r0, #0x0]
L_02011e48:
    ldr r3, L_02011eb4
    add r2, r6, #0x2000
    ldr r0, [r3, #0x0]
    mov r1, #0x1
    add r0, r0, #0x200
    ldrsh r4, [r0, #0x44]
    strh r4, [r0, #0x42]
    ldr r2, [r2, #0xeac]
    ldr r0, [r3, #0x0]
    ldr r2, [r2, #0x0]
    add r0, r0, #0x200
    strh r2, [r0, #0x44]
    ldr r0, [r3, #0x0]
    bl GameWork_ClearPointerBank
    ldr r0, L_02011eb4
    ldr r1, L_02011eb8
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    mov r0, r6
    ldmia sp!, {r4, r5, r6, pc}
L_02011e98: .word data_020d5680
L_02011e9c: .word 0x4001000
L_02011ea0: .word 0x187c
L_02011ea4: .word data_020d5688
L_02011ea8: .word gHeapContext
L_02011eac: .word 0x400100c
L_02011eb0: .word 0x4001050
L_02011eb4: .word gGameWork
L_02011eb8: .word 0x3e9
    .size func_02011a5c, . - func_02011a5c


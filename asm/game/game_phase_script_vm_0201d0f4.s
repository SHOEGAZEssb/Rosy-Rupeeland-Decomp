; Matching retail form; see src/game/overlay52_scene_lifecycle.c.
.text
.extern Scene_Init
.extern Scene_SetFlags03
.extern Scene_ClearFlags03
.extern Scene_Destroy
.extern Heap_Free
.extern func_02002d28
.extern func_02002ac0
.extern func_02002cd0
.extern func_020022dc
.extern func_0200222c
.extern func_02002290
.extern func_020755bc
.extern Heap_Alloc
.extern func_ov052_0220d618
.extern func_ov052_0220e14c
.extern func_ov052_0220da54
.extern func_ov052_0220e178
.extern Sound_Play
.extern func_02008e10
.extern GamePhaseState_UpdateRenderHelpers
.extern data_020d5d24
.extern data_020d5d84
.extern data_020f4dc8
.extern gDebugFont
.extern gHeapContext
.extern gSoundContext
.extern data_021052fc
.global func_0201d0f4
func_0201d0f4: ; 0x0201d0f4
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x28]
    cmp r0, #0x0
    bne L_0201d1a4
    ldr r0, L_0201d208
    mov r1, #0x1
    bl func_02002d28
    bl func_02002cd0
    mvn r1, #0xf
    cmp r0, r1
    bne L_0201d1f0
    ldr r0, L_0201d20c
    ldr r0, [r0, #0x0]
    bl func_020755bc
    ldr r1, L_0201d210
    ldr r3, L_0201d214
    mov r0, #0x34
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_0201d158
    mov r1, #0x1
    mov r2, r1
    bl func_ov052_0220d618
L_0201d158:
    str r0, [r4, #0x28]
    ldr r1, [r4, #0x24]
    mov r2, #0x0
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bl func_ov052_0220e14c
    ldr r0, L_0201d218
    mov r1, #0x0
    ldr r0, [r0, #0x0]
    mov r2, #0x6f
    bl Sound_Play
    ldr r0, L_0201d208
    mov r1, #0x1
    bl func_02002d28
    mvn r1, #0xf
    mov r2, #0x0
    mov r3, #0x4
    bl func_02002ac0
    b L_0201d1f0
L_0201d1a4:
    bl func_ov052_0220da54
    cmp r0, #0x0
    beq L_0201d1d0
    cmp r4, #0x0
    beq L_0201d1c8
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_0201d1c8:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
L_0201d1d0:
    ldr r0, [r4, #0x28]
    ldrsh r1, [r0, #0x4]
    cmp r1, #0x1
    moveq r1, #0x1
    movne r1, #0x0
    cmp r1, #0x0
    beq L_0201d1f0
    bl func_ov052_0220e178
L_0201d1f0:
    ldr r0, L_0201d21c
    mov r1, #0x2
    ldr r0, [r0, #0x0]
    bl func_02008e10
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_0201d208: .word data_020f4dc8
L_0201d20c: .word gDebugFont
L_0201d210: .word data_020d5d84
L_0201d214: .word gHeapContext
L_0201d218: .word gSoundContext
L_0201d21c: .word data_021052fc


.size func_0201d0f4, . - func_0201d0f4

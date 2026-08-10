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
.global func_0201d094
func_0201d094: ; 0x0201d094
    stmdb sp!, {r4, lr}
    ldr r1, L_0201d0f0
    mov r4, r0
    str r1, [r4, #0x0]
    bl Scene_ClearFlags03
    ldr r0, [r4, #0x28]
    cmp r0, #0x0
    beq L_0201d0c0
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_0201d0c0:
    bl func_020022dc
    mov r1, #0x0
    bl func_02002290
    bl func_020022dc
    mov r1, #0x2
    bl func_02002290
    mov r0, r4
    bl Scene_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
L_0201d0f0: .word data_020d5d24


.size func_0201d094, . - func_0201d094

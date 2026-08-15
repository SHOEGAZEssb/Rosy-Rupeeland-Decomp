.text
; Matching fallback for the portable implementation in src/game/inventory_scene_controller.c.
.extern Heap_Alloc
.extern OverlaySlot_LoadOverlay
.extern data_020e55ec
.extern func_ov012_021fce3c
.extern gHeapContext

.global func_02068630
func_02068630:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, .L_02068688
    add r0, r4, #0x58
    bl OverlaySlot_LoadOverlay
    ldr r1, .L_0206868c
    add r0, r4, #0x64
    bl OverlaySlot_LoadOverlay
    ldr r1, .L_02068690
    ldr r3, .L_02068694
    mov r0, #0x90
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02068674
    add r1, r4, #0x70
    bl func_ov012_021fce3c
.L_02068674:
    str r0, [r4, #0x54]
    ldr r0, [r4, #0x20]
    orr r0, r0, #0x400
    str r0, [r4, #0x20]
    ldmia sp!, {r4, pc}
.L_02068688: .word 0x0
.L_0206868c: .word 0xe
.L_02068690: .word data_020e55ec
.L_02068694: .word gHeapContext
.size func_02068630, . - func_02068630

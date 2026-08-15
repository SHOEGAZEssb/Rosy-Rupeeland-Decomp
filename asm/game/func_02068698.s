.text
; Matching fallback for the portable implementation in src/game/inventory_scene_controller.c.
.extern Heap_Alloc
.extern OverlaySlot_LoadOverlay
.extern data_020e55f4
.extern func_ov015_021fce58
.extern gHeapContext

.global func_02068698
func_02068698:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, .L_020686f4
    add r0, r4, #0x58
    bl OverlaySlot_LoadOverlay
    ldr r1, .L_020686f8
    add r0, r4, #0x64
    bl OverlaySlot_LoadOverlay
    ldr r1, .L_020686fc
    ldr r3, .L_02068700
    mov r0, #0x304
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_020686e0
    add r1, r4, #0x7c
    mov r2, #0x0
    bl func_ov015_021fce58
.L_020686e0:
    str r0, [r4, #0x54]
    ldr r0, [r4, #0x20]
    orr r0, r0, #0x400
    str r0, [r4, #0x20]
    ldmia sp!, {r4, pc}
.L_020686f4: .word 0x1
.L_020686f8: .word 0xf
.L_020686fc: .word data_020e55f4
.L_02068700: .word gHeapContext
.size func_02068698, . - func_02068698

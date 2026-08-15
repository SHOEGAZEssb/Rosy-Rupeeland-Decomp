.text
; Matching fallback for the portable implementation in src/game/inventory_scene_controller.c.
.extern GameWork_ClearFlag
.extern Heap_Free
.extern OverlaySlot_Destroy
.extern data_020e55d8
.extern gGameWork

.global func_020685b0
func_020685b0:
    stmdb sp!, {r4, lr}
    ldr r1, .L_02068624
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x20]
    bic r0, r0, #0x400
    str r0, [r4, #0x20]
    ldr r0, [r4, #0x54]
    cmp r0, #0x0
    beq .L_020685e4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8]
    blx r1
.L_020685e4:
    ldr r0, .L_02068628
    ldr r1, .L_0206862c
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r0, .L_02068628
    mov r1, #0x388
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    add r0, r4, #0x64
    bl OverlaySlot_Destroy
    add r0, r4, #0x58
    bl OverlaySlot_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02068624: .word data_020e55d8
.L_02068628: .word gGameWork
.L_0206862c: .word 0x387
.size func_020685b0, . - func_020685b0

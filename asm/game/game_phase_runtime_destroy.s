.text
.extern data_020d431c
.extern data_021052fc
.extern FrameTaskList_DestroyNode
.extern OverlaySlot_Destroy
.extern func_02007040
.extern func_020099fc
.extern func_02009d58
.extern func_0200e574
.extern func_0200e5bc
.extern func_0200e61c
.extern func_0200f314
.extern func_0200f824
.extern func_02058ce0
.extern func_020ae90c
.extern func_020ae9a4
.extern func_ov056_0220e79c
.extern gSoundContext
.extern Heap_Free
.extern Scene_ClearFlags03
.extern Scene_Destroy

    .global func_02007064
.type func_02007064, @function
func_02007064:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, L_02007190
    mov r4, r0
    str r1, [r4, #0x0]
    bl Scene_ClearFlags03
    bl func_020ae9a4
    bl func_020ae90c
    add r0, r4, #0x3000
    ldr r0, [r0, #0xe8]
    cmp r0, #0x0
    beq L_020070ac
    beq L_020070a0
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_020070a0:
    add r0, r4, #0x3000
    mov r1, #0x0
    str r1, [r0, #0xe8]
L_020070ac:
    add r0, r4, #0x24
    bl func_0200e61c
    add r0, r4, #0x2000
    ldr r0, [r0, #0xfb8]
    cmp r0, #0x0
    beq L_020070d0
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
L_020070d0:
    add r0, r4, #0x3000
    ldr r5, [r0, #0xec]
    cmp r5, #0x0
    beq L_02007100
    beq L_020070f4
    mov r0, r5
    bl func_ov056_0220e79c
    mov r0, r5
    bl Heap_Free
L_020070f4:
    add r0, r4, #0x3000
    mov r1, #0x0
    str r1, [r0, #0xec]
L_02007100:
    add r0, r4, #0x24
    bl func_0200e5bc
    mov r0, r4
    bl func_02007040
    bl func_0200f824
    bl func_0200f314
    mov r1, #0x4000000
    ldr r0, [r1, #0x0]
    add r2, r1, #0x1000
    bic r0, r0, #0x1f00
    orr r0, r0, #0x1000
    str r0, [r1, #0x0]
    ldr r1, [r2, #0x0]
    ldr r0, L_02007194
    bic r1, r1, #0x1f00
    orr r1, r1, #0x1000
    str r1, [r2, #0x0]
    ldr r0, [r0, #0x4]
    bl FrameTaskList_DestroyNode
    ldr r0, L_02007198
    ldr r0, [r0, #0x0]
    bl func_02058ce0
    add r0, r4, #0x30c0
    bl OverlaySlot_Destroy
    add r0, r4, #0x44
    add r0, r0, #0x3000
    bl func_020099fc
    add r0, r4, #0x3bc
    add r0, r0, #0x2c00
    bl func_02009d58
    add r0, r4, #0x24
    bl func_0200e574
    mov r0, r4
    bl Scene_Destroy
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
L_02007190: .word data_020d431c
L_02007194: .word data_021052fc
L_02007198: .word gSoundContext
    .size func_02007064, .-func_02007064


.text
.extern SpritePresentation_InitVariant
.extern SpritePresentation_Destroy
.extern Heap_Free
.extern Presentation_AdvanceTransitions
.extern data_ov045_0220d5c4

.global func_ov045_0220b740
func_ov045_0220b740:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r2
    bl SpritePresentation_InitVariant
    ldr r0, .L_0220b76c
    mov r1, #0x1
    str r0, [r5, #0x0]
    str r4, [r5, #0xa0]
    mov r0, r5
    str r1, [r5, #0x88]
    ldmia sp!, {r3, r4, r5, pc}
.L_0220b76c: .word data_ov045_0220d5c4

.global func_ov045_0220b770
func_ov045_0220b770:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl SpritePresentation_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}

.global func_ov045_0220b784
func_ov045_0220b784:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl SpritePresentation_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}

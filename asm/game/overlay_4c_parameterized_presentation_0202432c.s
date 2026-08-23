; Matching retail form; see src/game/overlay_4c_parameterized_presentation.c.
.text
.extern Heap_Alloc
.extern data_020d68bc
.extern gOverlay4cParameterizedComponentAllocationTag
.extern OverlaySlot_Init
.extern OverlaySlot_LoadOverlay
.extern FieldEffect_Init
.extern func_ov094_02219568
.extern gHeapContext

    .global func_0202432c
    .type func_0202432c, @function
func_0202432c: ; 0x0202432c
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    mov r4, r2
    bl FieldEffect_Init
    ldr r1, .L_02024390
    add r0, r6, #0xc
    str r1, [r6, #0x0]
    bl OverlaySlot_Init
    ldr r1, .L_02024394
    add r0, r6, #0xc
    bl OverlaySlot_LoadOverlay
    mov r0, #0x4c
    ldr r1, .L_02024398
    mov r2, #0x4
    ldr r3, .L_0202439c
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02024384
    mov r1, r5
    mov r2, r4
    bl func_ov094_02219568
.L_02024384:
    str r0, [r6, #0x8]
    mov r0, r6
    ldmia sp!, {r4, r5, r6, pc}
.L_02024390: .word data_020d68bc
.L_02024394: .word 0x5e
.L_02024398: .word gOverlay4cParameterizedComponentAllocationTag
.L_0202439c: .word gHeapContext
    .size func_0202432c, . - func_0202432c

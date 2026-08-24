.text
; Matching fallback for the portable implementation in src/overlays/ov074/overlay074_recovery.c.
.extern gGamePhaseRuntime
.extern VecFx32Object_Init
.extern VecFx32Object_InitComponents
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern SplineMover_InitTransition
.extern GamePhaseRuntime_BuildSecondaryTransform
.extern func_ov074_02210a04

.global func_ov074_02210878
func_ov074_02210878:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xa4
    mov r5, r0
    add r0, sp, #0x94
    mov r4, r2
    bl VecFx32Object_Init
    ldr r1, .L_02210a00
    add r0, sp, #0x84
    ldr r1, [r1, #0x0]
    bl GamePhaseRuntime_BuildSecondaryTransform
    cmp r4, #0x3
    addls pc, pc, r4, lsl #0x2
    b .L_022109cc
.L_022108ac:
    b .L_022108bc
    b .L_02210900
    b .L_02210948
    b .L_0221098c
.L_022108bc:
    mov r2, #0x0
    add r0, sp, #0x74
    mov r3, r2
    mov r1, #0x80000
    bl VecFx32Object_InitComponents
    add r0, sp, #0x64
    add r1, sp, #0x84
    add r2, sp, #0x74
    bl func_ov074_02210a04
    add r0, sp, #0x94
    add r1, sp, #0x64
    bl VecFx32Object_Assign
    add r0, sp, #0x64
    bl VecFx32Object_Destroy
    add r0, sp, #0x74
    bl VecFx32Object_Destroy
    b .L_022109cc
.L_02210900:
    mov r1, #0x80000
    mov r2, #0x0
    add r0, sp, #0x54
    mov r3, r2
    rsb r1, r1, #0x0
    bl VecFx32Object_InitComponents
    add r0, sp, #0x44
    add r1, sp, #0x84
    add r2, sp, #0x54
    bl func_ov074_02210a04
    add r0, sp, #0x94
    add r1, sp, #0x44
    bl VecFx32Object_Assign
    add r0, sp, #0x44
    bl VecFx32Object_Destroy
    add r0, sp, #0x54
    bl VecFx32Object_Destroy
    b .L_022109cc
.L_02210948:
    mov r1, #0x0
    add r0, sp, #0x34
    mov r3, r1
    mov r2, #0x60000
    bl VecFx32Object_InitComponents
    add r0, sp, #0x24
    add r1, sp, #0x84
    add r2, sp, #0x34
    bl func_ov074_02210a04
    add r0, sp, #0x94
    add r1, sp, #0x24
    bl VecFx32Object_Assign
    add r0, sp, #0x24
    bl VecFx32Object_Destroy
    add r0, sp, #0x34
    bl VecFx32Object_Destroy
    b .L_022109cc
.L_0221098c:
    mov r1, #0x0
    add r0, sp, #0x14
    mov r3, r1
    sub r2, r1, #0x60000
    bl VecFx32Object_InitComponents
    add r0, sp, #0x4
    add r1, sp, #0x84
    add r2, sp, #0x14
    bl func_ov074_02210a04
    add r0, sp, #0x94
    add r1, sp, #0x4
    bl VecFx32Object_Assign
    add r0, sp, #0x4
    bl VecFx32Object_Destroy
    add r0, sp, #0x14
    bl VecFx32Object_Destroy
.L_022109cc:
    add r1, sp, #0x84
    mov ip, #0x20
    add r2, sp, #0x94
    mov r0, r5
    mov r3, r1
    str ip, [sp, #0x0]
    bl SplineMover_InitTransition
    add r0, sp, #0x84
    bl VecFx32Object_Destroy
    add r0, sp, #0x94
    bl VecFx32Object_Destroy
    add sp, sp, #0xa4
    ldmia sp!, {r4, r5, pc}
.L_02210a00: .word gGamePhaseRuntime
.size func_ov074_02210878, . - func_ov074_02210878

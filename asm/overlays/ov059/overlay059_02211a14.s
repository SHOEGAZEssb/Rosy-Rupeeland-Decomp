.text
; Matching fallback for the portable implementation in src/overlays/ov059/overlay059_recovery.c.
.extern VecFx32Object_InitComponents
.extern VecFx32Object_InitCopy
.extern VecFx32Object_Destroy
.extern SplineMover_Destroy
.extern SplineMover_InitTransition
.extern SplineMover_Assign

.global func_ov059_02211a14
func_ov059_02211a14:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x70
    mov r4, r1
    mov r1, #0x0
    mov r5, r0
    add r0, sp, #0x60
    mov r3, r1
    mov r2, r2, lsl #0xc
    bl VecFx32Object_InitComponents
    mov r1, #0x0
    add r0, sp, #0x50
    mov r3, r1
    mov r2, r4, lsl #0xc
    bl VecFx32Object_InitComponents
    add r0, sp, #0x40
    add r1, sp, #0x60
    bl VecFx32Object_InitCopy
    mov r0, #0x1e
    str r0, [sp, #0x0]
    add r0, sp, #0x4
    add r1, sp, #0x60
    add r2, sp, #0x50
    add r3, sp, #0x40
    bl SplineMover_InitTransition
    add r0, r5, #0x54
    add r1, sp, #0x4
    bl SplineMover_Assign
    add r0, sp, #0x4
    bl SplineMover_Destroy
    add r0, sp, #0x40
    bl VecFx32Object_Destroy
    add r0, sp, #0x50
    bl VecFx32Object_Destroy
    add r0, sp, #0x60
    bl VecFx32Object_Destroy
    add sp, sp, #0x70
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov059_02211a14, . - func_ov059_02211a14

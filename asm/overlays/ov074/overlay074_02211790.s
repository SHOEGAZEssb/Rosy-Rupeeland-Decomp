.text
; Matching fallback for the portable implementation in src/overlays/ov074/overlay074_recovery.c.
.extern VecFx32Object_Destroy
.extern SplineMover_Evaluate2D
.extern func_ov074_022117d0

.global func_ov074_02211790
func_ov074_02211790:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    mov r4, r0
    add r0, sp, #0x0
    add r1, r4, #0x18
    bl SplineMover_Evaluate2D
    ldr r1, [sp, #0x4]
    ldr r2, [sp, #0x8]
    mov r0, r4
    mov r1, r1, asr #0xc
    mov r2, r2, asr #0xc
    bl func_ov074_022117d0
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.size func_ov074_02211790, . - func_ov074_02211790

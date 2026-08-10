.text
; Matching fallback for the portable implementation in src/overlays/ov097/overlay097_recovery.c.
.extern Heap_Free
.extern VecFx32Object_Destroy
.extern func_ov078_02212ba0

.global func_ov097_02217974
func_ov097_02217974:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x2d8
    bl VecFx32Object_Destroy
    add r0, r4, #0x2c8
    bl VecFx32Object_Destroy
    mov r0, r4
    bl func_ov078_02212ba0
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov097_02217974, . - func_ov097_02217974

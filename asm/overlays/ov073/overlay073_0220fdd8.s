.text
; Matching fallback for the portable implementation in src/overlays/ov073/overlay073_recovery.c.
.extern Heap_Free
.extern VecFx32Object_Destroy
.extern func_0201e380

.global func_ov073_0220fdd8
func_ov073_0220fdd8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x2c
    bl VecFx32Object_Destroy
    mov r0, r4
    bl func_0201e380
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov073_0220fdd8, . - func_ov073_0220fdd8

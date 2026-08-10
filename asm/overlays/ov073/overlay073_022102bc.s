.text
; Matching fallback for the portable implementation in src/overlays/ov073/overlay073_recovery.c.
.extern VecFx32Object_Init

.global func_ov073_022102bc
func_ov073_022102bc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x10
    bl VecFx32Object_Init
    add r0, r4, #0x20
    bl VecFx32Object_Init
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov073_022102bc, . - func_ov073_022102bc

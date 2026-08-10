.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.
.extern ActorExtendedType2_CopyAdjustedDescriptor

.global func_ov075_02215110
func_ov075_02215110:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl ActorExtendedType2_CopyAdjustedDescriptor
    ldr r0, [r5, #0x2a4]
    cmp r0, #0x0
    movne r0, #0x0
    strneh r0, [r4, #0x0]
    strneh r0, [r4, #0x2]
    strneh r0, [r4, #0x4]
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov075_02215110, . - func_ov075_02215110

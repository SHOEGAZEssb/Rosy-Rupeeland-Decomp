.text
; Matching fallback for the portable implementation in src/overlays/ov084/overlay084_recovery.c.
.extern ActorExtendedType2_CopyAdjustedDescriptor

.global func_ov084_02212be8
func_ov084_02212be8:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl ActorExtendedType2_CopyAdjustedDescriptor
    add r0, r5, #0x200
    ldrh r0, [r0, #0xa0]
    tst r0, #0x1
    ldrh r0, [r4, #0x1a]
    bicne r0, r0, #0x1
    strneh r0, [r4, #0x1a]
    ldrneh r0, [r4, #0x1a]
    orrne r0, r0, #0x4
    orreq r0, r0, #0x1
    biceq r0, r0, #0x4
    strh r0, [r4, #0x1a]
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov084_02212be8, . - func_ov084_02212be8

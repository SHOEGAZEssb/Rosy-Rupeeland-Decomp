.text
; Matching fallback for the portable implementation in src/overlays/ov082/overlay082_recovery.c.
.extern ActorExtendedType2_CopyAdjustedDescriptor

.global func_ov082_022134f8
func_ov082_022134f8:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl ActorExtendedType2_CopyAdjustedDescriptor
    add r0, r5, #0x200
    ldrh r0, [r0, #0x98]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r0, [r4, #0x1a]
    bic r0, r0, #0x1
    strh r0, [r4, #0x1a]
    ldrh r0, [r4, #0x1a]
    orr r0, r0, #0x4
    strh r0, [r4, #0x1a]
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov082_022134f8, . - func_ov082_022134f8

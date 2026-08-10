.text
; Matching fallback for the portable implementation in src/overlays/ov096/overlay096_recovery.c.
.extern ActorExtendedType2_CopyAdjustedDescriptor
.extern func_ov096_02217e88

.global func_ov096_02217ec8
func_ov096_02217ec8:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    mov r4, r1
    bl ActorExtendedType2_CopyAdjustedDescriptor
    mov r0, r5
    bl func_ov096_02217e88
    cmp r0, #0x0
    moveq r0, #0x0
    streqh r0, [r4, #0x0]
    streqh r0, [r4, #0x2]
    streqh r0, [r4, #0x4]
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov096_02217ec8, . - func_ov096_02217ec8

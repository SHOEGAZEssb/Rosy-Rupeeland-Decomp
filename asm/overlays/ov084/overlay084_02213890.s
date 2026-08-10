.text
; Matching fallback for the portable implementation in src/overlays/ov084/overlay084_recovery.c.
.extern VecFx32Object_Destroy
.extern ActorExtendedType2_Destroy

.global func_ov084_02213890
func_ov084_02213890:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x298
    bl VecFx32Object_Destroy
    mov r0, r4
    bl ActorExtendedType2_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov084_02213890, . - func_ov084_02213890

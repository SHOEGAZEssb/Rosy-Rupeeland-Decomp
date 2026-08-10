.text
; Matching fallback for the portable implementation in src/overlays/ov076/overlay076_recovery.c.
.extern data_ov076_02214d08
.extern VecFx32Object_Destroy
.extern ActorExtendedLinkSource_Destroy
.extern GraphicsSpriteState_ReleaseFromGroup

.global func_ov076_02213858
func_ov076_02213858:
    stmdb sp!, {r4, lr}
    ldr r1, .L_02213898
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x2a0]
    bl GraphicsSpriteState_ReleaseFromGroup
    ldr r0, [r4, #0x2a4]
    bl GraphicsSpriteState_ReleaseFromGroup
    add r0, r4, #0x2b8
    bl VecFx32Object_Destroy
    add r0, r4, #0x2a8
    bl VecFx32Object_Destroy
    mov r0, r4
    bl ActorExtendedLinkSource_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02213898: .word data_ov076_02214d08
.size func_ov076_02213858, . - func_ov076_02213858

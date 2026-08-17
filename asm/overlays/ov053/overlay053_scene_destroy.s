.text
; Matching fallback for the portable implementation in src/overlays/ov053/overlay053_recovery.c.
.extern data_ov053_0220dd10
.extern OverlayManager_UnloadOverlay
.extern OverlayManager_GetGlobal
.extern AnimationResource_Destroy
.extern func_0201e28c
.extern AnimationResourceState_ReleaseResources
.extern GraphicsSpriteGroupOwner_DestroyGroup
.extern gDebugFont

.global func_ov053_0220d7fc
func_ov053_0220d7fc:
    stmdb sp!, {r4, lr}
    ldr r1, .L_0220d848
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, .L_0220d84c
    ldr r1, [r4, #0x8]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_DestroyGroup
    add r0, r4, #0x28
    bl AnimationResourceState_ReleaseResources
    bl OverlayManager_GetGlobal
    mov r1, #0x0
    bl OverlayManager_UnloadOverlay
    add r0, r4, #0x24
    bl AnimationResource_Destroy
    mov r0, r4
    bl func_0201e28c
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0220d848: .word data_ov053_0220dd10
.L_0220d84c: .word gDebugFont
.size func_ov053_0220d7fc, . - func_ov053_0220d7fc

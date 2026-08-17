.text
; Matching fallback for the portable implementation in src/overlays/ov059/overlay059_recovery.c.
.extern __destroy_arr
.extern AnimationResourceState_Destroy
.extern AnimationResourceState_ReleaseResources
.extern GraphicsSpriteGroup_Clear
.extern GraphicsSpriteGroupOwner_DestroyGroup
.extern gDebugFont

.global func_ov059_02210968
func_ov059_02210968:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x0]
    bl GraphicsSpriteGroup_Clear
    ldr r0, .L_022109b4
    ldr r1, [r4, #0x0]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_DestroyGroup
    add r0, r4, #0x4
    bl AnimationResourceState_ReleaseResources
    add r0, r4, #0x10
    bl AnimationResourceState_ReleaseResources
    add r0, r4, #0x4
    mov r1, #0x2
    mov r2, #0xc
    ldr r3, .L_022109b8
    bl __destroy_arr
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_022109b4: .word gDebugFont
.L_022109b8: .word AnimationResourceState_Destroy
.size func_ov059_02210968, . - func_ov059_02210968

.text
; Matching fallback for the portable implementation in src/overlays/ov094/overlay094_recovery.c.
.extern AnimationResourceState_Destroy
.extern GraphicsSpriteGroup_Destroy

.global func_ov094_022199e0
func_ov094_022199e0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0xc]
    bl GraphicsSpriteGroup_Destroy
    ldr r0, [r4, #0x10]
    bl GraphicsSpriteGroup_Destroy
    mov r0, r4
    bl AnimationResourceState_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov094_022199e0, . - func_ov094_022199e0

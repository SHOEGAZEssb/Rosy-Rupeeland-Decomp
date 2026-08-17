.text
; Matching fallback for the portable implementation in src/overlays/ov094/overlay094_recovery.c.
.extern data_ov094_02219e80
.extern AnimationResourceState_Destroy
.extern GraphicsSpriteState_ReleaseFromGroup
.extern SpritePresentation_Destroy

.global func_ov094_0221800c
func_ov094_0221800c:
    stmdb sp!, {r4, lr}
    ldr r1, .L_0221803c
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0xc0]
    bl GraphicsSpriteState_ReleaseFromGroup
    add r0, r4, #0xb0
    bl AnimationResourceState_Destroy
    mov r0, r4
    bl SpritePresentation_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0221803c: .word data_ov094_02219e80
.size func_ov094_0221800c, . - func_ov094_0221800c

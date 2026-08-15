.text
; Matching fallback for the portable implementation in src/overlays/ov094/overlay094_recovery.c.
.extern data_ov094_02219e9c
.extern GraphicsSpriteState_ReleaseFromGroup
.extern SpritePresentation_Destroy

.global func_ov094_02219434
func_ov094_02219434:
    stmdb sp!, {r4, lr}
    ldr r1, .L_0221945c
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0xa4]
    bl GraphicsSpriteState_ReleaseFromGroup
    mov r0, r4
    bl SpritePresentation_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0221945c: .word data_ov094_02219e9c
.size func_ov094_02219434, . - func_ov094_02219434

.text
; Matching fallback for the portable implementation in src/overlays/ov094/overlay094_recovery.c.
.extern data_ov094_02219ef0
.extern func_02071eb8
.extern GraphicsSpriteState_ReleaseFromGroup
.extern SpritePresentation_Destroy

.global func_ov094_02218b14
func_ov094_02218b14:
    stmdb sp!, {r4, lr}
    ldr r1, .L_02218b44
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0xb4]
    bl GraphicsSpriteState_ReleaseFromGroup
    add r0, r4, #0xa4
    bl func_02071eb8
    mov r0, r4
    bl SpritePresentation_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02218b44: .word data_ov094_02219ef0
.size func_ov094_02218b14, . - func_ov094_02218b14

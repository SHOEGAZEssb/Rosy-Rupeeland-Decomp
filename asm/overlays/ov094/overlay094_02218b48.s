.text
; Matching fallback for the portable implementation in src/overlays/ov094/overlay094_recovery.c.
.extern Heap_Free
.extern data_ov094_02219ef0
.extern AnimationResourceState_Destroy
.extern GraphicsSpriteState_ReleaseFromGroup
.extern SpritePresentation_Destroy

.global func_ov094_02218b48
func_ov094_02218b48:
    stmdb sp!, {r4, lr}
    ldr r1, .L_02218b80
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0xb4]
    bl GraphicsSpriteState_ReleaseFromGroup
    add r0, r4, #0xa4
    bl AnimationResourceState_Destroy
    mov r0, r4
    bl SpritePresentation_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02218b80: .word data_ov094_02219ef0
.size func_ov094_02218b48, . - func_ov094_02218b48

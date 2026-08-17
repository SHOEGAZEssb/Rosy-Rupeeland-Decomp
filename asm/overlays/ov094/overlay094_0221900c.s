.text
; Matching fallback for the portable implementation in src/overlays/ov094/overlay094_recovery.c.
.extern data_ov094_02219e70
.extern AnimationResourceState_Destroy
.extern GraphicsSpriteGroup_Destroy
.extern PresentationList_DeleteAll

.global func_ov094_0221900c
func_ov094_0221900c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x18
    bl PresentationList_DeleteAll
    ldr r0, [r4, #0x10]
    bl GraphicsSpriteGroup_Destroy
    ldr r0, [r4, #0x14]
    bl GraphicsSpriteGroup_Destroy
    ldr r1, .L_0221904c
    add r0, r4, #0x18
    str r1, [r4, #0x18]
    bl PresentationList_DeleteAll
    add r0, r4, #0x4
    bl AnimationResourceState_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0221904c: .word data_ov094_02219e70
.size func_ov094_0221900c, . - func_ov094_0221900c

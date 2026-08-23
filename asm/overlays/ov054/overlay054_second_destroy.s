.text
; Matching fallback for the portable implementation in src/overlays/ov054/overlay054_recovery.c.
.extern data_ov054_0220f160
.extern VecFx32Object_Destroy
.extern FieldEffect_DestroyBase
.extern AnimationResourceState_Destroy

.global func_ov054_0220ed0c
func_ov054_0220ed0c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, .L_0220ed50
    mov r2, #0x0
    add r0, r4, #0x40
    str r2, [r1, #0x0]
    bl VecFx32Object_Destroy
    add r0, r4, #0x30
    bl VecFx32Object_Destroy
    add r0, r4, #0x24
    bl AnimationResourceState_Destroy
    add r0, r4, #0x8
    bl VecFx32Object_Destroy
    mov r0, r4
    bl FieldEffect_DestroyBase
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0220ed50: .word data_ov054_0220f160
.size func_ov054_0220ed0c, . - func_ov054_0220ed0c

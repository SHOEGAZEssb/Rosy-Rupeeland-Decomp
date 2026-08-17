.text
; Matching fallback for the portable implementation in src/overlays/ov065/overlay065_recovery.c.
.extern data_ov065_02210c00
.extern VecFx32Object_Destroy
.extern VecFx32Triple_Set
.extern GraphicsSpriteState_SetAnimationIndex
.extern GraphicsSpriteGroup_ReplaceStateResources
.extern Overlay065Vector_InitScaled
.extern Overlay065Vector_DeriveControlPoint

.global func_ov065_0220fdac
func_ov065_0220fdac:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x34
    mov r6, r2
    mov r5, r0
    ldr r2, .L_0220fe70
    add r0, sp, #0x14
    mov r7, r1
    mov r4, r3
    bl Overlay065Vector_InitScaled
    ldr r2, .L_0220fe74
    add r0, sp, #0x4
    mov r1, r6
    bl Overlay065Vector_InitScaled
    add r0, sp, #0x24
    add r1, sp, #0x14
    add r2, sp, #0x4
    bl Overlay065Vector_DeriveControlPoint
    add r0, sp, #0x4
    bl VecFx32Object_Destroy
    add r0, sp, #0x14
    bl VecFx32Object_Destroy
    ldr r0, [r5, #0x10]
    mov r1, r7
    mov r2, r6
    add r3, sp, #0x24
    bl VecFx32Triple_Set
    mov r2, #0x0
    ldr r1, [sp, #0x4c]
    strh r2, [r5, #0x4]
    strh r1, [r5, #0x6]
    ldr r0, [sp, #0x48]
    strh r2, [r5, #0x8]
    strh r0, [r5, #0xa]
    ldr r0, .L_0220fe78
    ldr r1, [r5, #0x0]
    ldr r0, [r0, #0x0]
    ldr r3, [r0, #0x14c]
    ldr r0, [r3, #0xc]
    str r0, [sp, #0x0]
    ldr r0, [r1, #0x0]
    ldmib r3, {r2, r3}
    bl GraphicsSpriteGroup_ReplaceStateResources
    ldr r0, [r5, #0x0]
    and r1, r4, #0xff
    bl GraphicsSpriteState_SetAnimationIndex
    add r0, sp, #0x24
    bl VecFx32Object_Destroy
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_0220fe70: .word 0x4cd
.L_0220fe74: .word 0xb33
.L_0220fe78: .word data_ov065_02210c00
.size func_ov065_0220fdac, . - func_ov065_0220fdac

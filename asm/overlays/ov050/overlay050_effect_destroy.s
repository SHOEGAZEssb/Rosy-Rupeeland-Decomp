.text
; Matching fallback for the portable implementation in src/overlays/ov050/overlay050_effect_recovery.c.
.extern VecFx32Object_Destroy
.extern GraphicsSpriteGroup_ReleaseState

.global func_ov050_0220d6b0
func_ov050_0220d6b0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x0]
    ldr r0, [r1, #0x0]
    bl GraphicsSpriteGroup_ReleaseState
    ldr r1, [r4, #0x4]
    ldr r0, [r1, #0x0]
    bl GraphicsSpriteGroup_ReleaseState
    add r0, r4, #0x18
    bl VecFx32Object_Destroy
    add r0, r4, #0x8
    bl VecFx32Object_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov050_0220d6b0, . - func_ov050_0220d6b0

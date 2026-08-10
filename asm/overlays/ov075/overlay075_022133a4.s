.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.
.extern VecFx32Object_Assign
.extern Actor_GetCachedTerrainHeight
.extern GraphicsSpriteState_SetAnimationIndex

.global func_ov075_022133a4
func_ov075_022133a4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x298]
    cmp r0, #0x2
    ldmhiia sp!, {r4, pc}
    add r0, r4, #0x18
    bl VecFx32Object_Assign
    ldr r0, [r4, #0x298]
    cmp r0, #0x2
    ldmneia sp!, {r4, pc}
    mov r0, r4
    bl Actor_GetCachedTerrainHeight
    ldr r1, [r4, #0x24]
    cmp r1, r0
    ldmgeia sp!, {r4, pc}
    mov r0, r4
    bl Actor_GetCachedTerrainHeight
    str r0, [r4, #0x24]
    mov r0, #0x3
    str r0, [r4, #0x298]
    ldr r0, [r4, #0x54]
    mov r1, #0x15
    bl GraphicsSpriteState_SetAnimationIndex
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    bic r0, r0, #0x3
    strh r0, [r1, #0x24]
    ldr r0, [r4, #0x54]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x10
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    ldmneia sp!, {r4, pc}
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x8c]
    blx r1
    ldmia sp!, {r4, pc}
.size func_ov075_022133a4, . - func_ov075_022133a4

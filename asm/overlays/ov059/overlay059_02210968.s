.text
; Matching fallback for the portable implementation in src/overlays/ov059/overlay059_recovery.c.
.extern __destroy_arr
.extern func_02071eb8
.extern func_02071f38
.extern GraphicsSpriteGroup_Clear
.extern GraphicsSpriteGroupOwner_DestroyGroup
.extern gDebugFont

.global func_ov059_02210968
func_ov059_02210968:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x0]
    bl GraphicsSpriteGroup_Clear
    ldr r0, .L_022109b4
    ldr r1, [r4, #0x0]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_DestroyGroup
    add r0, r4, #0x4
    bl func_02071f38
    add r0, r4, #0x10
    bl func_02071f38
    add r0, r4, #0x4
    mov r1, #0x2
    mov r2, #0xc
    ldr r3, .L_022109b8
    bl __destroy_arr
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_022109b4: .word gDebugFont
.L_022109b8: .word func_02071eb8
.size func_ov059_02210968, . - func_ov059_02210968

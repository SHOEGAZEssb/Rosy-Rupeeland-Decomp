.text
; Matching fallback for the portable implementation in src/overlays/ov060/overlay060_recovery.c.
.extern data_020f4e14
.extern func_02071eb8
.extern GraphicsSpriteGroup_Clear
.extern GraphicsSpriteGroupOwner_DestroyGroup

.global func_ov060_022100b0
func_ov060_022100b0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x0]
    bl GraphicsSpriteGroup_Clear
    ldr r0, .L_022100e0
    ldr r1, [r4, #0x0]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_DestroyGroup
    add r0, r4, #0x4
    bl func_02071eb8
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_022100e0: .word data_020f4e14
.size func_ov060_022100b0, . - func_ov060_022100b0

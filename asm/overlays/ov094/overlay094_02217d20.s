.text
; Matching fallback for the portable implementation in src/overlays/ov094/overlay094_recovery.c.
.extern data_ov094_02219e70
.extern func_02071eb8
.extern GraphicsSpriteGroup_Destroy
.extern func_02095308

.global func_ov094_02217d20
func_ov094_02217d20:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x14
    bl func_02095308
    ldr r0, [r4, #0xc]
    bl GraphicsSpriteGroup_Destroy
    ldr r0, [r4, #0x10]
    bl GraphicsSpriteGroup_Destroy
    ldr r1, .L_02217d60
    add r0, r4, #0x14
    str r1, [r4, #0x14]
    bl func_02095308
    mov r0, r4
    bl func_02071eb8
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02217d60: .word data_ov094_02219e70
.size func_ov094_02217d20, . - func_ov094_02217d20

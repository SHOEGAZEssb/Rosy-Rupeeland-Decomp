.text
; Matching fallback for the portable implementation in src/overlays/ov059/overlay059_recovery.c.
.extern func_02071f38
.extern GraphicsSpriteGroup_Clear
.extern GraphicsSpriteGroupOwner_DestroyGroup
.extern gDebugFont

.global func_ov059_02210114
func_ov059_02210114:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x0]
    cmp r0, #0x0
    beq .L_02210144
    bl GraphicsSpriteGroup_Clear
    ldr r0, .L_02210174
    ldr r1, [r4, #0x0]
    ldr r0, [r0, #0x0]
    bl GraphicsSpriteGroupOwner_DestroyGroup
    mov r0, #0x0
    str r0, [r4, #0x0]
.L_02210144:
    add r0, r4, #0x44
    bl func_02071f38
    mov r0, #0x0
    str r0, [r4, #0x50]
    str r0, [r4, #0x54]
    str r0, [r4, #0x58]
    str r0, [r4, #0x5c]
    str r0, [r4, #0x60]
    str r0, [r4, #0x64]
    str r0, [r4, #0x68]
    str r0, [r4, #0x6c]
    ldmia sp!, {r4, pc}
.L_02210174: .word gDebugFont
.size func_ov059_02210114, . - func_ov059_02210114

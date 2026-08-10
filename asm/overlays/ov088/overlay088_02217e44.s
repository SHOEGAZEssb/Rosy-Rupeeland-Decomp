.text
; Matching fallback for the portable implementation in src/overlays/ov088/overlay088_recovery.c.
.extern data_021056f0
.extern data_ov088_0221b928
.extern func_02031488
.extern ActorDerivedRuntime_DestroyAlternate
.extern GraphicsSpriteState_ReleaseFromGroup
.extern func_ov088_02218290

.global func_ov088_02217e44
func_ov088_02217e44:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, .L_02217f30
    ldr r0, .L_02217f34
    str r1, [r4, #0x0]
    ldr r1, [r0, #0x0]
    cmp r4, r1
    moveq r1, #0x0
    streq r1, [r0, #0x0]
    mov r0, r4
    bl func_ov088_02218290
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0xbc]
    blx r1
    mov r0, r4
    bl func_02031488
    ldr r0, [r4, #0x224]
    cmp r0, #0x0
    beq .L_02217e98
    bl GraphicsSpriteState_ReleaseFromGroup
.L_02217e98:
    ldr r0, [r4, #0x228]
    cmp r0, #0x0
    beq .L_02217ea8
    bl GraphicsSpriteState_ReleaseFromGroup
.L_02217ea8:
    ldr r0, [r4, #0x22c]
    cmp r0, #0x0
    beq .L_02217eb8
    bl GraphicsSpriteState_ReleaseFromGroup
.L_02217eb8:
    ldr r0, [r4, #0x258]
    cmp r0, #0x0
    beq .L_02217ec8
    bl GraphicsSpriteState_ReleaseFromGroup
.L_02217ec8:
    ldr r0, [r4, #0x220]
    cmp r0, #0x0
    beq .L_02217ee0
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02217ee0:
    ldr r0, [r4, #0x254]
    cmp r0, #0x0
    beq .L_02217ef8
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02217ef8:
    ldr r0, [r4, #0x250]
    cmp r0, #0x0
    beq .L_02217f08
    bl GraphicsSpriteState_ReleaseFromGroup
.L_02217f08:
    ldr r0, [r4, #0x24c]
    cmp r0, #0x0
    beq .L_02217f20
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02217f20:
    mov r0, r4
    bl ActorDerivedRuntime_DestroyAlternate
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02217f30: .word data_ov088_0221b928
.L_02217f34: .word data_021056f0
.size func_ov088_02217e44, . - func_ov088_02217e44

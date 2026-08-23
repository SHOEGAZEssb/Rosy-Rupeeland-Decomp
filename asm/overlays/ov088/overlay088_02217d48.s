.text
; Matching fallback for the portable implementation in src/overlays/ov088/overlay088_recovery.c.
.extern Heap_Free
.extern data_021056f0
.extern data_ov088_0221b928
.extern Actor_ReleaseSecondaryRenderAttachment
.extern ActorDerivedRuntime_DestroyAlternate
.extern GraphicsSpriteState_ReleaseFromGroup
.extern func_ov088_02218290

.global func_ov088_02217d48
func_ov088_02217d48:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, .L_02217e3c
    ldr r0, .L_02217e40
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
    bl Actor_ReleaseSecondaryRenderAttachment
    ldr r0, [r4, #0x224]
    cmp r0, #0x0
    beq .L_02217d9c
    bl GraphicsSpriteState_ReleaseFromGroup
.L_02217d9c:
    ldr r0, [r4, #0x228]
    cmp r0, #0x0
    beq .L_02217dac
    bl GraphicsSpriteState_ReleaseFromGroup
.L_02217dac:
    ldr r0, [r4, #0x22c]
    cmp r0, #0x0
    beq .L_02217dbc
    bl GraphicsSpriteState_ReleaseFromGroup
.L_02217dbc:
    ldr r0, [r4, #0x258]
    cmp r0, #0x0
    beq .L_02217dcc
    bl GraphicsSpriteState_ReleaseFromGroup
.L_02217dcc:
    ldr r0, [r4, #0x220]
    cmp r0, #0x0
    beq .L_02217de4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02217de4:
    ldr r0, [r4, #0x254]
    cmp r0, #0x0
    beq .L_02217dfc
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02217dfc:
    ldr r0, [r4, #0x250]
    cmp r0, #0x0
    beq .L_02217e0c
    bl GraphicsSpriteState_ReleaseFromGroup
.L_02217e0c:
    ldr r0, [r4, #0x24c]
    cmp r0, #0x0
    beq .L_02217e24
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02217e24:
    mov r0, r4
    bl ActorDerivedRuntime_DestroyAlternate
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02217e3c: .word data_ov088_0221b928
.L_02217e40: .word data_021056f0
.size func_ov088_02217d48, . - func_ov088_02217d48

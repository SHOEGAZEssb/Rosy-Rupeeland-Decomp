.text
; Matching fallback for the portable implementation in src/overlays/ov087/overlay087_recovery.c.
.extern data_020f4e18
.extern ActorCollection_GetSpriteGroup
.extern Actor_GetOwningCollection
.extern func_02071ee0
.extern GraphicsSpriteGroup_CreateState

.global func_ov087_02217934
func_ov087_02217934:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r1
    ldr r2, [r4, #0xc]
    ldr r1, .L_022179ac
    str r2, [sp, #0x0]
    mov r5, r0
    ldr r1, [r1, #0x0]
    add r0, r5, #0x1f0
    ldmib r4, {r2, r3}
    bl func_02071ee0
    mov r0, r5
    bl Actor_GetOwningCollection
    bl ActorCollection_GetSpriteGroup
    ldrb r1, [r4, #0x10]
    str r1, [sp, #0x0]
    ldr r1, [r5, #0x1f0]
    ldr r2, [r5, #0x1f4]
    ldr r3, [r5, #0x1f8]
    bl GraphicsSpriteGroup_CreateState
    str r0, [r5, #0x54]
    mov r0, r5
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x14]
    blx r1
    ldr r0, [r5, #0x14]
    tst r0, #0x80
    ldrnesh r1, [r4, #0x3c]
    ldrne r0, [r5, #0x54]
    strneb r1, [r0, #0x3a]
    ldmia sp!, {r3, r4, r5, pc}
.L_022179ac: .word data_020f4e18
.size func_ov087_02217934, . - func_ov087_02217934

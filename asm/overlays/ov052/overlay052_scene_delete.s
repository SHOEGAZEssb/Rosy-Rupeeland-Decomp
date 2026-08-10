.text
; Matching fallback for the portable implementation in src/overlays/ov052/overlay052_recovery.c.
.extern Heap_Free
.extern data_020f4dc8
.extern data_020f4e18
.extern data_021052fc
.extern data_ov052_0220e200
.extern DisplayBrightness_StartTransition
.extern DisplayBrightnessPair_GetScreen
.extern func_02008570
.extern GamePhaseCurrencyHud_SetVisible
.extern func_02071d4c
.extern GraphicsSpriteGroup_Destroy
.extern gLupyContext

.global func_ov052_0220d968
func_ov052_0220d968:
    stmdb sp!, {r4, lr}
    ldr r1, .L_0220da40
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x10]
    cmp r0, #0x0
    beq .L_0220d990
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0220d990:
    ldr r0, .L_0220da44
    ldr r1, [r4, #0xc]
    ldr r0, [r0, #0x0]
    bl func_02071d4c
    ldr r0, [r4, #0x1c]
    bl GraphicsSpriteGroup_Destroy
    ldr r0, [r4, #0x20]
    cmp r0, #0x0
    beq .L_0220d9c0
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0220d9c0:
    ldr r0, .L_0220da48
    ldr r0, [r0, #0x0]
    add r1, r0, #0x2000
    ldr r1, [r1, #0xfb8]
    cmp r1, #0x0
    beq .L_0220d9e4
    mov r1, #0x1
    mov r2, r1
    bl func_02008570
.L_0220d9e4:
    ldr r0, [r4, #0x2c]
    mov r0, r0, lsl #0x10
    movs r0, r0, asr #0x10
    beq .L_0220da10
    ldr r0, .L_0220da4c
    mov r1, #0x1
    bl DisplayBrightnessPair_GetScreen
    mvn r1, #0xf
    mov r2, #0x0
    mov r3, #0x4
    bl DisplayBrightness_StartTransition
.L_0220da10:
    ldr r0, [r4, #0x30]
    mov r0, r0, lsl #0x10
    movs r0, r0, asr #0x10
    beq .L_0220da30
    ldr r0, .L_0220da50
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl GamePhaseCurrencyHud_SetVisible
.L_0220da30:
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0220da40: .word data_ov052_0220e200
.L_0220da44: .word data_020f4e18
.L_0220da48: .word data_021052fc
.L_0220da4c: .word data_020f4dc8
.L_0220da50: .word gLupyContext
.size func_ov052_0220d968, . - func_ov052_0220d968

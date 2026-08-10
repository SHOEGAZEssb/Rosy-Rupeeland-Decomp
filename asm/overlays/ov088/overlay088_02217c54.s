.text
; Matching fallback for the portable implementation in src/overlays/ov088/overlay088_recovery.c.
.extern data_021056f0
.extern data_ov088_0221b928
.extern func_02031488
.extern ActorDerivedRuntime_DestroyAlternate
.extern func_02073ef8
.extern func_ov088_02218290

.global func_ov088_02217c54
func_ov088_02217c54:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, .L_02217d40
    ldr r0, .L_02217d44
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
    beq .L_02217ca8
    bl func_02073ef8
.L_02217ca8:
    ldr r0, [r4, #0x228]
    cmp r0, #0x0
    beq .L_02217cb8
    bl func_02073ef8
.L_02217cb8:
    ldr r0, [r4, #0x22c]
    cmp r0, #0x0
    beq .L_02217cc8
    bl func_02073ef8
.L_02217cc8:
    ldr r0, [r4, #0x258]
    cmp r0, #0x0
    beq .L_02217cd8
    bl func_02073ef8
.L_02217cd8:
    ldr r0, [r4, #0x220]
    cmp r0, #0x0
    beq .L_02217cf0
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02217cf0:
    ldr r0, [r4, #0x254]
    cmp r0, #0x0
    beq .L_02217d08
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02217d08:
    ldr r0, [r4, #0x250]
    cmp r0, #0x0
    beq .L_02217d18
    bl func_02073ef8
.L_02217d18:
    ldr r0, [r4, #0x24c]
    cmp r0, #0x0
    beq .L_02217d30
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02217d30:
    mov r0, r4
    bl ActorDerivedRuntime_DestroyAlternate
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02217d40: .word data_ov088_0221b928
.L_02217d44: .word data_021056f0
.size func_ov088_02217c54, . - func_ov088_02217c54

.text

/* Exact fallback; see src/overlays/ov030/overlay030_start_and_select_states.c for documented portable C. */
.extern data_020f4e14
.extern data_ov030_021ff768
.extern data_ov030_021ff780
.extern data_ov030_021ff7a0
.extern data_ov030_021ff7b8
.extern func_02002d94
.extern func_0201140c
.extern func_02075598
.extern func_020755bc
.extern func_02092260
.extern func_02092c8c
.extern func_020939d8
.extern func_02095860
.extern func_ov030_021fda14
.extern func_ov030_021fe768
.extern func_ov030_021fea00
.extern func_ov030_021feb0c
.extern func_ov045_0220c9e8
.extern func_ov045_0220d2f8
.extern gDebugFont
.extern gLupyContext


    .global func_ov030_021feb64
func_ov030_021feb64:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq L_021feb84
    cmp r0, #0x1
    beq L_021febf0
    b L_021fec24
L_021feb84:
    ldr r0, L_021fec34
    ldr r0, [r0, #0x0]
    bl func_020755bc
    ldr r0, L_021fec38
    ldr r0, [r0, #0x0]
    bl func_020755bc
    ldr r0, L_021fec3c
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl func_0201140c
    ldr r0, L_021fec38
    ldr r1, [r4, #0x54]
    ldr r0, [r0, #0x0]
    bl func_02075598
    mov r0, #0x8
    mov r1, #0x21
    bl func_ov045_0220d2f8
    ldr r1, [r4, #0x20]
    mov r0, #0x0
    bic r1, r1, #0x1
    orr r1, r1, #0x1
    str r1, [r4, #0x20]
    ldr r1, [r4, #0x4]
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fec24
L_021febf0:
    bl func_02002d94
    cmp r0, #0x0
    beq L_021fec24
    mov r0, #0x8
    mov r1, #0x21
    bl func_ov045_0220c9e8
    str r0, [r4, #0x35c]
    mov r0, r4
    bl func_ov030_021feb0c
    ldr r1, L_021fec40
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov030_021fda14
L_021fec24:
    mov r0, r4
    bl func_ov030_021fe768
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_021fec34: .word data_020f4e14
L_021fec38: .word gDebugFont
L_021fec3c: .word gLupyContext
L_021fec40: .word data_ov030_021ff780
.size func_ov030_021feb64, .-func_ov030_021feb64
    .global func_ov030_021fec44
func_ov030_021fec44:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov030_021fea00
    ldr r0, [r4, #0x4]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b L_021fee50
L_021fec60: ; jump table
    b L_021fec70 ; case 0
    b L_021fec90 ; case 1
    b L_021fecb4 ; case 2
    b L_021fee2c ; case 3
L_021fec70:
    ldr r0, [r4, #0x78]
    mov r1, #0x1
    str r1, [r0, #0x20]
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
L_021fec90:
    bl func_02002d94
    cmp r0, #0x0
    beq L_021fee50
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fee50
L_021fecb4:
    ldr r0, [r4, #0x20]
    mov r0, r0, lsl #0x1a
    movs r0, r0, asr #0x1f
    beq L_021fee50
    add r0, r4, #0x210
    add r1, r4, #0x30
    mov r2, #0x0
    mov r3, #0x4
    bl func_02095860
    cmp r0, #0x0
    beq L_021fed08
    ldr r0, [r4, #0x2bc]
    bl func_020939d8
    mov r0, r4
    mov r1, #0x3
    bl func_02092260
    ldr r1, L_021fee60
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov030_021fda14
    b L_021fee50
L_021fed08:
    add r0, r4, #0xb8
    add r1, r4, #0x30
    mov r2, #0x0
    mov r3, #0x4
    bl func_02095860
    cmp r0, #0x0
    beq L_021fed98
    ldr r0, [r4, #0x384]
    cmp r0, #0x0
    mov r0, r4
    beq L_021fed78
    mov r1, #0x2
    bl func_02092260
    mov r0, #0x1
    str r0, [r4, #0x390]
    ldr r1, [r4, #0x37c]
    ldr r3, [r4, #0x380]
    ldr ip, [r1, #0x8]
    mov r2, #0x24
    sub r1, r2, #0x34
    mla r2, r3, r2, ip
    str r2, [r4, #0x394]
    bl func_02092c8c
    ldr r1, L_021fee64
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov030_021fda14
    b L_021fee50
L_021fed78:
    mov r1, #0x9
    bl func_02092260
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fee50
L_021fed98:
    add r0, r4, #0x164
    add r1, r4, #0x30
    mov r2, #0x0
    mov r3, #0x4
    bl func_02095860
    cmp r0, #0x0
    beq L_021fee50
    ldr r0, [r4, #0x38c]
    cmp r0, #0x0
    mov r0, r4
    beq L_021fee0c
    mov r1, #0x2
    bl func_02092260
    mov r0, #0x2
    str r0, [r4, #0x390]
    ldr r0, [r4, #0x37c]
    ldr r1, [r4, #0x388]
    ldr r2, [r0, #0x8]
    mov r0, #0x24
    mla r2, r1, r0, r2
    mov r0, #0x1
    sub r1, r0, #0x11
    str r2, [r4, #0x394]
    bl func_02092c8c
    ldr r1, L_021fee68
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov030_021fda14
    b L_021fee50
L_021fee0c:
    mov r1, #0x9
    bl func_02092260
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fee50
L_021fee2c:
    ldr r0, [r4, #0x8]
    add r0, r0, #0x1
    str r0, [r4, #0x8]
    cmp r0, #0xa
    ldrgt r1, [r4, #0x4]
    movgt r0, #0x0
    subgt r1, r1, #0x1
    strgt r1, [r4, #0x4]
    strgt r0, [r4, #0x8]
L_021fee50:
    mov r0, r4
    bl func_ov030_021fe768
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_021fee60: .word data_ov030_021ff7a0
L_021fee64: .word data_ov030_021ff768
L_021fee68: .word data_ov030_021ff7b8
.size func_ov030_021fec44, .-func_ov030_021fec44

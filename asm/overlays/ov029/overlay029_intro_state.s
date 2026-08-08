.text

/* Exact fallback; see src/overlays/ov029/overlay029_intro_state.c. */
.extern data_020f4e14
.extern data_ov029_021fec28
.extern data_ov029_021fec70
.extern data_ov029_021fed20
.extern func_02002d94
.extern func_02010b64
.extern func_0201140c
.extern func_02075598
.extern func_020755bc
.extern func_02092260
.extern func_02092c8c
.extern func_ov000_021fb6e0
.extern func_ov002_021fbdc0
.extern func_ov002_021fbe08
.extern func_ov002_021fbe60
.extern func_ov029_021fce4c
.extern func_ov029_021fd644
.extern func_ov029_021fd6fc
.extern func_ov029_021fd7a8
.extern func_ov029_021fd850
.extern func_ov045_0220c9e8
.extern func_ov045_0220d2f8
.extern gDebugFont
.extern gHeapContext
.extern gLupyContext
.extern Heap_Alloc


    .global func_ov029_021fd9e0
func_ov029_021fd9e0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x4]
    cmp r1, #0x4
    addls pc, pc, r1, lsl #0x2
    b L_021fdc2c
L_021fd9f8: ; jump table
    b L_021fda0c ; case 0
    b L_021fda8c ; case 1
    b L_021fdb38 ; case 2
    b L_021fdb68 ; case 3
    b L_021fdbd8 ; case 4
L_021fda0c:
    ldr r0, L_021fdc3c
    ldr r0, [r0, #0x0]
    bl func_020755bc
    ldr r0, L_021fdc40
    ldr r0, [r0, #0x0]
    bl func_020755bc
    ldr r0, L_021fdc44
    mov r2, #0xfa
    ldr r3, [r0, #0x0]
    mov r1, #0x1e
    strh r2, [r3, #0xbc]
    strh r1, [r3, #0xbe]
    ldr r0, [r0, #0x0]
    mov r1, #0x1
    bl func_0201140c
    ldr r0, L_021fdc40
    ldr r1, [r4, #0x78]
    ldr r0, [r0, #0x0]
    bl func_02075598
    ldr r0, [r4, #0x54]
    ldr r1, [r4, #0x58]
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
    b L_021fdc2c
L_021fda8c:
    bl func_02002d94
    cmp r0, #0x0
    beq L_021fdc2c
    ldr r0, [r4, #0x54]
    ldr r1, [r4, #0x58]
    bl func_ov045_0220c9e8
    str r0, [r4, #0x70]
    ldr r0, [r4, #0x58]
    cmp r0, #0x5
    mov r0, r4
    bne L_021fdac4
    mov r1, #0x6d
    bl func_02092260
    b L_021fdacc
L_021fdac4:
    mov r1, #0x69
    bl func_02092260
L_021fdacc:
    ldr r0, [r4, #0x5c]
    cmp r0, #0x4
    bne L_021fdb14
    ldr r0, L_021fdc44
    ldr r0, [r0, #0x0]
    bl func_02010b64
    cmp r0, #0x1
    bne L_021fdb14
    mov r2, #0x0
    mov r0, r4
    mov r1, #0x6
    str r2, [r4, #0x6c]
    bl func_ov029_021fd7a8
    ldr r1, L_021fdc48
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov029_021fce4c
    b L_021fdc2c
L_021fdb14:
    mov r0, r4
    mov r1, #0x0
    bl func_ov029_021fd7a8
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fdc2c
L_021fdb38:
    bl func_ov029_021fd850
    cmp r0, #0x0
    beq L_021fdc2c
    mov r0, #0x1
    sub r1, r0, #0x11
    bl func_02092c8c
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fdc2c
L_021fdb68:
    bl func_02002d94
    cmp r0, #0x0
    beq L_021fdc2c
    ldr r1, L_021fdc4c
    ldr r3, L_021fdc50
    mov r0, #0xb4
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_021fdba0
    ldr r1, L_021fdc3c
    mov r2, #0x0
    ldr r1, [r1, #0x0]
    bl func_ov000_021fb6e0 ; func_ov001_021fb6e0, func_ov002_021fb6e0, func_ov003_021fb6e0, func_ov004_021fb6e0, func_ov005_021fb6e0, func_ov006_021fb6e0, func_ov007_021fb6e0, func_ov008_021fb6e0
L_021fdba0:
    str r0, [r4, #0xa8]
    mov r0, r4
    bl func_ov029_021fd644
    mov r0, #0x1
    mov r1, #0x0
    bl func_02092c8c
    ldr r0, [r4, #0xa8]
    bl func_ov002_021fbdc0
    ldr r1, [r4, #0x4]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r4, #0x4]
    str r0, [r4, #0x8]
    b L_021fdc2c
L_021fdbd8:
    ldr r0, [r4, #0xa8]
    bl func_ov002_021fbe08
    cmp r0, #0x0
    beq L_021fdc1c
    bl func_02002d94
    cmp r0, #0x0
    beq L_021fdc1c
    ldr r1, L_021fdc54
    mov r0, r4
    bl func_02092260
    mov r0, #0x0
    ldr r1, L_021fdc58
    str r0, [r4, #0xe0]
    mov r0, r4
    ldmia r1, {r1, r2}
    bl func_ov029_021fce4c
    b L_021fdc2c
L_021fdc1c:
    ldr r0, [r4, #0xa8]
    bl func_ov002_021fbe60
    rsb r0, r0, #0x0
    str r0, [r4, #0xe0]
L_021fdc2c:
    mov r0, r4
    bl func_ov029_021fd6fc
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_021fdc3c: .word data_020f4e14
L_021fdc40: .word gDebugFont
L_021fdc44: .word gLupyContext
L_021fdc48: .word data_ov029_021fec70
L_021fdc4c: .word data_ov029_021fed20
L_021fdc50: .word gHeapContext
L_021fdc54: .word 0x3c84
L_021fdc58: .word data_ov029_021fec28
.size func_ov029_021fd9e0, .-func_ov029_021fd9e0

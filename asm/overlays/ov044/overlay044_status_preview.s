.text
.extern func_020755bc
.extern func_ov044_0220c74c
.extern func_ov044_0220bd98
.extern func_ov044_0220bb48
.extern func_ov001_021fb87c
.extern func_ov001_021fb81c
.extern gDebugFont

    .global func_ov044_0220c80c
func_ov044_0220c80c:
    stmdb sp!, {r4, lr}
    ldr r1, .L_0220c87c
    mov r4, r0
    ldr r0, [r1, #0x0]
    bl func_020755bc
    mov r0, r4
    mov r1, #0x2a
    bl func_ov044_0220c74c
    ldr r0, [r4, #0x228]
    cmp r0, #0x0
    beq .L_0220c86c
    bl func_ov044_0220bd98
    mov r1, #0x1
    bl func_ov044_0220bb48
    cmp r0, #0x0
    bne .L_0220c86c
    ldr r0, [r4, #0x228]
    bl func_ov044_0220bd98
    mov r1, r0
    ldr r0, [r4, #0x22c]
    ldr r1, [r1, #0xc]
    mov r2, #0x0
    bl func_ov001_021fb87c
    ldmia sp!, {r4, pc}
.L_0220c86c:
    ldr r0, [r4, #0x22c]
    mov r1, #0x1
    bl func_ov001_021fb81c
    ldmia sp!, {r4, pc}
.L_0220c87c: .word gDebugFont
.size func_ov044_0220c80c, . - func_ov044_0220c80c

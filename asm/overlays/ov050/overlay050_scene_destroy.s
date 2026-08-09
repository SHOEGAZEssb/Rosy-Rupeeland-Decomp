.text
; Matching fallback for the portable implementation in src/overlays/ov050/overlay050_scene_recovery.c.
.extern Heap_Free
.extern data_020f4e14
.extern data_ov050_0220e3c0
.extern func_02002290
.extern func_020022dc
.extern func_02005058
.extern func_0201e28c
.extern func_02071eb8
.extern func_02074330
.extern func_ov050_0220d8f4
.extern gDebugFont

.global func_ov050_0220dcb8
func_ov050_0220dcb8:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, .L_0220dd44
    mov r6, r0
    str r1, [r6, #0x0]
    mov r4, #0x0
.L_0220dccc:
    add r0, r6, r4, lsl #0x2
    ldr r5, [r0, #0x1c]
    cmp r5, #0x0
    beq .L_0220dcec
    mov r0, r5
    bl func_ov050_0220d8f4
    mov r0, r5
    bl Heap_Free
.L_0220dcec:
    add r4, r4, #0x1
    cmp r4, #0x4
    blt .L_0220dccc
    ldr r0, .L_0220dd48
    ldr r1, [r6, #0x14]
    ldr r0, [r0, #0x0]
    bl func_02074330
    ldr r0, .L_0220dd4c
    ldr r1, [r6, #0x18]
    ldr r0, [r0, #0x0]
    bl func_02074330
    bl func_020022dc
    mov r1, #0x0
    bl func_02002290
    add r0, r6, #0x30
    bl func_02005058
    add r0, r6, #0x8
    bl func_02071eb8
    mov r0, r6
    bl func_0201e28c
    mov r0, r6
    ldmia sp!, {r4, r5, r6, pc}
.L_0220dd44: .word data_ov050_0220e3c0
.L_0220dd48: .word data_020f4e14
.L_0220dd4c: .word gDebugFont
.size func_ov050_0220dcb8, . - func_ov050_0220dcb8

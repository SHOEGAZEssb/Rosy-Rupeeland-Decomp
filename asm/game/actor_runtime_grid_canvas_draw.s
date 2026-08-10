; Matching retail form; see src/game/actor_runtime_grid_canvas_draw.c for
; the documented portable implementation and recovered behavior.
.text
.extern func_0200c144
.extern SoftwareCanvas_DrawFormattedText
.extern func_02076428
.extern data_020d52f4
.extern gDebugFont
.global func_0200c00c
func_0200c00c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    sub sp, sp, #0x18
    mov r4, #0x0
    mov r10, r0
    mov r9, r1
    mov r8, r2
    mov r11, r4
L_0200c028:
    mov r0, #0x14
    mul r6, r4, r0
    mov r0, #0xa
    mul r7, r4, r0
    mov r5, #0x0
L_0200c03c:
    mov r1, #0x18
    mul r1, r5, r1
    mov r0, #0x18
    str r0, [sp, #0x10]
    mov r0, #0x14
    str r0, [sp, #0x14]
    add r0, sp, #0x8
    mov r2, r6
    str r11, [sp, #0x8]
    str r11, [sp, #0xc]
    bl func_0200c144
    add r0, sp, #0x8
    mov r1, #0x9
    mov r2, #0x6
    bl func_0200c144
    add r0, r5, r7
    add r3, r0, #0x1
    ldr r2, [r10, #0x14]
    mov r1, #0x5a
    mla r1, r2, r1, r3
    str r1, [sp, #0x0]
    ldr r1, [sp, #0x8]
    ldr r2, [sp, #0xc]
    ldr r3, L_0200c13c
    mov r0, r10
    add r1, r1, #0x1
    add r2, r2, #0x4
    bl SoftwareCanvas_DrawFormattedText
    add r5, r5, #0x1
    cmp r5, #0xa
    blt L_0200c03c
    add r4, r4, #0x1
    cmp r4, #0x9
    blt L_0200c028
    mov r0, #0x14
    add r1, r8, #0x1
    mul r4, r1, r0
    mov r1, #0x18
    add r2, r9, #0x1
    mul r5, r2, r1
    mul r6, r8, r0
    mul r7, r9, r1
    add r0, r4, #0x8
    str r0, [sp, #0x0]
    mov r1, #0x9
    ldr r0, L_0200c140
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    add r1, r7, #0x7
    add r2, r6, #0x4
    add r3, r5, #0xb
    bl func_02076428
    add r0, r4, #0x4
    str r0, [sp, #0x0]
    mov r1, #0x0
    ldr r0, L_0200c140
    str r1, [sp, #0x4]
    ldr r0, [r0, #0x0]
    add r1, r7, #0xb
    add r2, r6, #0x8
    add r3, r5, #0x7
    bl func_02076428
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
L_0200c13c: .word data_020d52f4
L_0200c140: .word gDebugFont
.size func_0200c00c, . - func_0200c00c


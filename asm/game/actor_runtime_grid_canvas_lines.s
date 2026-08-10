; Matching retail form; see src/game/actor_runtime_grid_canvas_lines.c for
; the documented portable implementation and recovered behavior.
.text
.extern SoftwareCanvas_FillRect
.extern SoftwareCanvas_DrawLine
.global ActorRuntimeGridCanvas_DrawGrid
ActorRuntimeGridCanvas_DrawGrid:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x8
    mov r2, #0xc0
    mov r1, #0x0
    str r2, [sp, #0x0]
    mov r2, r1
    mov r3, #0x100
    mov r4, r0
    str r1, [sp, #0x4]
    bl SoftwareCanvas_FillRect
    ldr r7, L_0200c224
    mov r9, #0x0
    mov r8, #0xba
    mov r6, #0x6
    mov r5, #0x18
L_0200c1b4:
    mul r3, r9, r5
    str r8, [sp, #0x0]
    mov r0, r4
    mov r2, r6
    add r1, r3, #0x9
    add r3, r3, #0x9
    str r7, [sp, #0x4]
    bl SoftwareCanvas_DrawLine
    add r9, r9, #0x1
    cmp r9, #0xb
    blt L_0200c1b4
    ldr r8, L_0200c224
    mov r9, #0x0
    mov r7, #0x9
    mov r6, #0xf9
    mov r5, #0x14
L_0200c1f4:
    mul r0, r9, r5
    add r2, r0, #0x6
    mov r0, r4
    mov r1, r7
    mov r3, r6
    stmia sp, {r2, r8}
    bl SoftwareCanvas_DrawLine
    add r9, r9, #0x1
    cmp r9, #0xa
    blt L_0200c1f4
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
L_0200c224: .word 0x7fff
.size ActorRuntimeGridCanvas_DrawGrid, . - ActorRuntimeGridCanvas_DrawGrid


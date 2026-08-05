; Matching retail form; see src/graphics/bg_blend_control.c.
.text
.extern OS_Halt
.extern func_020afd0c
.global func_0201cf34
func_0201cf34: ; 0x0201cf34
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r1
    mov r6, r2
    cmp r0, #0x4
    mov r4, #0x0
    mov r5, #0x10
    addls pc, pc, r0, lsl #0x2
    b L_0201cfa8
L_0201cf54: ; jump table
    b L_0201cf68 ; case 0
    b L_0201cf74 ; case 1
    b L_0201cf80 ; case 2
    b L_0201cf8c ; case 3
    b L_0201cf98 ; case 4
L_0201cf68:
    orr r5, r5, #0x2e
    mov r4, #0x1
    b L_0201cfac
L_0201cf74:
    orr r5, r5, #0x2d
    mov r4, #0x2
    b L_0201cfac
L_0201cf80:
    orr r5, r5, #0x2b
    mov r4, #0x4
    b L_0201cfac
L_0201cf8c:
    orr r5, r5, #0x27
    mov r4, #0x8
    b L_0201cfac
L_0201cf98:
    ldr r1, L_0201cfcc
    mov r0, r4
    strh r4, [r1, #0x0]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
L_0201cfa8:
    bl OS_Halt
L_0201cfac:
    ldr r0, L_0201cfcc
    mov r1, r4
    mov r2, r5
    mov r3, r7
    str r6, [sp, #0x0]
    bl func_020afd0c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
L_0201cfcc: .word 0x4001050


.size func_0201cf34, . - func_0201cf34

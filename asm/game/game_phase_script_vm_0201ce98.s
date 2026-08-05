; Matching retail form; see src/graphics/bg_blend_control.c.
.text
.extern OS_Halt
.extern func_020afd0c
.global func_0201ce98
func_0201ce98: ; 0x0201ce98
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r1
    mov r6, r2
    cmp r0, #0x4
    mov r4, #0x0
    mov r5, #0x10
    addls pc, pc, r0, lsl #0x2
    b L_0201cf0c
L_0201ceb8: ; jump table
    b L_0201cecc ; case 0
    b L_0201ced8 ; case 1
    b L_0201cee4 ; case 2
    b L_0201cef0 ; case 3
    b L_0201cefc ; case 4
L_0201cecc:
    orr r5, r5, #0x2f
    mov r4, #0x1
    b L_0201cf10
L_0201ced8:
    orr r5, r5, #0x2f
    mov r4, #0x2
    b L_0201cf10
L_0201cee4:
    orr r5, r5, #0x2f
    mov r4, #0x4
    b L_0201cf10
L_0201cef0:
    orr r5, r5, #0x2f
    mov r4, #0x8
    b L_0201cf10
L_0201cefc:
    ldr r1, L_0201cf30
    mov r0, r4
    strh r4, [r1, #0x0]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
L_0201cf0c:
    bl OS_Halt
L_0201cf10:
    ldr r0, L_0201cf30
    mov r1, r4
    mov r2, r5
    mov r3, r7
    str r6, [sp, #0x0]
    bl func_020afd0c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
L_0201cf30: .word 0x4000050


.size func_0201ce98, . - func_0201ce98

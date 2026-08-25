    .text
    .extern func_020befec
    .extern Overlay002_SetDisplayedValue
    .extern gSoundContext
    .extern Sound_Play
    .global Overlay002_ApplySelectedKey
Overlay002_ApplySelectedKey: ; 0x021fbc54
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0x8c]
    cmp r1, #0xb
    addls pc, pc, r1, lsl #0x2
    b L_021fbd54
L_021fbc6c: ; jump table
    b L_021fbc9c ; case 0
    b L_021fbc9c ; case 1
    b L_021fbc9c ; case 2
    b L_021fbc9c ; case 3
    b L_021fbc9c ; case 4
    b L_021fbc9c ; case 5
    b L_021fbc9c ; case 6
    b L_021fbc9c ; case 7
    b L_021fbc9c ; case 8
    b L_021fbc9c ; case 9
    b L_021fbd04 ; case 10
    b L_021fbd3c ; case 11
L_021fbc9c:
    mov r0, #0x1
    str r0, [r4, #0x90]
    ldr r0, [r4, #0x88]
    ldr r1, L_021fbd5c
    cmp r0, r1
    blt L_021fbcbc
    mov r1, #0xa
    bl func_020befec
L_021fbcbc:
    ldr r2, [r4, #0x8c]
    mov r1, #0xa
    mla r1, r0, r1, r2
    str r1, [r4, #0x88]
    ldr r1, [r4, #0x84]
    ldr r0, [r4, #0x88]
    cmp r0, r1
    strgt r1, [r4, #0x88]
    ldr r1, [r4, #0x88]
    mov r0, r4
    bl Overlay002_SetDisplayedValue
    ldr r0, L_021fbd60
    mov r1, #0x79
    ldr r0, [r0, #0x0]
    mov r2, #0x3
    bl Sound_Play
    mov r0, #0x1
    ldmia sp!, {r4, pc}
L_021fbd04:
    ldr r0, [r4, #0x88]
    mov r1, #0xa
    bl func_020befec
    str r0, [r4, #0x88]
    mov r1, r0
    mov r0, r4
    bl Overlay002_SetDisplayedValue
    ldr r0, L_021fbd60
    mov r1, #0x79
    ldr r0, [r0, #0x0]
    mov r2, #0x3
    bl Sound_Play
    mov r0, #0x1
    ldmia sp!, {r4, pc}
L_021fbd3c:
    mov r1, #0x0
    str r1, [r4, #0x90]
    str r1, [r4, #0x88]
    bl Overlay002_SetDisplayedValue
    mov r0, #0x1
    ldmia sp!, {r4, pc}
L_021fbd54:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
L_021fbd5c: .word 0xf4240
L_021fbd60: .word gSoundContext
    .size Overlay002_ApplySelectedKey, .-Overlay002_ApplySelectedKey


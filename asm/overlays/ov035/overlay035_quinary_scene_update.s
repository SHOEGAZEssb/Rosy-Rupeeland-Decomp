.text

/* Exact fallback; see src/overlays/ov035/overlay035_quinary_scene_update.c for documented portable C. */

    .extern PresentationList_UpdateAndDeleteCompleted
    .extern GraphicsAnimationInstanceManager_Update
    .extern Presentation_IsScriptComplete
    .extern func_ov035_022012ac
    .extern func_ov035_021fd5ac
    .extern func_02091c7c
    .extern func_02091b98
    .extern func_02091dac
    .extern func_02091bd0
    .extern func_ov035_02200ec0

    .global func_ov035_02201000
func_ov035_02201000:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
    mov r9, r0
    add r0, r9, #0x108
    bl PresentationList_UpdateAndDeleteCompleted
    add r0, r9, #0x118
    bl PresentationList_UpdateAndDeleteCompleted
    ldr r0, [r9, #0xf8]
    bl GraphicsAnimationInstanceManager_Update
    ldr r0, [r9, #0x104]
    bl Presentation_IsScriptComplete
    cmp r0, #0x0
    bne L_02201044
    ldr r0, [r9, #0x174]
    cmp r0, #0x0
    beq L_02201044
    mov r0, r9
    bl func_ov035_022012ac
L_02201044:
    mov r0, #0x0
    str r0, [r9, #0x174]
    ldr r0, [r9, #0x170]
    bl func_ov035_021fd5ac
    add r0, r9, #0xa4
    mov r1, #0x2
    bl func_02091c7c
    cmp r0, #0x0
    beq L_0220107c
    add r0, r9, #0xa4
    mov r1, #0xa
    bl func_02091b98
    add r0, r9, #0x154
    bl func_02091dac
L_0220107c:
    mov r11, #0x1
    mov r5, #0x0
    mov r10, r11
    mov r4, r11
    b L_02201198
L_02201090:
    ldr r0, [r9, #0x154]
    mov r6, #0x0
    mov r7, r6
    mov r8, r6
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    b L_02201180
L_022010ac: ; jump table
    b L_022010c4 ; case 0
    b L_022010e4 ; case 1
    b L_02201104 ; case 2
    b L_02201124 ; case 3
    b L_02201144 ; case 4
    b L_02201164 ; case 5
L_022010c4:
    mov r6, #0x1f
    add r0, r9, #0xa4
    mov r1, r4
    mov r2, r6
    mov r3, r8
    bl func_02091bd0
    mov r8, r0
    b L_02201180
L_022010e4:
    mov r6, #0x1f
    add r0, r9, #0xa4
    mov r1, r10
    mov r2, r8
    mov r3, r6
    bl func_02091bd0
    mov r7, r0
    b L_02201180
L_02201104:
    add r0, r9, #0xa4
    mov r1, r11
    mov r2, #0x1f
    mov r3, r6
    bl func_02091bd0
    mov r6, r0
    mov r7, #0x1f
    b L_02201180
L_02201124:
    mov r7, #0x1f
    add r0, r9, #0xa4
    mov r1, #0x1
    mov r2, r6
    mov r3, r7
    bl func_02091bd0
    mov r8, r0
    b L_02201180
L_02201144:
    add r0, r9, #0xa4
    mov r1, #0x1
    mov r2, #0x1f
    mov r3, r6
    bl func_02091bd0
    mov r7, r0
    mov r8, #0x1f
    b L_02201180
L_02201164:
    add r0, r9, #0xa4
    mov r1, #0x1
    mov r2, r6
    mov r3, #0x1f
    bl func_02091bd0
    mov r6, r0
    mov r8, #0x1f
L_02201180:
    mov r1, r6
    mov r2, r7
    mov r3, r8
    mov r0, r9
    bl func_ov035_02200ec0
    add r5, r5, #0x1
L_02201198:
    ldr r0, [r9, #0x16c]
    cmp r5, r0
    blt L_02201090
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, r11, pc}
    .size func_ov035_02201000, .-func_ov035_02201000


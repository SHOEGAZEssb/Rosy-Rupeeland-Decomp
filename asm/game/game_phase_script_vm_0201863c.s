; Matching retail form; see src/game/game_phase_script_vm_actor_bounds_opcode.c.
.text
.extern func_020083b0
.extern func_0200a2dc
.extern func_02012704
.extern func_020127f8
.extern func_020188e4
.extern func_020188fc
.extern func_0201895c
.extern func_02018998
.extern func_020189b0
.extern func_02030ad4
.extern func_020337d4
.extern Actor_BuildWorldInteractionBounds
.extern Actor_SetInteractionBounds
.extern func_02056f34
.global func_0201863c
func_0201863c:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x68
    mov r8, r0
    bl func_02012704
    mov r1, r0, lsl #0x10
    mov r0, r8
    mov r4, r1, asr #0x10
    bl func_02012704
    mov r1, r0, lsl #0x10
    mov r0, r8
    mov r5, r1, asr #0x10
    bl func_02012704
    mov r1, r0, lsl #0x10
    mov r0, r8
    mov r6, r1, asr #0x10
    bl func_02012704
    mov r1, r0, lsl #0x10
    mov r0, r8
    mov r7, r1, asr #0x10
    bl func_02012704
    cmp r0, #0xa
    addls pc, pc, r0, lsl #0x2
    b L_020188d8
L_02018698: ; jump table
    b L_020188d8 ; case 0
    b L_020186c4 ; case 1
    b L_020186ec ; case 2
    b L_020186fc ; case 3
    b L_0201870c ; case 4
    b L_02018718 ; case 5
    b L_02018724 ; case 6
    b L_020187b0 ; case 7
    b L_02018838 ; case 8
    b L_02018850 ; case 9
    b L_02018868 ; case 10
L_020186c4:
    add r0, sp, #0x14
    mov r1, r7
    mov r2, r6
    mov r3, r5
    str r4, [sp, #0x0]
    bl func_020083b0
    ldr r0, [r8, #0x84]
    add r1, sp, #0x14
    bl Actor_SetInteractionBounds
    b L_020188d8
L_020186ec:
    ldr r0, [r8, #0x84]
    rsb r1, r7, #0x0
    strh r1, [r0, #0x70]
    b L_020188d8
L_020186fc:
    ldr r0, [r8, #0x84]
    rsb r1, r7, #0x0
    strh r1, [r0, #0x72]
    b L_020188d8
L_0201870c:
    ldr r0, [r8, #0x84]
    strh r7, [r0, #0x74]
    b L_020188d8
L_02018718:
    ldr r0, [r8, #0x84]
    strh r7, [r0, #0x76]
    b L_020188d8
L_02018724:
    ldr r0, [r8, #0x84]
    add r0, r0, #0x70
    bl func_020188e4
    ldr r1, [r8, #0x84]
    mov r4, r0
    add r0, sp, #0x28
    add r1, r1, #0x70
    bl func_020188fc
    mov r0, r4, lsl #0x10
    mov r2, r0, asr #0x10
    mov r1, #0x0
    str r2, [sp, #0x0]
    add r0, sp, #0xc
    mov r2, r1
    mov r3, r7
    bl func_020083b0
    ldr r0, [r8, #0x84]
    add r1, sp, #0xc
    bl Actor_SetInteractionBounds
    rsb r0, r7, #0x0
    ldr r2, [r8, #0x84]
    add r1, r0, r0, lsr #0x1f
    add r0, r2, #0x70
    rsb r2, r4, #0x0
    ldrsh r4, [sp, #0x2c]
    ldrsh r3, [sp, #0x2e]
    add r2, r2, r2, lsr #0x1f
    add r1, r4, r1, asr #0x1
    add r2, r3, r2, asr #0x1
    mov r1, r1, lsl #0x10
    mov r2, r2, lsl #0x10
    mov r1, r1, asr #0x10
    mov r2, r2, asr #0x10
    bl func_0201895c
    b L_020188d8
L_020187b0:
    ldr r0, [r8, #0x84]
    add r0, r0, #0x70
    bl func_02018998
    ldr r1, [r8, #0x84]
    mov r4, r0
    add r0, sp, #0x20
    add r1, r1, #0x70
    bl func_020188fc
    mov r2, r4, lsl #0x10
    mov r1, #0x0
    mov r3, r2, asr #0x10
    add r0, sp, #0x4
    str r7, [sp, #0x0]
    mov r2, r1
    bl func_020083b0
    ldr r0, [r8, #0x84]
    add r1, sp, #0x4
    bl Actor_SetInteractionBounds
    rsb r0, r4, #0x0
    ldr r2, [r8, #0x84]
    add r1, r0, r0, lsr #0x1f
    ldrsh r4, [sp, #0x24]
    add r0, r2, #0x70
    rsb r2, r7, #0x0
    add r1, r4, r1, asr #0x1
    mov r1, r1, lsl #0x10
    ldrsh r3, [sp, #0x26]
    add r2, r2, r2, lsr #0x1f
    mov r1, r1, asr #0x10
    add r2, r3, r2, asr #0x1
    mov r2, r2, lsl #0x10
    mov r2, r2, asr #0x10
    bl func_0201895c
    b L_020188d8
L_02018838:
    ldr r0, [r8, #0x84]
    mov r1, r7
    mov r2, r6
    add r0, r0, #0x70
    bl func_0200a2dc
    b L_020188d8
L_02018850:
    ldr r0, [r8, #0x84]
    mov r1, r7
    mov r2, r6
    add r0, r0, #0x70
    bl func_020189b0
    b L_020188d8
L_02018868:
    ldr r5, [r8, #0x84]
    mov r0, r5
    bl func_020337d4
    mov r1, r7
    bl func_02030ad4
    mov r4, r0
    mov r0, r5
    bl func_020337d4
    mov r1, r6
    bl func_02030ad4
    mov r1, r0
    add r0, sp, #0x58
    add r2, r1, #0x18
    bl Actor_BuildWorldInteractionBounds
    add r0, sp, #0x48
    mov r1, r4
    add r2, r4, #0x18
    bl Actor_BuildWorldInteractionBounds
    add r0, sp, #0x38
    add r1, sp, #0x58
    add r2, sp, #0x48
    add r3, sp, #0x1c
    bl func_02056f34
    cmp r0, #0x0
    movne r1, #0x1
    moveq r1, #0x0
    mov r0, r8
    bl func_020127f8
L_020188d8:
    mov r0, #0x0
    add sp, sp, #0x68
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.size func_0201863c, . - func_0201863c

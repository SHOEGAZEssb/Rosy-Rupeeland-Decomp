; Matching retail form; see src/game/game_phase_script_vm_actor_presentation_mode_opcode.c.
.text
.extern data_020f4e14
.extern GamePhaseScriptVm_Pop
.extern func_020708c4
.extern GraphicsArchiveResource_ReleaseAlternateBuffer
.extern func_02070958
.extern func_02070a78
.extern GraphicsSpriteRenderer_QueueStatePaletteUploads
.extern func_020afd0c
.global func_02017ac8
func_02017ac8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #4
    mov r7, r0
    bl GamePhaseScriptVm_Pop
    mov r5, r0
    mov r0, r7
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    mov r0, r7
    bl GamePhaseScriptVm_Pop
    mov r6, r0
    mov r0, r7
    bl GamePhaseScriptVm_Pop
    ldr r1, [r7, #0x84]
    ldr r8, [r1, #0x54]
    ldr r7, [r1, #0x58]
    cmp r8, #0
    beq L_02017d04
    cmp r0, #6
    addls pc, pc, r0, lsl #2
    b L_02017d04
    b L_02017b38
    b L_02017b74
    b L_02017bb0
    b L_02017c04
    b L_02017c58
    b L_02017c6c
    b L_02017cdc
L_02017b38:
    ldr r0, [r8, #0x18]
    bl func_020708c4
    ldr r0, [r8]
    mov r1, r8
    ldr r0, [r0]
    bl GraphicsSpriteRenderer_QueueStatePaletteUploads
    cmp r7, #0
    beq L_02017d04
    ldr r0, [r7, #0x18]
    bl func_020708c4
    ldr r0, [r7]
    mov r1, r7
    ldr r0, [r0]
    bl GraphicsSpriteRenderer_QueueStatePaletteUploads
    b L_02017d04
L_02017b74:
    ldr r0, [r8, #0x18]
    bl GraphicsArchiveResource_ReleaseAlternateBuffer
    ldr r0, [r8]
    mov r1, r8
    ldr r0, [r0]
    bl GraphicsSpriteRenderer_QueueStatePaletteUploads
    cmp r7, #0
    beq L_02017d04
    ldr r0, [r7, #0x18]
    bl GraphicsArchiveResource_ReleaseAlternateBuffer
    ldr r0, [r7]
    mov r1, r7
    ldr r0, [r0]
    bl GraphicsSpriteRenderer_QueueStatePaletteUploads
    b L_02017d04
L_02017bb0:
    ldr r0, [r8, #0x18]
    mov r1, r6
    mov r2, r4
    mov r3, r5
    bl func_02070958
    ldr r0, [r8]
    mov r1, r8
    ldr r0, [r0]
    bl GraphicsSpriteRenderer_QueueStatePaletteUploads
    cmp r7, #0
    beq L_02017d04
    ldr r0, [r7, #0x18]
    mov r1, r6
    mov r2, r4
    mov r3, r5
    bl func_02070958
    ldr r0, [r7]
    mov r1, r7
    ldr r0, [r0]
    bl GraphicsSpriteRenderer_QueueStatePaletteUploads
    b L_02017d04
L_02017c04:
    ldr r0, [r8, #0x18]
    mov r1, r6
    mov r2, r4
    mov r3, r5
    bl func_02070a78
    ldr r0, [r8]
    mov r1, r8
    ldr r0, [r0]
    bl GraphicsSpriteRenderer_QueueStatePaletteUploads
    cmp r7, #0
    beq L_02017d04
    ldr r0, [r7, #0x18]
    mov r1, r6
    mov r2, r4
    mov r3, r5
    bl func_02070a78
    ldr r0, [r7]
    mov r1, r7
    ldr r0, [r0]
    bl GraphicsSpriteRenderer_QueueStatePaletteUploads
    b L_02017d04
L_02017c58:
    mov r0, #1
    strh r0, [r8, #0x2a]
    cmp r7, #0
    strneh r0, [r7, #0x2a]
    b L_02017d04
L_02017c6c:
    ldr r1, [r8]
    ldr r0, L_02017d10
    ldr r1, [r1]
    ldr r0, [r0]
    mov r2, #0x2f
    cmp r1, r0
    mov r1, #0
    bne L_02017ca4
    ldr r0, L_02017d14
    rsb r4, r6, #16
    mov r3, r6
    str r4, [sp]
    bl func_020afd0c
    b L_02017cb8
L_02017ca4:
    ldr r0, L_02017d18
    rsb r4, r6, #16
    mov r3, r6
    str r4, [sp]
    bl func_020afd0c
L_02017cb8:
    cmp r7, #0
    beq L_02017d04
    ldr r0, L_02017d18
    mov r3, r6
    mov r1, #0
    mov r2, #0x2f
    str r4, [sp]
    bl func_020afd0c
    b L_02017d04
L_02017cdc:
    ldr r1, [r8]
    ldr r0, L_02017d10
    ldr r1, [r1]
    ldr r0, [r0]
    cmp r1, r0
    ldreq r0, L_02017d14
    mov r1, #0
    streqh r1, [r0]
    ldrne r0, L_02017d18
    strneh r1, [r0]
L_02017d04:
    mov r0, #0
    add sp, sp, #4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
L_02017d10: .word data_020f4e14
L_02017d14: .word 0x04000050
L_02017d18: .word 0x04001050
    .size func_02017ac8, . - func_02017ac8

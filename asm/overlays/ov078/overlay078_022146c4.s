.text
; Matching fallback for the portable implementation in src/overlays/ov078/overlay078_recovery.c.
.extern func_02034a60
.extern ActorExtendedType2_GetDescriptorValue2A
.extern func_ov078_02213be0

.global func_ov078_022146c4
func_ov078_022146c4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov078_02213be0
    ldr r1, [r4, #0x260]
    mov r0, r4
    orr r1, r1, #0x8
    str r1, [r4, #0x260]
    bl ActorExtendedType2_GetDescriptorValue2A
    cmp r0, #0x2
    ldmltia sp!, {r4, pc}
    ldr r1, .L_02214700
    mov r0, r4
    mov r2, #0x0
    bl func_02034a60
    ldmia sp!, {r4, pc}
.L_02214700: .word 0x2a81
.size func_ov078_022146c4, . - func_ov078_022146c4

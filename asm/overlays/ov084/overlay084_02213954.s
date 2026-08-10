.text
; Matching fallback for the portable implementation in src/overlays/ov084/overlay084_recovery.c.
.extern func_02005030
.extern func_02005058
.extern Actor_GetCachedTerrainHeight
.extern ActorExtendedType2_TryCompleteAttachmentGate
.extern func_ov084_02213b2c

.global func_ov084_02213954
func_ov084_02213954:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    mov r4, r0
    bl ActorExtendedType2_TryCompleteAttachmentGate
    cmp r0, #0x0
    moveq r0, #0x0
    beq .L_022139a4
    ldr r1, [r4, #0x228]
    add r0, sp, #0x0
    add r1, r1, #0x18
    bl func_02005030
    ldr r0, [r4, #0x228]
    bl Actor_GetCachedTerrainHeight
    str r0, [sp, #0xc]
    add r1, sp, #0x0
    mov r0, r4
    bl func_ov084_02213b2c
    add r0, sp, #0x0
    bl func_02005058
    mov r0, #0x1
.L_022139a4:
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.size func_ov084_02213954, . - func_ov084_02213954

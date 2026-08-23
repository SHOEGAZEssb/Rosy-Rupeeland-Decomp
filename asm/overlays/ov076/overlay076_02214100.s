.text
; Matching fallback for the portable implementation in src/overlays/ov076/overlay076_recovery.c.
.extern data_020e7444
.extern Actor_PlayRadialSpatialSound
.extern ActorExtendedType2_UpdatePresentationForState

.global func_ov076_02214100
func_ov076_02214100:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r1, [r5, #0x54]
    ldrb r4, [r1, #0x38]
    bl ActorExtendedType2_UpdatePresentationForState
    ldrsh r0, [r5, #0xd6]
    sub r0, r0, #0x5
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0x10
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    cmp r0, #0x1
    ldmhiia sp!, {r3, r4, r5, pc}
    ldr r0, [r5, #0x54]
    ldrb r0, [r0, #0x38]
    cmp r4, r0
    ldrneh r1, [r5, #0x4e]
    ldrne r0, .L_02214168
    movne r1, r1, lsl #0x1
    ldrneh r1, [r0, r1]
    cmpne r1, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r5
    mov r2, #0x0
    bl Actor_PlayRadialSpatialSound
    ldmia sp!, {r3, r4, r5, pc}
.L_02214168: .word data_020e7444
.size func_ov076_02214100, . - func_ov076_02214100

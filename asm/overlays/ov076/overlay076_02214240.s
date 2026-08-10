.text
; Matching fallback for the portable implementation in src/overlays/ov076/overlay076_recovery.c.
.extern data_020e6d3c
.extern func_020349b8
.extern ActorExtendedType2_TryDescriptorInteraction128

.global func_ov076_02214240
func_ov076_02214240:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl ActorExtendedType2_TryDescriptorInteraction128
    movs r4, r0
    beq .L_0221427c
    mov r2, #0x0
    str r2, [r5, #0x298]
    ldrh r1, [r5, #0x4e]
    ldr r0, .L_02214284
    mov r1, r1, lsl #0x1
    ldrh r1, [r0, r1]
    cmp r1, #0x0
    beq .L_0221427c
    mov r0, r5
    bl func_020349b8
.L_0221427c:
    mov r0, r4
    ldmia sp!, {r3, r4, r5, pc}
.L_02214284: .word data_020e6d3c
.size func_ov076_02214240, . - func_ov076_02214240

.text
; Matching fallback for the portable implementation in src/overlays/ov084/overlay084_recovery.c.
.extern data_ov084_02214400
.extern VecFx32Object_Init
.extern ActorExtendedType2_Init

.global func_ov084_02213858
func_ov084_02213858:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorExtendedType2_Init
    ldr r1, .L_0221388c
    add r0, r4, #0x298
    str r1, [r4, #0x0]
    bl VecFx32Object_Init
    add r1, r4, #0x200
    mov r2, #0x0
    strh r2, [r1, #0xa8]
    mov r0, r4
    strh r2, [r1, #0xaa]
    ldmia sp!, {r4, pc}
.L_0221388c: .word data_ov084_02214400
.size func_ov084_02213858, . - func_ov084_02213858

.text
; Matching fallback for the portable implementation in src/overlays/ov051/overlay051_shared_recovery.c.
.extern data_ov051_0220df70
.extern FieldEffect_Init
.extern func_020ad250

.global func_ov051_0220d600
func_ov051_0220d600:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    bl FieldEffect_Init
    ldr r0, .L_0220d654
    mov r6, #0x0
    str r0, [r7, #0x0]
    add r5, r7, #0xc10
    add r4, r7, #0x10
.L_0220d620:
    add r0, r5, r6, lsl #0x4
    bl func_020ad250
    add r0, r4, r6, lsl #0x4
    bl func_020ad250
    add r6, r6, #0x1
    cmp r6, #0xc0
    blt .L_0220d620
    mov r0, #0x80
    str r0, [r7, #0x8]
    mov r1, #0xa0
    mov r0, r7
    str r1, [r7, #0xc]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0220d654: .word data_ov051_0220df70
.size func_ov051_0220d600, . - func_ov051_0220d600

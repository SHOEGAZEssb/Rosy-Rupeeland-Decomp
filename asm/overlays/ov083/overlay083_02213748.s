.text
; Matching fallback for the portable implementation in src/overlays/ov083/overlay083_recovery.c.
.extern data_ov083_02214154
.extern ActorExtendedLinkSource_Init
.extern func_ov083_02213734

.global func_ov083_02213748
func_ov083_02213748:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x4
    mov r4, r0
    bl ActorExtendedLinkSource_Init
    mov r1, #0x0
    ldr r0, .L_022137a4
    mov r2, r1
    mov r3, r1
    str r0, [r4, #0x0]
    mov ip, #0x1800
    add r0, r4, #0x2a0
    str ip, [sp, #0x0]
    bl func_ov083_02213734
    add r0, r4, #0x200
    mov r1, #0x0
    strh r1, [r0, #0xb0]
    strh r1, [r0, #0xb2]
    ldr r1, [r4, #0x260]
    mov r0, r4
    bic r1, r1, #0x8
    str r1, [r4, #0x260]
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, pc}
.L_022137a4: .word data_ov083_02214154
.size func_ov083_02213748, . - func_ov083_02213748

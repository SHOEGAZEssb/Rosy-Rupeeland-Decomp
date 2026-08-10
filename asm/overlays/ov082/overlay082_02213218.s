.text
; Matching fallback for the portable implementation in src/overlays/ov082/overlay082_recovery.c.
.extern data_ov082_022148d0
.extern ActorExtendedType2_Init

.global func_ov082_02213218
func_ov082_02213218:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorExtendedType2_Init
    ldr r0, .L_0221326c
    add r2, r4, #0x200
    str r0, [r4, #0x0]
    ldrh r0, [r2, #0x98]
    ldr r1, .L_02213270
    mov r3, #0x0
    bic r0, r0, #0x1
    strh r0, [r2, #0x98]
    ldrh ip, [r2, #0x98]
    mov r0, r4
    and r1, ip, r1
    strh r1, [r2, #0x98]
    strh r3, [r2, #0x9a]
    strh r3, [r2, #0x9c]
    ldr r1, [r4, #0x260]
    bic r1, r1, #0x8
    str r1, [r4, #0x260]
    ldmia sp!, {r4, pc}
.L_0221326c: .word data_ov082_022148d0
.L_02213270: .word 0xffff0001
.size func_ov082_02213218, . - func_ov082_02213218

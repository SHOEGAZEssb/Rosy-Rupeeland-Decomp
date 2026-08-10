.text
; Matching fallback for the portable implementation in src/overlays/ov096/overlay096_recovery.c.
.extern data_ov096_02218de8
.extern ActorExtendedTransform_Init

.global func_ov096_02218310
func_ov096_02218310:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl ActorExtendedTransform_Init
    ldr r0, .L_02218354
    add r2, r4, #0x200
    str r0, [r4, #0x0]
    mov r0, #0x0
    strh r0, [r2, #0xac]
    ldrh r3, [r2, #0xae]
    ldr r1, .L_02218358
    mov r0, r4
    bic r3, r3, #0x1
    strh r3, [r2, #0xae]
    ldrh r3, [r2, #0xae]
    and r1, r3, r1
    strh r1, [r2, #0xae]
    ldmia sp!, {r4, pc}
.L_02218354: .word data_ov096_02218de8
.L_02218358: .word 0xffff0001
.size func_ov096_02218310, . - func_ov096_02218310

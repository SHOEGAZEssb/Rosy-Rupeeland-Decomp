.text
; Matching fallback for the portable implementation in src/overlays/ov066/overlay066_recovery.c.
.extern func_020bf1f8
.extern func_ov066_0220fe40
.extern func_ov066_02210a00
.extern genrand_int32

.global func_ov066_0220fee0
func_ov066_0220fee0:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0xc
    mov r6, r0
    bl genrand_int32
    mov r5, r0
    bl genrand_int32
    mov r4, r0
    mov r0, r5
    mov r1, #0x9a
    bl func_020bf1f8
    mov r0, r4
    mov r4, r1
    mov r1, #0x14
    bl func_020bf1f8
    add r0, r4, #0x32
    mov r2, r1
    mov r1, r0, lsl #0xc
    add r0, r2, #0x28
    mov r2, r0, lsl #0xc
    add r0, sp, #0x0
    bl func_ov066_0220fe40
    bl genrand_int32
    mov r1, #0x7
    bl func_020bf1f8
    mov r3, r1
    add r2, r3, #0x4
    ldr r0, [r6, #0x24]
    add r1, sp, #0x0
    mov r2, r2, lsl #0xc
    bl func_ov066_02210a00
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, pc}
.size func_ov066_0220fee0, . - func_ov066_0220fee0

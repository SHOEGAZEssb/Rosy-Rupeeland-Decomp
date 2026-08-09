.text
; Matching fallback for the portable implementation in src/overlays/ov069/overlay069_recovery.c.
.extern __construct_array
.extern func_02004fe0
.extern func_ov069_0220fd20
.extern func_ov069_0220fd3c
.extern func_ov069_0220fe0c
.extern func_ov069_0220fe28
.extern genrand_int32

.global func_ov069_0220fd40
func_ov069_0220fd40:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r0
    ldr r4, .L_0220fdfc
    ldr r3, .L_0220fe00
    add r0, r6, #0x4
    mov r1, #0x27
    mov r2, #0xc
    str r4, [sp, #0x0]
    bl __construct_array
    ldr r4, .L_0220fe04
    ldr r3, .L_0220fe08
    add r0, r6, #0x1d8
    mov r1, #0x27
    mov r2, #0x8
    str r4, [sp, #0x0]
    bl __construct_array
    add r0, r6, #0x310
    bl func_02004fe0
    add r0, r6, #0x320
    bl func_02004fe0
    mov r0, #0xd
    sub r4, r0, #0x1
    mov r7, #0x18
.L_0220fd9c:
    mul r5, r4, r7
    bl genrand_int32
    add r1, r6, r5
    add r1, r1, #0x100
    strh r0, [r1, #0xe4]
    bl genrand_int32
    add r1, r6, r5
    add r1, r1, #0x100
    strh r0, [r1, #0xec]
    bl genrand_int32
    add r1, r6, r5
    add r1, r1, #0x100
    strh r0, [r1, #0xe6]
    bl genrand_int32
    add r1, r6, r5
    add r1, r1, #0x100
    strh r0, [r1, #0xee]
    subs r4, r4, #0x1
    bpl .L_0220fd9c
    mov r1, #0x0
    str r1, [r6, #0x330]
    mov r0, r6
    str r1, [r6, #0x338]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_0220fdfc: .word func_ov069_0220fd3c
.L_0220fe00: .word func_ov069_0220fd20
.L_0220fe04: .word func_ov069_0220fe28
.L_0220fe08: .word func_ov069_0220fe0c
.size func_ov069_0220fd40, . - func_ov069_0220fd40

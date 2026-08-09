.text
; Matching fallback for the portable implementation in src/overlays/ov095/overlay095_recovery.c.
.extern data_ov095_0221cec0
.extern func_020bf1f8
.extern genrand_int32

.global func_ov095_0221bda4
func_ov095_0221bda4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r1, r4, #0x200
    ldrsh r2, [r1, #0x5a]
    cmp r2, #0x0
    bne .L_0221be0c
    bl genrand_int32
    mov r1, #0x78
    bl func_020bf1f8
    add r1, r1, #0x78
    add r0, r4, #0x200
    strh r1, [r0, #0x58]
    bl genrand_int32
    mov r1, #0x60
    bl func_020bf1f8
    ldr r2, [r4, #0x230]
    sub r0, r1, #0x30
    add r0, r2, r0, lsl #0xc
    str r0, [r4, #0x7c]
    bl genrand_int32
    and r0, r0, #0xf
    ldr r1, [r4, #0x234]
    sub r0, r0, #0x8
    add r0, r1, r0, lsl #0xc
    str r0, [r4, #0x80]
    b .L_0221beb4
.L_0221be0c:
    ldrh r1, [r1, #0x58]
    cmp r2, r1
    blt .L_0221be30
    ldr r0, .L_0221becc
    ldr r1, [r0, #0x8]
    ldr r0, [r0, #0xc]
    str r1, [r4, #0x220]
    str r0, [r4, #0x224]
    b .L_0221beb4
.L_0221be30:
    ldr r2, [r4, #0x20]
    ldr r1, [r4, #0x80]
    ldr r3, [r4, #0x1c]
    sub r1, r2, r1
    mov r2, r1, asr #0xc
    mul r1, r2, r2
    ldr r2, [r4, #0x7c]
    sub r2, r3, r2
    mov r2, r2, asr #0xc
    mla r1, r2, r2, r1
    cmp r1, #0x4
    ldrle r0, .L_0221becc
    ldrle r1, [r0, #0x0]
    ldrle r0, [r0, #0x4]
    strle r1, [r4, #0x220]
    strle r0, [r4, #0x224]
    ble .L_0221be84
    ldr r2, [r0, #0x0]
    add r1, r4, #0x78
    ldr r2, [r2, #0xd0]
    blx r2
.L_0221be84:
    add r0, r4, #0x200
    ldrh r0, [r0, #0x98]
    cmp r0, #0x0
    beq .L_0221beb4
    ldr r0, [r4, #0x3c]
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    str r0, [r4, #0x3c]
    ldr r0, [r4, #0x40]
    add r0, r0, r0, lsr #0x1f
    mov r0, r0, asr #0x1
    str r0, [r4, #0x40]
.L_0221beb4:
    add r1, r4, #0x200
    ldrsh r2, [r1, #0x5a]
    mov r0, #0x0
    add r2, r2, #0x1
    strh r2, [r1, #0x5a]
    ldmia sp!, {r4, pc}
.L_0221becc: .word data_ov095_0221cec0
.size func_ov095_0221bda4, . - func_ov095_0221bda4

.text
; Matching fallback for the portable implementation in src/overlays/ov076/overlay076_recovery.c.
.extern Sound_Play
.extern func_02034a60
.extern func_ov076_02214034
.extern gSoundContext
.extern genrand_int32

.global func_ov076_02213664
func_ov076_02213664:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x298]
    mov r1, #0x4000
    str r1, [r0, #0x44]
    str r1, [r0, #0x2c4]
    mov r1, #0x20
    bl func_ov076_02214034
    bl genrand_int32
    ldrb r1, [r4, #0x29c]
    add r0, r4, #0x200
    mov r2, #0x1
    orr r1, r1, #0x4
    strb r1, [r4, #0x29c]
    ldrb r1, [r4, #0x29d]
    add r1, r1, #0x1
    strb r1, [r4, #0x29d]
    ldrsh r1, [r0, #0xa4]
    add r1, r1, #0x3c
    strh r1, [r0, #0xa4]
    ldrsh r1, [r0, #0xa4]
    cmp r1, #0x168
    movgt r1, #0x168
    strgth r1, [r0, #0xa4]
    ldr r0, .L_022136f0
    mov r1, #0x1c4
    ldr r0, [r0, #0x0]
    bl Sound_Play
    ldrb r2, [r4, #0x29d]
    mov r0, #0x3c
    ldr r1, .L_022136f4
    smulbb r2, r2, r0
    mov r0, r4
    bl func_02034a60
    ldmia sp!, {r4, pc}
.L_022136f0: .word gSoundContext
.L_022136f4: .word 0xe202
.size func_ov076_02213664, . - func_ov076_02213664

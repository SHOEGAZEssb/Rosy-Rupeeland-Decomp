.text
; Matching fallback for the portable implementation in src/overlays/ov074/overlay074_recovery.c.
.extern data_020c9670
.extern data_021052fc
.extern GamePhaseState_GetConfiguration
.extern func_020b0808
.extern func_020b0844
.extern func_020b0880
.extern func_ov074_02211960

.global func_ov074_022117d0
func_ov074_022117d0:
    stmdb sp!, {r3, r4, r5, lr}
    ldr ip, .L_02211930
    rsb r3, r1, #0x80
    mov lr, #0x0
    rsb r1, r2, #0x60
    str lr, [ip, #0x0]
    mov r2, r3, lsl #0xc
    str r2, [ip, #0x2c]
    mov r1, r1, lsl #0xc
    str r1, [ip, #0x2c]
    str lr, [ip, #0x2c]
    ldrh r0, [r0, #0x2]
    ldr r1, .L_02211934
    mov r0, r0, asr #0x4
    mov r2, r0, lsl #0x1
    add r0, r2, #0x1
    mov r2, r2, lsl #0x1
    mov r0, r0, lsl #0x1
    ldrsh r4, [r1, r2]
    ldrsh r5, [r1, r0]
    mov r0, r4
    mov r1, r5
    bl func_020b0880
    mov r0, r4
    mov r1, r5
    bl func_020b0844
    mov r0, r4
    mov r1, r5
    bl func_020b0808
    ldr r2, .L_02211938
    mov r0, #0x100000
    str r0, [r2, #0x0]
    mov r0, #0xc0000
    str r0, [r2, #0x0]
    mov r1, #0x1000
    ldr r0, .L_0221193c
    str r1, [r2, #0x0]
    ldr r1, .L_02211940
    str r0, [r2, #0x3c]
    ldr r0, .L_02211944
    str r1, [r2, #0x38]
    ldr r0, [r0, #0x0]
    add r0, r0, #0x24
    bl GamePhaseState_GetConfiguration
    ldrsh r2, [r0, #0x56]
    mov r0, #0x0
    ldr r3, .L_02211948
    orr r1, r2, r2, lsl #0x5
    orr r1, r1, r2, lsl #0xa
    mov r1, r1, lsl #0x10
    mov r2, r1, lsr #0x10
    mov r1, r0
    str r2, [r3, #0x0]
    mov r2, #0x1
    str r2, [r3, #0x80]
    bl func_ov074_02211960
    ldr r2, .L_0221194c
    ldr r0, .L_02211950
    mov r1, #0x0
    str r2, [r0, #0x0]
    str r1, [r0, #0x0]
    mov r0, #0x100000
    bl func_ov074_02211960
    ldr r2, .L_02211954
    ldr r1, .L_02211950
    mov r0, #0x0
    str r2, [r1, #0x0]
    str r0, [r1, #0x0]
    mov r0, #0x100000
    mov r1, #0xc0000
    bl func_ov074_02211960
    ldr r0, .L_02211958
    ldr r2, .L_02211950
    str r0, [r2, #0x0]
    mov r0, #0x0
    mov r1, #0xc0000
    str r0, [r2, #0x0]
    bl func_ov074_02211960
    ldr r0, .L_0221195c
    ldr r2, .L_02211950
    mov r1, #0x0
    str r0, [r2, #0x0]
    str r1, [r2, #0x0]
    str r1, [r2, #0x78]
    mov r0, #0x1
    str r0, [r2, #-0x44]
    str r1, [r2, #0xb4]
    ldmia sp!, {r3, r4, r5, pc}
.L_02211930: .word 0x4000444
.L_02211934: .word data_020c9670
.L_02211938: .word 0x400046c
.L_0221193c: .word 0x5ed00000
.L_02211940: .word 0x1f00c0
.L_02211944: .word data_021052fc
.L_02211948: .word 0x4000480
.L_0221194c: .word 0xf800f800
.L_02211950: .word 0x400048c
.L_02211954: .word 0xf8000800
.L_02211958: .word 0x8000800
.L_0221195c: .word 0x800f800
.size func_ov074_022117d0, . - func_ov074_022117d0

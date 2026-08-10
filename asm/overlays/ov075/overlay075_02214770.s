.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.
.extern data_020c9670
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern Actor_QueryTerrainCell
.extern func_0204cfa4
.extern func_0204cff4
.extern func_020ae024
.extern func_ov075_02214898

.global func_ov075_02214770
func_ov075_02214770:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x20
    mov r5, r0
    add r0, r5, #0x78
    bl VecFx32Object_Assign
    add r0, sp, #0x10
    add r1, r5, #0x78
    add r2, r5, #0x18
    bl func_ov075_02214898
    ldr r0, [sp, #0x14]
    ldr r1, [sp, #0x18]
    bl func_0204cfa4
    cmp r0, #0x1000
    ble .L_02214874
    ldr r0, [sp, #0x18]
    ldr r1, [sp, #0x14]
    ldr r4, [r5, #0x224]
    bl func_020ae024
    mov r0, r0, asr #0x4
    mov r3, r0, lsl #0x1
    add r0, r3, #0x1
    mov r2, r0, lsl #0x1
    ldr r1, .L_02214894
    mov r0, r3, lsl #0x1
    ldrsh r2, [r1, r2]
    ldrsh r1, [r1, r0]
    add r0, sp, #0xc
    mul r2, r4, r2
    mul r1, r4, r1
    mov r2, r2, asr #0xc
    str r2, [r5, #0x3c]
    mov r1, r1, asr #0xc
    str r1, [r5, #0x40]
    ldr r2, [r5, #0x3c]
    add r1, sp, #0x8
    mov r2, r2, lsl #0x6
    str r2, [sp, #0xc]
    ldr r3, [r5, #0x40]
    mov r2, #0x18000
    mov r3, r3, lsl #0x6
    str r3, [sp, #0x8]
    bl func_0204cff4
    ldr r3, [r5, #0x1c]
    ldr r2, [sp, #0xc]
    ldr r1, [r5, #0x20]
    ldr r0, [sp, #0x8]
    add r3, r3, r2
    add r2, r1, r0
    mov r0, r5
    mov r1, r3, asr #0x10
    mov r2, r2, asr #0x10
    bl Actor_QueryTerrainCell
    mov r1, r0, lsl #0x12
    mov r1, r1, lsr #0x1c
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    cmp r1, #0x8
    beq .L_02214880
    mov r1, #0x0
    str r1, [r5, #0x40]
    add r0, sp, #0x10
    str r1, [r5, #0x3c]
    bl VecFx32Object_Destroy
    mov r0, #0x0
    b .L_0221488c
.L_02214874:
    mov r0, #0x0
    str r0, [r5, #0x40]
    str r0, [r5, #0x3c]
.L_02214880:
    add r0, sp, #0x10
    bl VecFx32Object_Destroy
    mov r0, #0x1
.L_0221488c:
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, pc}
.L_02214894: .word data_020c9670
.size func_ov075_02214770, . - func_ov075_02214770

.text
; Matching fallback for the portable implementation in src/overlays/ov084/overlay084_recovery.c.
.extern VecFx32Object_Init
.extern VecFx32Object_Destroy
.extern VecFx32Object_Assign
.extern VecFx32Triple_Set
.extern VecFx32Triple_Destroy
.extern VecFx32Bezier_Evaluate3D
.extern func_02032370
.extern Actor_RefreshTerrainHeight
.extern func_020befec
.extern func_ov084_02212d28
.extern func_ov084_02213e10
.extern func_ov084_02213e48

.global func_ov084_02213cb0
func_ov084_02213cb0:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x70
    mov r4, r0
    ldrsh r1, [r4, #0xac]
    cmp r1, #0xff
    moveq r0, #0x0
    beq .L_02213e08
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x144]
    blx r1
    mov r2, r0
    mov r0, r4
    add r1, r4, #0xb0
    bl func_02032370
    mov r0, #0x6
    strh r0, [r4, #0xd6]
    ldrsh r1, [r4, #0xae]
    cmp r1, #0x0
    ble .L_02213dd4
    sub r3, r1, #0x1
    add r0, sp, #0x20
    add r1, r4, #0xb0
    add r2, r4, #0x298
    strh r3, [r4, #0xae]
    bl func_ov084_02213e10
    add r0, sp, #0x10
    add r1, sp, #0x20
    mov r2, #0x2000
    bl func_ov084_02213e48
    add r0, sp, #0x60
    add r2, sp, #0x10
    add r1, r4, #0x298
    bl func_ov084_02212d28
    add r0, sp, #0x10
    bl VecFx32Object_Destroy
    add r0, sp, #0x20
    bl VecFx32Object_Destroy
    ldr r0, [sp, #0x6c]
    add r5, sp, #0x30
    add r0, r0, #0x18000
    str r0, [sp, #0x6c]
    mov r0, r5
    bl VecFx32Object_Init
    add r0, sp, #0x40
    bl VecFx32Object_Init
    add r0, r5, #0x20
    bl VecFx32Object_Init
    mov r0, r5
    add r1, r4, #0x298
    add r2, r4, #0xb0
    add r3, sp, #0x60
    bl VecFx32Triple_Set
    add r0, r4, #0x200
    ldrh r1, [r0, #0xaa]
    ldrsh r0, [r4, #0xae]
    sub r0, r1, r0
    mov r0, r0, lsl #0xc
    bl func_020befec
    mov r2, r0
    add r0, sp, #0x0
    mov r1, r5
    bl VecFx32Bezier_Evaluate3D
    add r0, r4, #0x18
    add r1, sp, #0x0
    bl VecFx32Object_Assign
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
    mov r0, r5
    bl VecFx32Triple_Destroy
    add r0, sp, #0x60
    bl VecFx32Object_Destroy
    mov r0, #0x1
    b .L_02213e08
.L_02213dd4:
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x40]
    blx r1
    ldr r1, [r4, #0x260]
    add r0, r4, #0x18
    bic r2, r1, #0x20
    add r1, r4, #0xb0
    str r2, [r4, #0x260]
    bl VecFx32Object_Assign
    mov r0, r4
    bl Actor_RefreshTerrainHeight
    mov r0, #0x2
.L_02213e08:
    add sp, sp, #0x70
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov084_02213cb0, . - func_ov084_02213cb0

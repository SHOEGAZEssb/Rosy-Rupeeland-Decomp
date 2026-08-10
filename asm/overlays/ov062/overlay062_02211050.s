.text
; Matching fallback for the portable implementation in src/overlays/ov062/overlay062_recovery.c.
.extern Scene_ClearFlags03
.extern Scene_Destroy
.extern data_021052fc
.extern data_ov062_02211c14
.extern func_02002290
.extern func_020022dc
.extern func_02005058
.extern func_020050a4
.extern ActorDerivedType1_ResetToBaseState
.extern Type7Actor_LeaveSpecialPresentationState
.extern func_020597fc
.extern func_02073ef8
.extern func_ov062_0220fd20
.extern gSoundContext

.global func_ov062_02211050
func_ov062_02211050:
    stmdb sp!, {r4, lr}
    ldr r1, .L_022111dc
    mov r4, r0
    str r1, [r4, #0x0]
    bl Scene_ClearFlags03
    ldr r0, .L_022111e0
    mov r1, #0x1b8
    ldr r0, [r0, #0x0]
    bl func_020597fc
    ldr r0, [r4, #0x64]
    bl func_02073ef8
    ldr r0, [r4, #0x6c]
    bl func_02073ef8
    ldr r0, [r4, #0x5c]
    cmp r0, #0x0
    beq .L_0221109c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0221109c:
    ldr r0, [r4, #0x60]
    cmp r0, #0x0
    beq .L_022110b4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_022110b4:
    ldr r0, [r4, #0x68]
    cmp r0, #0x0
    beq .L_022110cc
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_022110cc:
    ldr r2, [r4, #0x58]
    add r1, r4, #0x24
    ldr r0, [r2, #0x14]
    bic r0, r0, #0x2
    str r0, [r2, #0x14]
    ldr r0, [r4, #0x58]
    add r0, r0, #0x18
    bl func_020050a4
    ldr r0, [r4, #0x58]
    add r1, r4, #0x24
    add r0, r0, #0x28
    bl func_020050a4
    ldr r2, [r4, #0x58]
    mov r1, #0x1
    ldr r0, [r2, #0x230]
    orr r0, r0, #0x4
    str r0, [r2, #0x230]
    ldr r0, [r4, #0x58]
    ldr r2, [r0, #0x0]
    ldr r2, [r2, #0x54]
    blx r2
    ldr r1, [r4, #0x58]
    ldr r0, [r1, #0x230]
    bic r0, r0, #0x100
    str r0, [r1, #0x230]
    ldr r0, [r4, #0x58]
    bl ActorDerivedType1_ResetToBaseState
    ldr r0, [r4, #0x58]
    mov r1, #0x0
    add r0, r0, #0x38
    mov r2, r1
    mov r3, r1
    bl func_ov062_0220fd20
    ldr r0, [r4, #0x58]
    mov r1, #0x0
    add r0, r0, #0x88
    mov r2, r1
    mov r3, r1
    bl func_ov062_0220fd20
    ldr r0, [r4, #0x58]
    mov r1, #0x0
    add r0, r0, #0x98
    mov r2, r1
    mov r3, r1
    bl func_ov062_0220fd20
    ldr r0, .L_022111e4
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea8]
    cmp r0, #0x0
    beq .L_0221119c
    bl Type7Actor_LeaveSpecialPresentationState
.L_0221119c:
    ldr r0, [r4, #0x78]
    cmp r0, #0x0
    beq .L_022111b4
    bl func_020022dc
    mov r1, #0x2
    bl func_02002290
.L_022111b4:
    add r0, r4, #0x44
    bl func_02005058
    add r0, r4, #0x34
    bl func_02005058
    add r0, r4, #0x24
    bl func_02005058
    mov r0, r4
    bl Scene_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_022111dc: .word data_ov062_02211c14
.L_022111e0: .word gSoundContext
.L_022111e4: .word data_021052fc
.size func_ov062_02211050, . - func_ov062_02211050

.text
; Matching fallback for the portable implementation in src/overlays/ov064/overlay064_recovery.c.
.extern DebugText_BeginFrame
.extern Heap_Alloc
.extern Sound_Play
.extern data_021052fc
.extern data_ov064_02211ecc
.extern data_ov064_02211ed4
.extern func_02005030
.extern func_02005058
.extern func_020050a4
.extern GraphicsSpriteState_SetDepthOrderedWorldPosition
.extern VecFx32Bezier_Evaluate3D
.extern func_02009d78
.extern func_02010c00
.extern func_0201ded4
.extern func_02022cb0
.extern Actor_RefreshTerrainHeight
.extern func_0204fb64
.extern func_0205557c
.extern func_02072b68
.extern func_020befec
.extern func_ov064_0221102c
.extern func_ov064_02211098
.extern func_ov064_022110d0
.extern func_ov064_02211b4c
.extern gHeapContext
.extern gLupyContext
.extern gSoundContext

.global func_ov064_02210c5c
func_ov064_02210c5c:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x68
    mov r6, r0
    bl DebugText_BeginFrame
    ldr r1, .L_0221100c
    ldr r2, [r6, #0x8]
    ldr r0, [r1, #0x0]
    cmp r2, #0x4
    add r0, r0, #0x2000
    ldr r4, [r0, #0xea4]
    addls pc, pc, r2, lsl #0x2
    b .L_02210ff8
.L_02210c8c:
    b .L_02210ca0
    b .L_02210ce8
    b .L_02210d28
    b .L_02210ec4
    b .L_02210fd0
.L_02210ca0:
    add r0, r2, #0x1
    str r0, [r6, #0x8]
    ldr r0, [r1, #0x0]
    ldr r3, .L_02211010
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    mov r1, #0x0
    ldr r4, [r0, #0x54]
    mov r2, #0x56
    ldrh r0, [r4, #0x24]
    orr r0, r0, #0x4
    strh r0, [r4, #0x24]
    ldr r4, [r6, #0x30]
    ldrh r0, [r4, #0x24]
    bic r0, r0, #0x4
    strh r0, [r4, #0x24]
    ldr r0, [r3, #0x0]
    bl Sound_Play
.L_02210ce8:
    ldr r0, [r6, #0x30]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq .L_02210ff8
    ldr r1, [r6, #0x8]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r6, #0x8]
    ldr r2, [r6, #0x30]
    ldrh r1, [r2, #0x24]
    orr r1, r1, #0x4
    strh r1, [r2, #0x24]
    strh r0, [r6, #0x74]
    b .L_02210ff8
.L_02210d28:
    ldrsh r0, [r6, #0x74]
    add r0, r0, #0x1
    strh r0, [r6, #0x74]
    ldrsh r0, [r6, #0x74]
    cmp r0, #0x14
    ble .L_02210ff8
    ldr r1, [r6, #0x8]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r6, #0x8]
    strh r0, [r6, #0x74]
    ldr r0, [r6, #0x30]
    mov r1, #0x1
    bl func_02072b68
    ldr r3, [r6, #0x30]
    add r0, sp, #0x58
    ldrh r2, [r3, #0x24]
    add r1, r4, #0x284
    orr r2, r2, #0x6
    strh r2, [r3, #0x24]
    bl func_02005030
    ldr r2, .L_02211014
    add r0, sp, #0x18
    add r1, r4, #0x18
    bl func_ov064_0221102c
    ldr r2, .L_02211018
    add r0, sp, #0x8
    add r1, sp, #0x58
    bl func_ov064_0221102c
    add r0, sp, #0x48
    add r1, sp, #0x18
    add r2, sp, #0x8
    bl func_ov064_02211098
    add r0, sp, #0x8
    bl func_02005058
    add r0, sp, #0x18
    bl func_02005058
    ldr r1, .L_0221101c
    ldr r3, .L_02211020
    mov r0, #0x30
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_02210de8
    add r2, sp, #0x58
    add r3, sp, #0x48
    add r1, r4, #0x18
    bl func_ov064_022110d0
.L_02210de8:
    str r0, [r6, #0x84]
    ldr r0, .L_02211024
    ldr r1, [r6, #0x80]
    ldr r0, [r0, #0x0]
    rsb r1, r1, #0x0
    mov r2, #0x0
    bl func_02010c00
    add r0, sp, #0x38
    add r1, r4, #0x18
    bl func_02005030
    add r1, sp, #0x58
    add r0, r4, #0x18
    bl func_020050a4
    ldr r1, .L_02211028
    ldr r3, .L_02211020
    mov r0, #0x44
    mov r2, #0x4
    bl Heap_Alloc
    movs r5, r0
    beq .L_02210e78
    ldr r0, .L_0221100c
    ldr r0, [r0, #0x0]
    add r0, r0, #0x3bc
    add r0, r0, #0x2c00
    bl func_02009d78
    mov r1, #0x2000
    str r1, [sp, #0x0]
    sub r1, r1, #0x20c0
    str r1, [sp, #0x4]
    ldr r3, [r6, #0x80]
    mov r1, r0
    mov r0, r5
    mov r2, r4
    rsb r3, r3, #0x0
    bl func_02022cb0
    mov r5, r0
.L_02210e78:
    ldr r0, .L_0221100c
    mov r1, r5
    ldr r0, [r0, #0x0]
    add r0, r0, #0x37c
    add r0, r0, #0x2c00
    bl func_0201ded4
    add r1, sp, #0x58
    mov r0, r6
    bl func_ov064_02211b4c
    add r1, sp, #0x38
    add r0, r4, #0x18
    bl func_020050a4
    add r0, sp, #0x38
    bl func_02005058
    add r0, sp, #0x48
    bl func_02005058
    add r0, sp, #0x58
    bl func_02005058
    b .L_02210ff8
.L_02210ec4:
    ldrsh r0, [r6, #0x74]
    mov r1, #0x3c
    add r0, r0, #0x1
    strh r0, [r6, #0x74]
    ldrsh r0, [r6, #0x74]
    cmp r0, #0x3c
    movgt r0, #0x3c
    strgth r0, [r6, #0x74]
    ldrsh r0, [r6, #0x74]
    mov r0, r0, lsl #0xc
    bl func_020befec
    mov r2, r0
    ldr r1, [r6, #0x84]
    add r0, sp, #0x28
    bl VecFx32Bezier_Evaluate3D
    add r1, sp, #0x28
    add r0, r4, #0x18
    bl func_020050a4
    mov r0, r4
    bl Actor_RefreshTerrainHeight
    ldr r1, [r4, #0x54]
    ldrh r0, [r1, #0x24]
    orr r0, r0, #0x4
    strh r0, [r1, #0x24]
    ldrsh r0, [r6, #0x74]
    tst r0, #0x4
    ldrne r1, [r6, #0x30]
    ldrneh r0, [r1, #0x24]
    orrne r0, r0, #0x4
    strneh r0, [r1, #0x24]
    bne .L_02210f5c
    mov r0, #0x4
    str r0, [sp, #0x0]
    ldr r0, [r6, #0x30]
    ldr r1, [r4, #0x288]
    ldr r2, [r4, #0x28c]
    ldr r3, [r4, #0x290]
    bl GraphicsSpriteState_SetDepthOrderedWorldPosition
.L_02210f5c:
    ldrsh r0, [r6, #0x74]
    cmp r0, #0x3c
    bne .L_02210fc4
    ldr r1, [r6, #0x8]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r6, #0x8]
    strh r0, [r6, #0x74]
    ldr r1, [r6, #0x84]
    add r0, r4, #0x18
    add r1, r1, #0x10
    bl func_020050a4
    ldr r0, [r6, #0x30]
    mov r1, #0x2
    bl func_02072b68
    ldr r2, [r6, #0x30]
    mov r0, #0x4
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x3
    strh r1, [r2, #0x24]
    str r0, [sp, #0x0]
    ldr r0, [r6, #0x30]
    ldr r1, [r4, #0x288]
    ldr r2, [r4, #0x28c]
    ldr r3, [r4, #0x290]
    bl GraphicsSpriteState_SetDepthOrderedWorldPosition
.L_02210fc4:
    add r0, sp, #0x28
    bl func_02005058
    b .L_02210ff8
.L_02210fd0:
    ldr r0, [r6, #0x30]
    ldrh r0, [r0, #0x24]
    and r0, r0, #0x1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq .L_02210ff8
    bl func_0204fb64
    bl func_0205557c
    mov r0, #0x1
    b .L_02211004
.L_02210ff8:
    bl func_0204fb64
    bl func_0205557c
    mov r0, #0x0
.L_02211004:
    add sp, sp, #0x68
    ldmia sp!, {r4, r5, r6, pc}
.L_0221100c: .word data_021052fc
.L_02211010: .word gSoundContext
.L_02211014: .word 0x4cd
.L_02211018: .word 0xb33
.L_0221101c: .word data_ov064_02211ed4
.L_02211020: .word gHeapContext
.L_02211024: .word gLupyContext
.L_02211028: .word data_ov064_02211ecc
.size func_ov064_02210c5c, . - func_ov064_02210c5c

.text
; Matching fallback for the portable implementation in src/overlays/ov074/overlay074_recovery.c.
.extern data_021052fc
.extern func_02005058
.extern SplineMover_Update
.extern SplineMover_Evaluate2D
.extern func_02007f0c
.extern func_0200ecbc
.extern func_020122a0
.extern ActorCollection_DispatchEventToActors
.extern ActorDerivedType1_GetSingletonObject
.extern func_ov074_022107f8
.extern func_ov088_0221aaac

.global func_ov074_02210730
func_ov074_02210730:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    mov r4, r0
    add r0, sp, #0x0
    bl SplineMover_Evaluate2D
    ldr r0, .L_022107f4
    add r1, sp, #0x0
    ldr r0, [r0, #0x0]
    add r0, r0, #0x24
    bl func_0200ecbc
    ldr r0, .L_022107f4
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    bl func_02007f0c
    add r1, sp, #0x0
    bl ActorCollection_DispatchEventToActors
    bl ActorDerivedType1_GetSingletonObject
    cmp r0, #0x0
    beq .L_022107a4
    bl ActorDerivedType1_GetSingletonObject
    add r0, r0, #0x200
    ldrsh r0, [r0, #0x30]
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    cmp r0, #0x0
    beq .L_022107a4
    bl ActorDerivedType1_GetSingletonObject
    bl func_ov088_0221aaac
.L_022107a4:
    ldr r0, [r4, #0x124]
    cmp r0, #0x0
    beq .L_022107cc
    add r0, r4, #0xc8
    bl SplineMover_Update
    cmp r0, #0x0
    beq .L_022107cc
    mov r0, r4
    add r1, r4, #0xc8
    bl func_ov074_022107f8
.L_022107cc:
    ldr r0, .L_022107f4
    mov r1, #0x1
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xfb8]
    bl func_020122a0
    add r0, sp, #0x0
    bl func_02005058
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
.L_022107f4: .word data_021052fc
.size func_ov074_02210730, . - func_ov074_02210730

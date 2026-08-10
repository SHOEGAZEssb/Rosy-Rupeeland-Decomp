; Matching retail form; see src/game/game_phase_script_vm_effect_spawn_opcode.c.
.text
.extern Heap_Alloc
.extern data_020d5b2c
.extern data_021052fc
.extern func_0200222c
.extern func_020022dc
.extern func_0200500c
.extern func_02005058
.extern func_02012704
.extern ActorCollection_FindActorByDescriptorValue
.extern Actor_GetCollection
.extern func_ov062_0220fe78
.extern func_ov062_02210674
.extern gHeapContext

    .global func_02013f10
func_02013f10: ; 0x02013f10
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, r10, lr}
    sub sp, sp, #0x1c
    mov r10, r0
    bl func_02012704
    mov r9, r0
    mov r0, r10
    bl func_02012704
    mov r8, r0
    mov r0, r10
    bl func_02012704
    mov r7, r0
    mov r0, r10
    bl func_02012704
    mov r6, r0
    mov r0, r10
    bl func_02012704
    mov r5, r0
    mov r0, r10
    bl func_02012704
    mov r4, r0
    mvn r0, #0x0
    cmp r4, r0
    bne L_02013f8c
    ldr r0, [r10, #0x84]
    mov r1, r5, lsl #0x4
    str r1, [r0, #0x44]
    ldr r1, [r10, #0x84]
    ldr r0, [r1, #0x10]
    orr r0, r0, #0x400
    str r0, [r1, #0x10]
    b L_02014080
L_02013f8c:
    add r0, sp, #0xc
    mov r1, r5, lsl #0xc
    mov r2, r6, lsl #0xc
    mov r3, r7, lsl #0xc
    bl func_0200500c
    cmp r4, #0x0
    bne L_0201400c
    bl func_020022dc
    ldr r2, L_0201408c
    mov r1, #0x2
    bl func_0200222c
    ldr r1, L_02014090
    ldr r3, L_02014094
    mov r0, #0x48
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_02014078
    ldr r1, L_02014098
    mov r2, #0x0
    str r2, [sp, #0x0]
    ldr r2, [r1, #0x0]
    add r1, sp, #0xc
    add r2, r2, #0x2000
    ldr r4, [r2, #0xea4]
    mov r2, r9
    str r4, [sp, #0x4]
    mov r4, #0x1
    mov r3, r8
    str r4, [sp, #0x8]
    bl func_ov062_0220fe78
    b L_02014078
L_0201400c:
    ldr r0, [r10, #0x84]
    bl Actor_GetCollection
    mov r1, r4
    bl ActorCollection_FindActorByDescriptorValue
    mov r5, r0
    bl func_020022dc
    mov r1, #0x2
    ldr r2, L_0201408c
    bl func_0200222c
    mov r0, #0x40
    ldr r1, L_02014090
    mov r2, #0x4
    ldr r3, L_02014094
    bl Heap_Alloc
    cmp r0, #0x0
    beq L_0201406c
    str r8, [sp, #0x0]
    mov r4, #0x0
    str r4, [sp, #0x4]
    add r2, sp, #0xc
    mov r1, r5
    mov r3, r9
    str r4, [sp, #0x8]
    bl func_ov062_02210674
L_0201406c:
    ldr r0, [r5, #0x10]
    orr r0, r0, #0x400
    str r0, [r5, #0x10]
L_02014078:
    add r0, sp, #0xc
    bl func_02005058
L_02014080:
    mov r0, #0x0
    add sp, sp, #0x1c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, r10, pc}
L_0201408c: .word 0x3e
L_02014090: .word data_020d5b2c
L_02014094: .word gHeapContext
L_02014098: .word data_021052fc
    .size func_02013f10, . - func_02013f10


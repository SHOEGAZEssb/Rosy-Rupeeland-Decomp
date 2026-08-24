.text
; Matching fallback for the portable implementation in src/overlays/ov089/overlay089_recovery.c.
.extern Heap_Alloc
.extern gGamePhaseRuntime
.extern data_ov089_022199ec
.extern ActorCollection_GetSpriteGroup
.extern Actor_GetOwningCollection
.extern func_ov089_02217b04
.extern gHeapContext

.global func_ov089_022179dc
func_ov089_022179dc:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x8
    ldr r1, .L_02217af4
    mov r4, r0
    ldr r3, .L_02217af8
    mov r0, #0x1c
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    movne r1, #0x0
    strne r1, [r0, #0x0]
    strne r1, [r0, #0x4]
    str r0, [r4, #0x240]
    mov r0, r4
    bl Actor_GetOwningCollection
    bl ActorCollection_GetSpriteGroup
    ldr r1, .L_02217afc
    str r0, [sp, #0x0]
    mov r0, #0x2
    str r0, [sp, #0x4]
    ldr r0, [r4, #0x240]
    sub r2, r1, #0x18
    add r3, r1, #0x1
    bl func_ov089_02217b04
    ldr r0, [r4, #0x240]
    mvn r1, #0xc7
    strh r1, [r0, #0x18]
    ldr r1, [r4, #0x240]
    add r0, r4, #0x200
    ldr r2, [r1, #0x4]
    ldrh r1, [r2, #0x24]
    bic r1, r1, #0x2
    strh r1, [r2, #0x24]
    ldrh r0, [r0, #0xc]
    tst r0, #0x800
    beq .L_02217aec
    ldr r0, .L_02217b00
    ldr r1, .L_02217af4
    ldr r0, [r0, #0x0]
    ldr r3, .L_02217af8
    add r0, r0, #0x2000
    ldr r2, [r0, #0xea8]
    mov r0, #0x1c
    ldr ip, [r2, #0x29c]
    mov r2, #0x4
    ldrh r5, [ip, #0x14]
    ldrh r6, [ip, #0x16]
    ldrh r7, [ip, #0x18]
    bl Heap_Alloc
    cmp r0, #0x0
    movne r1, #0x0
    strne r1, [r0, #0x0]
    strne r1, [r0, #0x4]
    str r0, [r4, #0x244]
    mov r0, r4
    bl Actor_GetOwningCollection
    bl ActorCollection_GetSpriteGroup
    str r0, [sp, #0x0]
    mov r0, #0x2
    str r0, [sp, #0x4]
    ldr r0, [r4, #0x244]
    mov r1, r5
    mov r2, r6
    mov r3, r7
    bl func_ov089_02217b04
    ldr r0, [r4, #0x244]
    mvn r1, #0xc7
    strh r1, [r0, #0x18]
.L_02217aec:
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_02217af4: .word data_ov089_022199ec
.L_02217af8: .word gHeapContext
.L_02217afc: .word 0x1019
.L_02217b00: .word gGamePhaseRuntime
.size func_ov089_022179dc, . - func_ov089_022179dc

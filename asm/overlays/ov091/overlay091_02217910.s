.text
; Matching fallback for the portable implementation in src/overlays/ov091/overlay091_recovery.c.
.extern Heap_Alloc
.extern data_ov091_02218dc0
.extern func_02005580
.extern func_02005c3c
.extern ActorCollection_GetSpriteOwner
.extern Actor_GetCollection
.extern func_0204d3d8
.extern gHeapContext

.global func_ov091_02217910
func_ov091_02217910:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0xc
    mov r4, r0
    bl func_0204d3d8
    ldr r1, .L_02217994
    ldr r3, .L_02217998
    mov r0, #0x10
    mov r2, #0x4
    bl Heap_Alloc
    cmp r0, #0x0
    beq .L_0221794c
    ldr r1, .L_0221799c
    add r2, r1, #0x1
    add r3, r1, #0x2
    bl func_02005580
.L_0221794c:
    str r0, [r4, #0x234]
    mov r0, r4
    bl Actor_GetCollection
    bl ActorCollection_GetSpriteOwner
    mov r2, #0x0
    str r2, [sp, #0x0]
    mov r1, #0x6
    stmib sp, {r1, r2}
    ldr r1, [r4, #0x234]
    mov r3, r2
    bl func_02005c3c
    str r0, [r4, #0x238]
    mov r1, #0x7d
    strh r1, [r0, #0x2c]
    mov r1, #0x9a
    strh r1, [r0, #0x2e]
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, pc}
.L_02217994: .word data_ov091_02218dc0
.L_02217998: .word gHeapContext
.L_0221799c: .word 0x137b
.size func_ov091_02217910, . - func_ov091_02217910

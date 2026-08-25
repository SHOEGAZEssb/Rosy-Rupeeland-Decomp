.text
; Matching fallback for the portable implementation in src/overlays/ov092/overlay092_recovery.c.
.extern GameWork_ClearFlag
.extern GameWork_SetFlag
.extern Heap_Free
.extern __destroy_arr
.extern data_ov092_0221c728
.extern RuntimeActorScriptVariantSubclass_DestroyAlternateEntry
.extern func_ov092_0221792c
.extern gGameWork

.global func_ov092_02217d40
func_ov092_02217d40:
    stmdb sp!, {r4, lr}
    ldr r1, .L_02217dcc
    mov r4, r0
    ldr r0, .L_02217dd0
    str r1, [r4, #0x0]
    ldr r0, [r0, #0x0]
    mov r1, #0x3ec
    bl GameWork_SetFlag
    ldr r0, .L_02217dd0
    ldr r1, .L_02217dd4
    ldr r0, [r0, #0x0]
    bl GameWork_ClearFlag
    ldr r0, [r4, #0x244]
    cmp r0, #0x0
    beq .L_02217d88
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02217d88:
    ldr r0, [r4, #0x24c]
    cmp r0, #0x0
    beq .L_02217da0
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_02217da0:
    ldr r3, .L_02217dd8
    add r0, r4, #0x1f0
    mov r1, #0x5
    mov r2, #0xc
    bl __destroy_arr
    mov r0, r4
    bl RuntimeActorScriptVariantSubclass_DestroyAlternateEntry
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02217dcc: .word data_ov092_0221c728
.L_02217dd0: .word gGameWork
.L_02217dd4: .word 0x3f5
.L_02217dd8: .word func_ov092_0221792c
.size func_ov092_02217d40, . - func_ov092_02217d40

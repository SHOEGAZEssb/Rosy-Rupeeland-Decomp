.text
; Matching fallback for the portable implementation in src/overlays/ov092/overlay092_recovery.c.
.extern data_ov092_0221c8c4
.extern TrackedResourceActorType21_InitBase
.extern func_ov092_02218380
.extern gGameWork

.global func_ov092_0221a838
func_ov092_0221a838:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl TrackedResourceActorType21_InitBase
    mov r1, #0x0
    ldr r2, .L_0221a8b4
    sub r0, r1, #0x1
    str r2, [r4, #0x0]
    str r1, [r4, #0x200]
    str r1, [r4, #0x204]
    str r1, [r4, #0x208]
    str r0, [r4, #0x20c]
    mov r0, #0xc
    str r1, [r4, #0x210]
    sub r2, r1, #0xc
    strh r2, [r4, #0x60]
    strh r2, [r4, #0x62]
    strh r0, [r4, #0x64]
    strh r0, [r4, #0x66]
    sub r0, r0, #0xe
    strb r0, [r4, #0x8]
    strb r0, [r4, #0x9]
    mov r2, #0x2
    strb r2, [r4, #0xa]
    ldr r0, .L_0221a8b8
    strb r2, [r4, #0xb]
    ldr r0, [r0, #0x0]
    mov r2, #0x4
    bl func_ov092_02218380
    str r0, [r4, #0x214]
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0221a8b4: .word data_ov092_0221c8c4
.L_0221a8b8: .word gGameWork
.size func_ov092_0221a838, . - func_ov092_0221a838

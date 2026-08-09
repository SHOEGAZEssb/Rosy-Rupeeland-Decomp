.text
; Matching fallback for the portable implementation in src/overlays/ov092/overlay092_recovery.c.
.extern data_021052fc
.extern func_ov092_02218394
.extern func_ov092_0221893c
.extern gGameWork

.global func_ov092_022183d4
func_ov092_022183d4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x200
    ldr r2, .L_02218430
    mov r1, #0x0
    ldrsh r3, [r0, #0x84]
    ldr r0, [r2, #0x0]
    mov r2, r1
    bl func_ov092_02218394
    ldr r0, .L_02218434
    ldr r0, [r0, #0x0]
    add r0, r0, #0x2000
    ldr r0, [r0, #0xea4]
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x1c]
    blx r1
    mov r0, r4
    bl func_ov092_0221893c
    mov r0, r4
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x1c]
    blx r1
    ldmia sp!, {r4, pc}
.L_02218430: .word gGameWork
.L_02218434: .word data_021052fc
.size func_ov092_022183d4, . - func_ov092_022183d4

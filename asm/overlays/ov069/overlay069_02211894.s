.text
; Matching fallback for the portable implementation in src/overlays/ov069/overlay069_recovery.c.
.extern data_ov069_022127d0
.extern func_02004fe0
.extern func_0209a208
.extern func_ov069_02211854

.global func_ov069_02211894
func_ov069_02211894:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r4, r0
    mov r6, r1
    mov r5, r2
    bl func_ov069_02211854
    ldr r1, .L_02211930
    add r0, r4, #0x50
    str r1, [r4, #0x0]
    bl func_02004fe0
    ldr r1, .L_02211934
    str r6, [r4, #0x4c]
    str r5, [sp, #0x0]
    mov r2, #0x2
    mov r0, r4
    str r2, [sp, #0x4]
    sub r2, r1, #0x7
    add r3, r1, #0x1
    bl func_0209a208
    str r0, [r4, #0x48]
    mov r0, #0x0
    str r0, [sp, #0x0]
    str r0, [sp, #0x4]
    mov r0, r4
    ldr r1, [r4, #0x48]
    ldr r2, .L_02211938
    mov r3, #0x280000
    ldr ip, [r0, #0x0]
    ldr ip, [ip, #0x0]
    blx ip
    mov r2, #0xa
    ldr r1, [r4, #0x48]
    mov r0, #0x0
    str r2, [r1, #0x44]
    str r0, [r4, #0x60]
    str r0, [r4, #0x64]
    mov r0, r4
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
.L_02211930: .word data_ov069_022127d0
.L_02211934: .word 0x1132
.L_02211938: .word 0x1d6000
.size func_ov069_02211894, . - func_ov069_02211894

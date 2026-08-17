.text
.extern func_0205940c
.extern Sound_StopDirectSequence
.extern gSoundContext
.global func_ov042_02200b38
func_ov042_02200b38:
    stmdb sp!, {r3, lr}
    ldr r0, .L_02200bb8
    ldr r1, .L_02200bbc
    ldr r0, [r0, #0x0]
    mov r2, #0x7
    bl func_0205940c
    ldr r0, .L_02200bb8
    mov r1, #0xa4
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl Sound_StopDirectSequence
    ldr r0, .L_02200bb8
    mov r1, #0xa5
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl Sound_StopDirectSequence
    ldr r0, .L_02200bb8
    mov r1, #0xcd
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl Sound_StopDirectSequence
    ldr r0, .L_02200bb8
    mov r1, #0xea
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl Sound_StopDirectSequence
    ldr r0, .L_02200bb8
    mov r1, #0xf0
    ldr r0, [r0, #0x0]
    mov r2, #0x0
    bl Sound_StopDirectSequence
    ldmia sp!, {r3, pc}
.L_02200bb8: .word gSoundContext
.L_02200bbc: .word 0x1d7
.size func_ov042_02200b38, . - func_ov042_02200b38

.text
; Matching fallback for the portable implementation in src/overlays/ov056/overlay056_recovery.c.
.extern GameFile_Read
.extern GameFile_Seek
.extern MI_UncompressLZ8

.global func_ov056_0220f58c
func_ov056_0220f58c:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x390
    sub sp, sp, #0x1000
    mov r4, r2
    mov r1, r1, lsl #0x3
    mov r5, r0
    mov r0, r4
    add r1, r1, #0x4
    mov r2, #0x0
    mov r6, r3
    bl GameFile_Seek
    add r1, sp, #0x4
    mov r0, r4
    mov r2, #0x4
    bl GameFile_Read
    add r1, sp, #0x0
    mov r0, r4
    mov r2, #0x4
    bl GameFile_Read
    add r1, sp, #0x1300
    add r1, r1, #0x90
    ldr r1, [r1, #0x10]
    ldr r3, [sp, #0x4]
    mul r1, r6, r1
    mov r1, r1, lsl #0x3
    add r1, r1, #0x4
    mov r0, r4
    mov r2, #0x0
    add r1, r3, r1
    bl GameFile_Seek
    ldr r2, [sp, #0x0]
    mov r0, r4
    add r1, sp, #0x8
    bl GameFile_Read
    mov r1, r5
    add r0, sp, #0x8
    bl MI_UncompressLZ8
    add sp, sp, #0x390
    add sp, sp, #0x1000
    ldmia sp!, {r4, r5, r6, pc}
.size func_ov056_0220f58c, . - func_ov056_0220f58c

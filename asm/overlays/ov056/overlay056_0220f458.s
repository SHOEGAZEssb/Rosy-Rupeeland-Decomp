.text
; Matching fallback for the portable implementation in src/overlays/ov056/overlay056_recovery.c.
.extern GameFile_Read
.extern GameFile_Rewind
.extern MIi_CpuClear32

.global func_ov056_0220f458
func_ov056_0220f458:
    stmdb sp!, {r4, lr}
    mov r4, r0
    str r1, [r4, #0x0]
    mov r0, #0x0
    stmib r4, {r0, r2, r3}
    add r1, r4, #0x10
    mov r2, #0x800
    bl MIi_CpuClear32
    ldr r0, [r4, #0x0]
    bl GameFile_Rewind
    add r1, r4, #0x14
    ldr r0, [r4, #0x0]
    add r1, r1, #0x800
    mov r2, #0x2
    bl GameFile_Read
    add r0, r4, #0x16
    add r1, r0, #0x800
    ldr r0, [r4, #0x0]
    mov r2, #0x2
    bl GameFile_Read
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov056_0220f458, . - func_ov056_0220f458

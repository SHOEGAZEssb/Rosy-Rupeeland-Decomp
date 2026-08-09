.text
; Matching fallback for the portable implementation in src/overlays/ov070/overlay070_recovery.c.
.extern __destroy_arr
.extern func_02005058
.extern func_02099fb0
.extern func_ov070_02210234

.global func_ov070_02210238
func_ov070_02210238:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r3, .L_02210288
    add r0, r4, #0x148
    mov r1, #0x10
    mov r2, #0xc
    bl __destroy_arr
    ldr r3, .L_02210288
    add r0, r4, #0xd0
    mov r1, #0x2
    mov r2, #0xc
    bl __destroy_arr
    add r0, r4, #0x5c
    bl func_02005058
    add r0, r4, #0x4c
    bl func_02005058
    mov r0, r4
    bl func_02099fb0
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_02210288: .word func_ov070_02210234
.size func_ov070_02210238, . - func_ov070_02210238

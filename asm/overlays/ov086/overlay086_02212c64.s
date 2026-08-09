.text
; Matching fallback for the portable implementation in src/overlays/ov086/overlay086_recovery.c.

.global func_ov086_02212c64
func_ov086_02212c64:
    stmdb sp!, {r3, lr}
    ldr r3, [r0, #0x0]
    mov r2, #0x0
    ldr r3, [r3, #0x108]
    blx r3
    ldmia sp!, {r3, pc}
.size func_ov086_02212c64, . - func_ov086_02212c64

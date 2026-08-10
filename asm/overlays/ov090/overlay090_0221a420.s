.text
; Matching fallback for the portable implementation in src/overlays/ov090/overlay090_recovery.c.
.extern VecFx32Object_Destroy
.extern func_ov090_0221a460

.global func_ov090_0221a420
func_ov090_0221a420:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    mov r4, r1
    mov r5, r0
    add r0, sp, #0x0
    add r1, r4, #0x18
    add r2, r4, #0x2a4
    bl func_ov090_0221a460
    add r1, sp, #0x0
    mov r0, r5
    add r2, r4, #0x2b4
    bl func_ov090_0221a460
    add r0, sp, #0x0
    bl VecFx32Object_Destroy
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
.size func_ov090_0221a420, . - func_ov090_0221a420

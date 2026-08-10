.text
; Matching fallback for the portable implementation in src/overlays/ov089/overlay089_recovery.c.
.extern VecFx32Object_InitCopy

.global func_ov089_02219550
func_ov089_02219550:
    ldr ip, .L_0221955c
    add r1, r1, #0x18
    bx ip
.L_0221955c: .word VecFx32Object_InitCopy
.size func_ov089_02219550, . - func_ov089_02219550

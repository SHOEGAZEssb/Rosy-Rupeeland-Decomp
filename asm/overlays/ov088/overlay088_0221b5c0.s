.text
; Matching fallback for the portable implementation in src/overlays/ov088/overlay088_recovery.c.
.extern VecFx32Object_InitCopy

.global func_ov088_0221b5c0
func_ov088_0221b5c0:
    ldr ip, .L_0221b5cc
    add r1, r1, #0x18
    bx ip
.L_0221b5cc: .word VecFx32Object_InitCopy
.size func_ov088_0221b5c0, . - func_ov088_0221b5c0

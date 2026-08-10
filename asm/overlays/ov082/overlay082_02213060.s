.text
; Matching fallback for the portable implementation in src/overlays/ov082/overlay082_recovery.c.
.extern VecFx32Object_InitCopy

.global func_ov082_02213060
func_ov082_02213060:
    ldr ip, .L_0221306c
    add r1, r1, #0x18
    bx ip
.L_0221306c: .word VecFx32Object_InitCopy
.size func_ov082_02213060, . - func_ov082_02213060

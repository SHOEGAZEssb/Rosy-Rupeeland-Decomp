.text
; Matching fallback for the documented portable implementation in
; src/overlays/ov090/overlay090_title_participant_virtuals.c.
.extern VecFx32Object_InitCopy

.global func_ov090_0221b8d8
func_ov090_0221b8d8:
    ldr ip, .L_0221b8e4
    add r1, r1, #0x18
    bx ip
.L_0221b8e4: .word VecFx32Object_InitCopy
.size func_ov090_0221b8d8, . - func_ov090_0221b8d8

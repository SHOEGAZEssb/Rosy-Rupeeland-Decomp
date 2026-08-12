.text
; Matching fallback for the documented portable implementation in
; src/overlays/ov090/overlay090_title_effect_small_helpers.c.
.extern func_ov090_0221b97c
.extern func_ov090_0221bc5c

.global func_ov090_0221ca34
func_ov090_0221ca34:
    stmdb sp!, {r3, lr}
    cmp r1, #0x0
    ldr r0, [r0, #0x4]
    mov r1, #0x10
    beq .L_0221ca50
    bl func_ov090_0221bc5c
    ldmia sp!, {r3, pc}
.L_0221ca50:
    bl func_ov090_0221b97c
    ldmia sp!, {r3, pc}
.size func_ov090_0221ca34, . - func_ov090_0221ca34

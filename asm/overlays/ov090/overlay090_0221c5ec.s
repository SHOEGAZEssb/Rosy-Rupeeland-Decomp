.text
; Matching fallback for the documented portable implementation in
; src/overlays/ov090/overlay090_title_effect_lifecycle.c.
.extern data_ov090_0221ccc8

.global func_ov090_0221c5ec
func_ov090_0221c5ec:
    stmdb sp!, {r4, lr}
    ldr r1, .L_0221c634
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq .L_0221c614
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0221c614:
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    beq .L_0221c62c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0221c62c:
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0221c634: .word data_ov090_0221ccc8
.size func_ov090_0221c5ec, . - func_ov090_0221c5ec

.text
; Matching fallback for the documented portable implementation in
; src/overlays/ov090/overlay090_title_event_callback_a738.c.

.global func_ov090_0221a738
func_ov090_0221a738:
    stmdb sp!, {r3, lr}
    ldrb r2, [r0, #0x1ec]
    cmp r2, #0xb
    movne r0, #0x0
    ldmneia sp!, {r3, pc}
    ldrb r2, [r0, #0x247]
    cmp r2, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, pc}
    ldr r1, [r1, #0x1f8]
    ldrsh r1, [r1, #0x0]
    cmp r1, #0x78
    bne .L_0221a77c
    ldr r2, [r0, #0x0]
    mov r1, #0x96
    ldr r2, [r2, #0xc4]
    blx r2
.L_0221a77c:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.size func_ov090_0221a738, . - func_ov090_0221a738

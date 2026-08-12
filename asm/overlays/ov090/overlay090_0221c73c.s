.text
; Matching fallback for the documented portable implementation in
; src/overlays/ov090/overlay090_title_effect_forwarders.c.
.extern func_ov090_0221c780

.global func_ov090_0221c73c
func_ov090_0221c73c:
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x10
    mov lr, r1
    ldr ip, [lr, #0x4]
    ldr r1, [sp, #0x18]
    str r3, [sp, #0x0]
    str r1, [sp, #0x4]
    ldrb r1, [ip, #0x3a]
    mov r3, r2
    str r1, [sp, #0x8]
    ldrsh r1, [ip, #0x28]
    str r1, [sp, #0xc]
    ldr r1, [lr, #0x18]
    ldr r2, [lr, #0x1c]
    bl func_ov090_0221c780
    add sp, sp, #0x10
    ldmia sp!, {r3, pc}
.size func_ov090_0221c73c, . - func_ov090_0221c73c

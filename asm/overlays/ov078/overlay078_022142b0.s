.text
; Matching fallback for the portable implementation in src/overlays/ov078/overlay078_recovery.c.
.extern ActorExtendedType2_UpdateFrame

.global func_ov078_022142b0
func_ov078_022142b0:
    add r1, r0, #0x200
    ldrsh r2, [r1, #0xc4]
    ldr ip, .L_022142cc
    cmp r2, #0x0
    subgt r2, r2, #0x1
    strgth r2, [r1, #0xc4]
    bx ip
.L_022142cc: .word ActorExtendedType2_UpdateFrame
.size func_ov078_022142b0, . - func_ov078_022142b0

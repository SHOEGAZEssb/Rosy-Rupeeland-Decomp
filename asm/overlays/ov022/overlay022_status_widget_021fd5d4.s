    .text
/* Exact fallback; see src/overlays/ov022/overlay022_status_widget.c. */
    .extern func_ov022_021fd4d4
    .extern func_ov022_021fd514
    .extern func_ov022_021fd554
    .extern func_ov022_021fd594

.global func_ov022_021fd5d4
func_ov022_021fd5d4:
    stmdb sp!, {r3, lr}
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    ldmia sp!, {r3, pc}
L_021fd5e4: ; jump table
    b L_021fd5f4 ; case 0
    b L_021fd5fc ; case 1
    b L_021fd604 ; case 2
    b L_021fd60c ; case 3
L_021fd5f4:
    bl func_ov022_021fd4d4
    ldmia sp!, {r3, pc}
L_021fd5fc:
    bl func_ov022_021fd554
    ldmia sp!, {r3, pc}
L_021fd604:
    bl func_ov022_021fd594
    ldmia sp!, {r3, pc}
L_021fd60c:
    bl func_ov022_021fd514
    ldmia sp!, {r3, pc}
.size func_ov022_021fd5d4, . - func_ov022_021fd5d4

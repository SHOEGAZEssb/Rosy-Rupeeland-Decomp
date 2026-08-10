.text
; Matching fallback for the portable implementation in src/overlays/ov090/overlay090_recovery.c.
.extern Heap_Free
.extern data_ov090_0221cc78
.extern func_02003e38
.extern VecFx32Triple_Destroy

.global func_ov090_0221bdd8
func_ov090_0221bdd8:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_0221be3c
    mov r5, r0
    str r1, [r5, #0x0]
    mov r4, #0x0
    b .L_0221be10
.L_0221bdf0:
    ldr r0, [r5, #0x4]
    ldr r0, [r0, r4, lsl #0x2]
    cmp r0, #0x0
    beq .L_0221be0c
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0221be0c:
    add r4, r4, #0x1
.L_0221be10:
    ldrsh r0, [r5, #0x8]
    cmp r4, r0
    blt .L_0221bdf0
    ldr r0, [r5, #0x4]
    bl func_02003e38
    add r0, r5, #0x18
    bl VecFx32Triple_Destroy
    mov r0, r5
    bl Heap_Free
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
.L_0221be3c: .word data_ov090_0221cc78
.size func_ov090_0221bdd8, . - func_ov090_0221bdd8

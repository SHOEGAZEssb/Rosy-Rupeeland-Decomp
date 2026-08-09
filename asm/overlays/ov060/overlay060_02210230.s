.text
; Matching fallback for the portable implementation in src/overlays/ov060/overlay060_recovery.c.
.extern Heap_Free
.extern Scene_Destroy
.extern data_ov060_02210620
.extern func_02002290
.extern func_020022dc
.extern func_0200f52c
.extern func_0200f7bc
.extern func_0200f824
.extern func_ov060_022100b0

.global func_ov060_02210230
func_ov060_02210230:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r1, .L_02210288
    mov r5, r0
    str r1, [r5, #0x0]
    bl func_0200f824
    bl func_0200f52c
    bl func_0200f824
    bl func_0200f7bc
    ldr r4, [r5, #0x24]
    cmp r4, #0x0
    beq .L_0221026c
    mov r0, r4
    bl func_ov060_022100b0
    mov r0, r4
    bl Heap_Free
.L_0221026c:
    bl func_020022dc
    mov r1, #0x2
    bl func_02002290
    mov r0, r5
    bl Scene_Destroy
    mov r0, r5
    ldmia sp!, {r3, r4, r5, pc}
.L_02210288: .word data_ov060_02210620
.size func_ov060_02210230, . - func_ov060_02210230

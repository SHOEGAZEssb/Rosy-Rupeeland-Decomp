; Matching retail form; see src/game/debug_hud_state_runtime.c.
.text
.extern __register_global_object
.extern data_02105458
.extern data_0210545c
.extern data_02105468
.extern func_0200f260
.extern func_0200f314

    .global func_0200f824
func_0200f824: ; 0x0200f824
    stmdb sp!, {r3, lr}
    ldr r0, L_0200f868
    ldr r0, [r0, #0x0]
    tst r0, #0x1
    bne L_0200f860
    ldr r0, L_0200f86c
    bl func_0200f260
    ldr r0, L_0200f86c
    ldr r1, L_0200f870
    ldr r2, L_0200f874
    bl __register_global_object
    ldr r0, L_0200f868
    ldr r1, [r0, #0x0]
    orr r1, r1, #0x1
    str r1, [r0, #0x0]
L_0200f860:
    ldr r0, L_0200f86c
    ldmia sp!, {r3, pc}
L_0200f868: .word data_02105458
L_0200f86c: .word data_02105468
L_0200f870: .word func_0200f314
L_0200f874: .word data_0210545c
    .size func_0200f824, . - func_0200f824


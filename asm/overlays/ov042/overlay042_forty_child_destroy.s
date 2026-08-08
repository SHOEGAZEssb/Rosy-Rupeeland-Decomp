.text
.extern func_02099fb0
    .global func_ov042_0220ab30
func_ov042_0220ab30:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02099fb0
    mov r0, r4
    ldmia sp!, {r4, pc}
    .size func_ov042_0220ab30, . - func_ov042_0220ab30

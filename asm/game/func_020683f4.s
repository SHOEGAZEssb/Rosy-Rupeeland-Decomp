.text
; Matching fallback for the portable implementation in src/game/inventory_cell_lifecycle.c.
.extern func_02071eb8

.global func_020683f4
func_020683f4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_02071eb8
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_020683f4, . - func_020683f4

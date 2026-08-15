.text
; Matching fallback for the portable implementation in src/game/inventory_record_sort.c.
.extern func_02062828

.global func_02062728
func_02062728:
    stmdb sp!, {r4, lr}
    mov r4, r0
    cmp r1, r4
    ldmeqia sp!, {r4, pc}
    bl func_02062828
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_02062728, . - func_02062728

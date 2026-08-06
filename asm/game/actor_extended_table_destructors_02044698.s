; Matching retail form; see src/game/actor_extended_table_destructors.c.
.text
.extern Heap_Free
.extern func_0203e494
.global func_02044698
.type func_02044698, @function
.global func_020446ac
.type func_020446ac, @function
func_02044698: ; 0x02044698
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0203e494
    mov r0, r4
    ldmia sp!, {r4, pc}

.size func_02044698, . - func_02044698
func_020446ac: ; 0x020446ac
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0203e494
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_020446ac, . - func_020446ac

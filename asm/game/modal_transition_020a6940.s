.text
; Matching fallback for the portable implementation in src/game/modal_transition.c.
.extern VecFx32Object_Init
.extern func_020a6964

.global func_020a6940
func_020a6940:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl VecFx32Object_Init
    add r0, r4, #0x10
    bl VecFx32Object_Init
    mov r0, r4
    bl func_020a6964
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_020a6940, . - func_020a6940

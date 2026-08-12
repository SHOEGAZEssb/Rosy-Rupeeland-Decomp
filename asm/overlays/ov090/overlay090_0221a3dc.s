.text
; Matching fallback for the documented portable implementation in
; src/overlays/ov090/overlay090_title_vector_helpers.c.
.extern VecFx32Object_Init
.extern VecFx32Triple_Set

.global func_ov090_0221a3dc
func_ov090_0221a3dc:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    mov r6, r1
    mov r5, r2
    mov r4, r3
    bl VecFx32Object_Init
    add r0, r7, #0x10
    bl VecFx32Object_Init
    add r0, r7, #0x20
    bl VecFx32Object_Init
    mov r1, r6
    mov r2, r5
    mov r3, r4
    mov r0, r7
    bl VecFx32Triple_Set
    mov r0, r7
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.size func_ov090_0221a3dc, . - func_ov090_0221a3dc

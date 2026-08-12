.text
; Matching fallback for the documented portable implementation in
; src/overlays/ov090/overlay090_title_participant_presentation_destructors.c.
.extern data_ov090_0221cc68
.extern VecFx32Object_Destroy

.global func_ov090_0221ba6c
func_ov090_0221ba6c:
    stmdb sp!, {r4, lr}
    ldr r1, .L_0221baa4
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    beq .L_0221ba94
    ldr r1, [r0, #0x0]
    ldr r1, [r1, #0x4]
    blx r1
.L_0221ba94:
    add r0, r4, #0x8
    bl VecFx32Object_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_0221baa4: .word data_ov090_0221cc68
.size func_ov090_0221ba6c, . - func_ov090_0221ba6c

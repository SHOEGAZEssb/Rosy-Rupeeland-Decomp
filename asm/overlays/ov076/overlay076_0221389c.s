.text
; Matching fallback for the portable implementation in src/overlays/ov076/overlay076_recovery.c.
.extern Heap_Free
.extern data_ov076_02214d08
.extern func_02005058
.extern ActorExtendedLinkSource_Destroy
.extern func_02073ef8

.global func_ov076_0221389c
func_ov076_0221389c:
    stmdb sp!, {r4, lr}
    ldr r1, .L_022138e4
    mov r4, r0
    str r1, [r4, #0x0]
    ldr r0, [r4, #0x2a0]
    bl func_02073ef8
    ldr r0, [r4, #0x2a4]
    bl func_02073ef8
    add r0, r4, #0x2b8
    bl func_02005058
    add r0, r4, #0x2a8
    bl func_02005058
    mov r0, r4
    bl ActorExtendedLinkSource_Destroy
    mov r0, r4
    bl Heap_Free
    mov r0, r4
    ldmia sp!, {r4, pc}
.L_022138e4: .word data_ov076_02214d08
.size func_ov076_0221389c, . - func_ov076_0221389c

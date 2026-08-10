.text
; Matching fallback for the portable implementation in src/overlays/ov075/overlay075_recovery.c.
.extern func_02005058
.extern ActorExtendedLinkSource_Destroy

.global func_ov075_02215a28
func_ov075_02215a28:
    stmdb sp!, {r4, lr}
    mov r4, r0
    add r0, r4, #0x2ac
    bl func_02005058
    mov r0, r4
    bl ActorExtendedLinkSource_Destroy
    mov r0, r4
    ldmia sp!, {r4, pc}
.size func_ov075_02215a28, . - func_ov075_02215a28

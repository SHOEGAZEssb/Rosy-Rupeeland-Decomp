.text
; Matching fallback for the portable implementation in src/overlays/ov052/overlay052_recovery.c.
.extern data_021f4020
.extern RetailSelectionDatabase_GetMessageRecordById
.extern Overlay052Scene_SetMessage

.global Overlay052Scene_SetMessageById
Overlay052Scene_SetMessageById:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldr r0, .L_0220e174
    mov r4, r2
    bl RetailSelectionDatabase_GetMessageRecordById
    mov r1, r0
    mov r0, r5
    mov r2, r4
    bl Overlay052Scene_SetMessage
    ldmia sp!, {r3, r4, r5, pc}
.L_0220e174: .word data_021f4020
.size Overlay052Scene_SetMessageById, . - Overlay052Scene_SetMessageById

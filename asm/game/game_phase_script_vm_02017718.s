; Matching retail form; see src/game/game_phase_script_vm_indexed_object_command_opcodes.c.
.text
.extern data_021f5128
.extern GamePhaseScriptVm_Pop
.extern RetailRecordCategory_InsertById
.global GamePhaseActorScriptVm_InsertRetailRecordIdAtCategoryIndex
GamePhaseActorScriptVm_InsertRetailRecordIdAtCategoryIndex:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl GamePhaseScriptVm_Pop
    mov r4, r0
    mov r0, r5
    bl GamePhaseScriptVm_Pop
    ldr r2, L_0201774c
    mov r1, r4
    ldr r2, [r2]
    ldr r0, [r2, r0, lsl #2]
    bl RetailRecordCategory_InsertById
    mov r0, #0
    ldmia sp!, {r3, r4, r5, pc}
L_0201774c: .word data_021f5128
    .size GamePhaseActorScriptVm_InsertRetailRecordIdAtCategoryIndex, . - GamePhaseActorScriptVm_InsertRetailRecordIdAtCategoryIndex

#include "tingle/game_phase_script_vm.h"

/* Compare signed VM values, store Boolean results, and mirror them into condition flag bit one. */

typedef enum VmComparison {
    VM_COMPARE_GREATER,
    VM_COMPARE_GREATER_EQUAL,
    VM_COMPARE_EQUAL,
    VM_COMPARE_LESS_EQUAL,
    VM_COMPARE_LESS,
    VM_COMPARE_NOT_EQUAL
} VmComparison;

static s32 compareSignedValues(s32 left, s32 right, VmComparison comparison)
{
    switch (comparison) {
    case VM_COMPARE_GREATER: return left > right;
    case VM_COMPARE_GREATER_EQUAL: return left >= right;
    case VM_COMPARE_EQUAL: return left == right;
    case VM_COMPARE_LESS_EQUAL: return left <= right;
    case VM_COMPARE_LESS: return left < right;
    default: return left != right;
    }
}

static void storeComparisonResult(GamePhaseScriptVm *self, s32 destination, s32 result)
{
    if (result)
        self->stateFlags |= GAME_PHASE_SCRIPT_VM_CONDITION_TRUE;
    else
        self->stateFlags &= (u8)~GAME_PHASE_SCRIPT_VM_CONDITION_TRUE;
    self->registers[destination] = (u32)result;
}

static s32 compareRegisterOperands(GamePhaseScriptVm *self, VmComparison comparison)
{
    u8 operand = (u8)*self->cursor++;
    s32 destination = operand & 7;
    s32 source = (operand >> 4) & 7;
    storeComparisonResult(self, destination,
                          compareSignedValues((s32)self->registers[destination],
                                              (s32)self->registers[source], comparison));
    return 0;
}

static s32 compareImmediateOperand(GamePhaseScriptVm *self, VmComparison comparison)
{
    s32 destination = (u8)*self->cursor++ & 7;
    s32 immediate = (s32)GamePhaseScriptVm_ReadU32Le(self->cursor);
    self->cursor += 4;
    storeComparisonResult(self, destination,
                          compareSignedValues((s32)self->registers[destination],
                                              immediate, comparison));
    return 0;
}

/* Store whether destination is greater than source and return zero. */
s32 GamePhaseScriptVm_CompareGreaterRegisters(GamePhaseScriptVm *self) { return compareRegisterOperands(self, VM_COMPARE_GREATER); }
/* Store whether destination is at least source and return zero. */
s32 GamePhaseScriptVm_CompareGreaterEqualRegisters(GamePhaseScriptVm *self) { return compareRegisterOperands(self, VM_COMPARE_GREATER_EQUAL); }
/* Store whether destination equals source and return zero. */
s32 GamePhaseScriptVm_CompareEqualRegisters(GamePhaseScriptVm *self) { return compareRegisterOperands(self, VM_COMPARE_EQUAL); }
/* Store whether destination is at most source and return zero. */
s32 GamePhaseScriptVm_CompareLessEqualRegisters(GamePhaseScriptVm *self) { return compareRegisterOperands(self, VM_COMPARE_LESS_EQUAL); }
/* Store whether destination is less than source and return zero. */
s32 GamePhaseScriptVm_CompareLessRegisters(GamePhaseScriptVm *self) { return compareRegisterOperands(self, VM_COMPARE_LESS); }
/* Store whether destination differs from source and return zero. */
s32 GamePhaseScriptVm_CompareNotEqualRegisters(GamePhaseScriptVm *self) { return compareRegisterOperands(self, VM_COMPARE_NOT_EQUAL); }
/* Store whether destination is greater than the immediate and return zero. */
s32 GamePhaseScriptVm_CompareGreaterImmediate(GamePhaseScriptVm *self) { return compareImmediateOperand(self, VM_COMPARE_GREATER); }
/* Store whether destination is at least the immediate and return zero. */
s32 GamePhaseScriptVm_CompareGreaterEqualImmediate(GamePhaseScriptVm *self) { return compareImmediateOperand(self, VM_COMPARE_GREATER_EQUAL); }
/* Store whether destination equals the immediate and return zero. */
s32 GamePhaseScriptVm_CompareEqualImmediate(GamePhaseScriptVm *self) { return compareImmediateOperand(self, VM_COMPARE_EQUAL); }
/* Store whether destination is at most the immediate and return zero. */
s32 GamePhaseScriptVm_CompareLessEqualImmediate(GamePhaseScriptVm *self) { return compareImmediateOperand(self, VM_COMPARE_LESS_EQUAL); }
/* Store whether destination is less than the immediate and return zero. */
s32 GamePhaseScriptVm_CompareLessImmediate(GamePhaseScriptVm *self) { return compareImmediateOperand(self, VM_COMPARE_LESS); }
/* Store whether destination differs from the immediate and return zero. */
s32 GamePhaseScriptVm_CompareNotEqualImmediate(GamePhaseScriptVm *self) { return compareImmediateOperand(self, VM_COMPARE_NOT_EQUAL); }

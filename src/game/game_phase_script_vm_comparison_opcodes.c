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

static s32 compareValues(s32 left, s32 right, VmComparison comparison)
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

static void storeComparison(GamePhaseScriptVm *self, s32 destination, s32 result)
{
    if (result)
        self->stateFlags |= 2;
    else
        self->stateFlags &= (u8)~2;
    self->registers[destination] = (u32)result;
}

static s32 compareRegisters(GamePhaseScriptVm *self, VmComparison comparison)
{
    u8 operand = (u8)*self->cursor++;
    s32 destination = operand & 7;
    s32 source = (operand >> 4) & 7;
    storeComparison(self, destination,
                    compareValues((s32)self->registers[destination],
                                  (s32)self->registers[source], comparison));
    return 0;
}

static s32 compareImmediate(GamePhaseScriptVm *self, VmComparison comparison)
{
    s32 destination = (u8)*self->cursor++ & 7;
    s32 immediate = (s32)func_0201b278(self->cursor);
    self->cursor += 4;
    storeComparison(self, destination,
                    compareValues((s32)self->registers[destination],
                                  immediate, comparison));
    return 0;
}

/* Store whether destination is greater than source and return zero. */
s32 func_0201ba28(GamePhaseScriptVm *self) { return compareRegisters(self, VM_COMPARE_GREATER); }
/* Store whether destination is at least source and return zero. */
s32 func_0201ba7c(GamePhaseScriptVm *self) { return compareRegisters(self, VM_COMPARE_GREATER_EQUAL); }
/* Store whether destination equals source and return zero. */
s32 func_0201bad0(GamePhaseScriptVm *self) { return compareRegisters(self, VM_COMPARE_EQUAL); }
/* Store whether destination is at most source and return zero. */
s32 func_0201bb24(GamePhaseScriptVm *self) { return compareRegisters(self, VM_COMPARE_LESS_EQUAL); }
/* Store whether destination is less than source and return zero. */
s32 func_0201bb78(GamePhaseScriptVm *self) { return compareRegisters(self, VM_COMPARE_LESS); }
/* Store whether destination differs from source and return zero. */
s32 func_0201bbcc(GamePhaseScriptVm *self) { return compareRegisters(self, VM_COMPARE_NOT_EQUAL); }
/* Store whether destination is greater than the immediate and return zero. */
s32 func_0201bc20(GamePhaseScriptVm *self) { return compareImmediate(self, VM_COMPARE_GREATER); }
/* Store whether destination is at least the immediate and return zero. */
s32 func_0201bc7c(GamePhaseScriptVm *self) { return compareImmediate(self, VM_COMPARE_GREATER_EQUAL); }
/* Store whether destination equals the immediate and return zero. */
s32 func_0201bcd8(GamePhaseScriptVm *self) { return compareImmediate(self, VM_COMPARE_EQUAL); }
/* Store whether destination is at most the immediate and return zero. */
s32 func_0201bd34(GamePhaseScriptVm *self) { return compareImmediate(self, VM_COMPARE_LESS_EQUAL); }
/* Store whether destination is less than the immediate and return zero. */
s32 func_0201bd90(GamePhaseScriptVm *self) { return compareImmediate(self, VM_COMPARE_LESS); }
/* Store whether destination differs from the immediate and return zero. */
s32 func_0201bdec(GamePhaseScriptVm *self) { return compareImmediate(self, VM_COMPARE_NOT_EQUAL); }

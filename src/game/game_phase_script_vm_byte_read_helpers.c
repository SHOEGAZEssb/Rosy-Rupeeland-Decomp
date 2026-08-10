#include "tingle/game_phase_script_vm.h"

/* Decode little-endian unaligned integers used by the script bytecode stream. */

/* Read a signed little-endian 16-bit value from two bytes and return it sign-extended. */
s32 GamePhaseScriptVm_ReadS16Le(const s8 *bytes)
{
    return (s16)((u8)bytes[0] | ((u16)(u8)bytes[1] << 8));
}

/* Read an unaligned little-endian 32-bit value from four bytes and return it. */
u32 GamePhaseScriptVm_ReadU32Le(const s8 *bytes)
{
    return (u32)(u8)bytes[0]
         | ((u32)(u8)bytes[1] << 8)
         | ((u32)(u8)bytes[2] << 16)
         | ((u32)(u8)bytes[3] << 24);
}

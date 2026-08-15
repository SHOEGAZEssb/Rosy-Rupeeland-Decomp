#include "tingle/types.h"

/* Overlay 36 command dispatch for the three-child render object. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov036_02204dac[];
extern const u8 data_ov036_02204dd0[];
extern const u8 data_ov036_02204ffc[];
extern const u8 data_ov036_02204d8c[];
extern const u8 data_ov036_02204e60[];
extern const u8 data_ov036_02204df4[];
extern const u8 data_ov036_02205168[];
extern const u8 data_ov036_02204ee4[];
extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void Presentation_SetScript(void *object, const void *data, s32 mode);
extern void Sound_Play(void *sound, s32 id, s32 mode);
#ifdef __cplusplus
}
#endif

/*
 * Dispatches a command record whose +0 word is the opcode and +4 is its value.
 * Opcode zero stores +4 at object +0xB0 and returns two. Opcodes 1..4 apply
 * confirmed animation-data pairs to children +0x158/+0x154 in mode one:
 * (04DAC,04DD0), (04FFC,04D8C), (04E60,04DF4), or (05168,04EE4).
 * Opcode three additionally plays sound 0x1B3 in mode two. Other opcodes do
 * nothing. Returns one for every opcode except zero; child animation and sound
 * state may change.
 */
extern "C" s32 func_ov036_02203b24(void *object, const void *command)
{
    switch (FIELD(s32, command, 0)) {
    case 0:
        FIELD(s32, object, 0xb0) = FIELD(s32, command, 4);
        return 2;
    case 1:
        Presentation_SetScript(FIELD(void *, object, 0x158),
                      data_ov036_02204dac, 1);
        Presentation_SetScript(FIELD(void *, object, 0x154),
                      data_ov036_02204dd0, 1);
        break;
    case 2:
        Presentation_SetScript(FIELD(void *, object, 0x158),
                      data_ov036_02204ffc, 1);
        Presentation_SetScript(FIELD(void *, object, 0x154),
                      data_ov036_02204d8c, 1);
        break;
    case 3:
        Sound_Play(gSoundContext, 0x1b3, 2);
        Presentation_SetScript(FIELD(void *, object, 0x158),
                      data_ov036_02204e60, 1);
        Presentation_SetScript(FIELD(void *, object, 0x154),
                      data_ov036_02204df4, 1);
        break;
    case 4:
        Presentation_SetScript(FIELD(void *, object, 0x158),
                      data_ov036_02205168, 1);
        Presentation_SetScript(FIELD(void *, object, 0x154),
                      data_ov036_02204ee4, 1);
        break;
    }
    return 1;
}

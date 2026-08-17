#include "tingle/types.h"

/* Overlay 37 lightweight 3D object setup and sound-command dispatch. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern const u8 data_ov037_021fee78[];
extern void *gSoundContext;

#ifdef __cplusplus
extern "C" {
#endif
extern void Presentation_Init(void *object);
extern void Sound_PlayDirectSequence(void *soundContext, u16 soundId, s32 volume);
#ifdef __cplusplus
}
#endif

/*
 * Runs the shared 3D-object initializer and installs the overlay vtable.
 * Returns object; the common initializer and object memory may change, with
 * no direct SDK hardware effect established here.
 */
extern "C" void *func_ov037_021fd1cc(void *object)
{
    Presentation_Init(object);
    FIELD(const void *, object, 0) = data_ov037_021fee78;
    return object;
}

/*
 * Decodes a word-based sound command. Opcode 0 plays the low 16 bits of the
 * value at +4 through the global sound context at volume 127 and returns 2;
 * other opcodes return 1 without changing state. The sound SDK is the only
 * observable external effect.
 */
extern "C" s32 func_ov037_021fd1ec(void *unused, const s32 *command)
{
    (void)unused;
    if (command[0] == 0) {
        Sound_PlayDirectSequence(gSoundContext, (u16)command[1], 0x7f);
        return 2;
    }
    return 1;
}

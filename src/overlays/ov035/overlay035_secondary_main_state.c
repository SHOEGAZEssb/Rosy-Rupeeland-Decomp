#include "tingle/types.h"

/* Overlay 35 secondary scene six-stage animation and particle state machine. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *gSoundContext;
extern const u8 data_ov035_02203344[];
extern const u8 data_ov035_02203434[];
extern const u8 data_ov035_02203274[];
extern const u8 data_ov035_02202fd0[];
extern const u8 data_ov035_02203038[];
extern const u8 data_ov035_02202dc0[];
extern const u8 data_ov035_02203d50[];
extern u8 gHeapContext[];

#ifdef __cplusplus
extern "C" {
#endif
extern void Sound_PlayDirectSequence(void *sound, s32 id, s32 value);
extern void Sound_StopDirectSequence(void *sound, s32 id, s32 value);
extern void Sound_Play(void *sound, s32 id, s32 parameter);
extern void Presentation_SetScript(void *object, const void *motion, s32 enabled);
extern s32 Presentation_IsScriptSuspended(void *object);
extern s32 Presentation_IsScriptComplete(void *object);
extern void *Heap_Alloc(u32 size, const void *tag, s32 alignment, void *heap);
extern void *func_ov035_021fd7f0(void *particle);
extern void PresentationList_Append(void *collection, void *object);
extern void func_ov035_021ff164(void *scene);
#ifdef __cplusplus
}
#endif

/* Allocates one randomized particle, returning null on allocation failure. */
static void *create_particle(void)
{
    void *particle =
        Heap_Alloc(0xa8, data_ov035_02203d50, 4, gHeapContext);
    if (particle != 0)
        particle = func_ov035_021fd7f0(particle);
    return particle;
}

/*
 * Runs the secondary scene's six-stage sequence using state +0xA0. Stage 0
 * starts sound 0xB5 and installs motion tables on five objects. Stages 1 and 2
 * wait for the +0x104/+0x108 objects, play sound 0x1B5, clear recovered +0x90
 * fields, and hide +0x104. Stages 3 and 4 continuously add randomized particles
 * to collection +0x12C until +0x108 then +0x100 report completion. Stage 5 is
 * terminal. Every call updates all scene collections/resources through
 * func_ov035_021ff164. Returns one only in stage 5; sound, heap, animation,
 * collection, and object state may change.
 */
extern "C" s32 func_ov035_021ff190(void *scene)
{
    switch (FIELD(s32, scene, 0xa0)) {
    case 0:
        Sound_PlayDirectSequence(gSoundContext, 0xb5, 0x7f);
        Presentation_SetScript(FIELD(void *, scene, 0x100),
                      data_ov035_02203344, 1);
        Presentation_SetScript(FIELD(void *, scene, 0x104),
                      data_ov035_02203434, 1);
        Presentation_SetScript(FIELD(void *, scene, 0xfc),
                      data_ov035_02203274, 1);
        Presentation_SetScript(FIELD(void *, scene, 0xd8),
                      data_ov035_02202fd0, 1);
        Presentation_SetScript(FIELD(void *, scene, 0x140),
                      data_ov035_02203038, 1);
        FIELD(s32, scene, 0xa0)++;
        /* The recovered switch intentionally continues into stage 1. */
    case 1:
        if (Presentation_IsScriptSuspended(FIELD(void *, scene, 0x104))) {
            Sound_Play(gSoundContext, 0x1b5, 0);
            Presentation_SetScript(FIELD(void *, scene, 0x108),
                          data_ov035_02202dc0, 1);
            FIELD(s32, scene, 0xa0)++;
        }
        break;
    case 2:
        if (Presentation_IsScriptSuspended(FIELD(void *, scene, 0x108))) {
            FIELD(s32, FIELD(void *, scene, 0x100), 0x90) = 0;
            FIELD(s32, FIELD(void *, scene, 0xfc), 0x90) = 0;
            FIELD(u16, FIELD(void *, scene, 0x104), 0x98) |= 1;
            FIELD(s32, FIELD(void *, scene, 0x108), 0x90) = 0;
            FIELD(s32, scene, 0xa0)++;
        }
        break;
    case 3:
        PresentationList_Append((u8 *)scene + 0x12c, create_particle());
        if (Presentation_IsScriptComplete(FIELD(void *, scene, 0x108))) {
            FIELD(s32, FIELD(void *, scene, 0x100), 0x90) = 0;
            FIELD(s32, scene, 0xa0)++;
        }
        break;
    case 4:
        PresentationList_Append((u8 *)scene + 0x12c, create_particle());
        if (Presentation_IsScriptComplete(FIELD(void *, scene, 0x100))) {
            Sound_StopDirectSequence(gSoundContext, 0xb5, 0x10);
            FIELD(s32, scene, 0xa0)++;
        }
        break;
    case 5:
        func_ov035_021ff164(scene);
        return 1;
    }
    func_ov035_021ff164(scene);
    return 0;
}

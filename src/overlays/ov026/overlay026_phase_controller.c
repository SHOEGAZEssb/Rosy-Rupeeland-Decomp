#include "tingle/types.h"

/* Overlay 26 phase controller selecting audio and two-word presets by scene variant. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *gSoundContext;
extern const s32 data_ov026_022045b0[];
extern const s32 data_ov026_022045f8[];
extern const s32 data_ov026_02204668[];
extern const s32 data_ov026_02204680[];
extern const s32 data_ov026_022046c0[];
extern const s32 data_ov026_02204708[];
extern const s32 data_ov026_02204718[];
extern const s32 data_ov026_02204720[];
extern const s32 data_ov026_02204738[];
extern const s32 data_ov026_02204740[];
extern const s32 data_ov026_02204748[];

#ifdef __cplusplus
extern "C" {
#endif
extern void func_020592fc(void *, s32, s32);
extern void func_020594ec(void *, s32);
extern void func_020922f0(void *, s32);
extern void func_ov026_021ff878(void *, s32, s32);
extern void func_ov026_022009dc(void *);
#ifdef __cplusplus
}
#endif

/* Applies the two-word preset at `pair` to the scene record fields. */
static void apply_pair(void *scene, const s32 *pair)
{
    func_ov026_021ff878(scene, pair[0], pair[1]);
}

/*
 * On phase +4==0, starts the phase task (or sound 0x1B for special scene 999),
 * advances to phase 1, and clears timer +8. Phase 1 selects one of ten audio
 * IDs and two-word presets from scene ID +0x54; IDs outside 1..10 use the
 * default preset. It then runs the central simulation/update dispatcher.
 * Returns zero; later phase values only run the dispatcher.
 */
extern "C" s32 func_ov026_02201430(void *scene)
{
    s32 phase = FIELD(s32, scene, 4);
    if (phase == 0) {
        if (FIELD(s32, scene, 0x54) == 999)
            func_020594ec(gSoundContext, 0x1b);
        else
            func_020922f0(scene, 0x3d);
        FIELD(s32, scene, 4) = 1;
        FIELD(s32, scene, 8) = 0;
        phase = 1;
    }
    if (phase == 1) {
        const s32 *pair = data_ov026_02204668;
        s32 audio_id = 0;
        switch (FIELD(s32, scene, 0x54)) {
        case 1: audio_id = 0x4400; pair = data_ov026_02204740; break;
        case 2: audio_id = 0xc408; pair = data_ov026_02204738; break;
        case 3: audio_id = 0xc448; pair = data_ov026_022045f8; break;
        case 4: audio_id = 0xc468; pair = data_ov026_02204708; break;
        case 5: audio_id = 0xc668; pair = data_ov026_022046c0; break;
        case 6: audio_id = 0xc6e8; pair = data_ov026_02204720; break;
        case 7: audio_id = 0xc6f8; pair = data_ov026_02204718; break;
        case 8: audio_id = 0xc7f8; pair = data_ov026_02204680; break;
        case 9: audio_id = 0xc7fa; pair = data_ov026_022045b0; break;
        case 10: audio_id = 0xc7fb; pair = data_ov026_02204748; break;
        }
        if (audio_id != 0)
            func_020592fc(gSoundContext, 0x3d, audio_id);
        apply_pair(scene, pair);
    }
    func_ov026_022009dc(scene);
    return 0;
}

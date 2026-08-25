#include "tingle/types.h"

/* Overlay 13 terminal-state selection and final display/presentation update. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void *gGameWork;
extern u8 *gGamePhaseRuntime;
#ifdef __cplusplus
extern "C" {
#endif
extern void GridEffectActorRegistry_FinalizeDepartingActors(void);
extern void GameWork_SetFlag(void *, s32);
extern void ActorMotion_SetMode2(void *);
extern void Overlay013_UpdateSceneRuntime(void *);
extern void GamePhaseAreaScene_Update(void *);
#ifdef __cplusplus
}
#endif

typedef void (*Overlay013TerminalMethod)(void *);

/*
 * On phase +0x04 equal to zero, translate selected index +0x96C into terminal
 * value +0x980: indexes 0/1/4/5/6 select 4, 8-or-9, 15, 12, and 14. Index 1
 * uses 9 when +0x97C is set; otherwise it selects 8 and calls GridEffectActorRegistry_FinalizeDepartingActors.
 * Index 3 sets GameWork flags 0x3F2/0x393 and dispatches global member +0x2FBC;
 * index 2 has no extra action. Then advance +0x04 and clear +0x08. Always run
 * the scene-record update and return one. Global and callee side effects pass
 * through unchanged; the meaning of terminal values is not yet confirmed.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 Overlay013_UpdateCompletionPhase(void *state)
{
    if (FIELD(s32, state, 4) == 0) {
        switch (FIELD(s32, state, 0x96c)) {
        case 0:
            FIELD(s32, state, 0x980) = 4;
            break;
        case 1:
            if (FIELD(s32, state, 0x97c) != 0) {
                FIELD(s32, state, 0x980) = 9;
            } else {
                FIELD(s32, state, 0x980) = 8;
                GridEffectActorRegistry_FinalizeDepartingActors();
            }
            break;
        case 3:
            GameWork_SetFlag(gGameWork, 0x3f2);
            GameWork_SetFlag(gGameWork, 0x393);
            ActorMotion_SetMode2(gGamePhaseRuntime + 0x2fbc);
            break;
        case 4:
            FIELD(s32, state, 0x980) = 15;
            break;
        case 5:
            FIELD(s32, state, 0x980) = 12;
            break;
        case 6:
            FIELD(s32, state, 0x980) = 14;
            break;
        }
        ++FIELD(s32, state, 4);
        FIELD(s32, state, 8) = 0;
    }
    Overlay013_UpdateSceneRuntime(state);
    return 1;
}

/*
 * If +0x97C is nonzero, pass the pointer stored at global +0x2FB8 to
 * GamePhaseAreaScene_Update. When state flag bit 0x400 at +0x20 is set, invoke vtable slot
 * +0x0C on optional object +0x9A8, then replace DISPCNT bits 8..12 with +0x48
 * shifted by eight. Return zero. The mapped register write is a confirmed
 * Nintendo DS display hardware effect.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 Overlay013_UpdateTerminalPhase(void *state)
{
    if (FIELD(s32, state, 0x97c) != 0)
        GamePhaseAreaScene_Update(FIELD(void *, gGamePhaseRuntime, 0x2fb8));
    if (FIELD(u32, state, 0x20) & 0x400) {
        void *object = FIELD(void *, state, 0x9a8);
        volatile u32 *dispcnt = (volatile u32 *)0x04000000;
        if (object != 0) {
            void **vtable = FIELD(void **, object, 0);
            ((Overlay013TerminalMethod)vtable[3])(object);
        }
        *dispcnt = (*dispcnt & ~0x1f00u) | (FIELD(u32, state, 0x48) << 8);
    }
    return 0;
}

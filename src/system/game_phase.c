#include "tingle/game_phase.h"
#include "tingle/game_work.h"

/*
 * Game-phase construction and the boot transition that precedes phase 0xE1.
 * The phase configuration fields and LUPY-tagged context remain opaque until
 * their consumers provide evidence for more specific names.
 */

typedef struct GamePhaseConfig {
    u8 unknown00[0x2C];
    s32 value2C;
    s32 value30;
    u8 unknown34[0x24];
} GamePhaseConfig;

typedef char GamePhaseConfigSizeCheck[
    sizeof(GamePhaseConfig) == 0x58 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

extern void *Heap_Alloc(u32 size, const char *tag, s32 alignment, void *heap);
extern void Heap_Free(void *allocation);
extern void Scene_Init(void *scene);
extern void Scene_Destroy(void *scene);

extern void *GamePhaseRuntime_Init(void *phase);
extern void GamePhaseRuntime_Configure(void *phase, const GamePhaseConfig *config,
                          s32 value2C, s32 value30, int unknown);
extern void *GamePhaseResumeScene_Init(void *object, int unknown);
extern void *GamePhaseCurrencyHud_Init(void *context);
extern const GamePhaseConfig *GamePhaseMetadata_GetByIndex(int phaseIndex);

extern void DisplayBrightness_StartMainTransition(int mode, int duration);
extern void DisplayBrightness_StartSubTransition(int mode, int duration);
extern int DisplayBrightness_IsMainTransitionComplete(void);
extern int DisplayBrightness_IsSubTransitionComplete(void);

extern int Scene_NoopMethod0C(GamePhaseTransition *transition);
extern int Scene_NoopMethod10(GamePhaseTransition *transition);
extern int Scene_NoopMethod14(GamePhaseTransition *transition);
extern int Scene_NoopMethod18(GamePhaseTransition *transition);
extern int Scene_NoopMethod1C(GamePhaseTransition *transition);
extern int Scene_OnRevealed(GamePhaseTransition *transition);
extern int Scene_NoopMethod20(GamePhaseTransition *transition);
extern int Scene_OnCovered(GamePhaseTransition *transition);

extern void *gHeapContext;
extern void *gLupyContext;

#ifdef __cplusplus
}

class GamePhaseTransitionDeleteProxy {
public:
    virtual ~GamePhaseTransitionDeleteProxy();
};
#endif

/*
 * Keep these values in one aggregate. MWCC places standalone tag arrays before
 * the vtable, changing both the data layout and the code's literal targets.
 */
GamePhaseInitialData gGamePhaseInitialData = {
    {
        GamePhaseTransition_Destroy,
        GamePhaseTransition_DestroyAndFree,
        GamePhaseTransition_Update,
        Scene_NoopMethod0C,
        Scene_NoopMethod10,
        Scene_NoopMethod14,
        Scene_NoopMethod18,
        Scene_NoopMethod1C,
        Scene_NoopMethod20,
        Scene_OnRevealed,
        Scene_OnCovered,
    },
    "PHAZ",
    "LUPY",
};

/*
 * Optionally reset GameWork, construct the selected phase from its table
 * record, then create the companion object which sets game-work flag 0x3F3.
 */
void GamePhase_Start(int phaseId, int resetGameWork)
{
    void *phase;
    const GamePhaseConfig *config;
    void *companion;

    if (resetGameWork != 0) {
        GameWork_Reset();
    }

    phase = Heap_Alloc(0x3100, gGamePhaseInitialData.phaseTag, 4,
                       &gHeapContext);
    if (phase != 0) {
        phase = GamePhaseRuntime_Init(phase);
    }

    /* Phase IDs are one-based while the configuration table is zero-based. */
    config = GamePhaseMetadata_GetByIndex(phaseId - 1);
    GamePhaseRuntime_Configure(phase, config, config->value2C, config->value30, 0);

    companion = Heap_Alloc(0x28, gGamePhaseInitialData.phaseTag, -4,
                           &gHeapContext);
    if (companion != 0) {
        GamePhaseResumeScene_Init(companion, 0);
    }
}

/*
 * Create the opaque LUPY context and schedule the transition which eventually
 * starts phase 0xE1. Allocation failures are propagated through null results.
 */
GamePhaseTransition *GamePhase_Bootstrap(void)
{
    void *lupy = Heap_Alloc(0xD0, gGamePhaseInitialData.lupyTag, 4,
                            &gHeapContext);
    GamePhaseTransition *transition;

    if (lupy != 0) {
        lupy = GamePhaseCurrencyHud_Init(lupy);
    }
    gLupyContext = lupy;

    transition = (GamePhaseTransition *)Heap_Alloc(
        sizeof(GamePhaseTransition), gGamePhaseInitialData.phaseTag, 4,
        &gHeapContext);
    if (transition != 0) {
        transition = GamePhaseTransition_Init(transition);
    }
    return transition;
}

/* Initialize the scene base, install the vtable, and set field 0x04 to 19. */
GamePhaseTransition *GamePhaseTransition_Init(
    GamePhaseTransition *transition)
{
    Scene_Init(transition);
    transition->vtable = &gGamePhaseInitialData.vtable;
    transition->value04 = 19;
    return transition;
}

/* Destroy the transition's scene base without freeing its allocation. */
GamePhaseTransition *GamePhaseTransition_Destroy(
    GamePhaseTransition *transition)
{
    Scene_Destroy(transition);
    return transition;
}

/* Destroy and release a heap-owned transition object. */
GamePhaseTransition *GamePhaseTransition_DestroyAndFree(
    GamePhaseTransition *transition)
{
    Scene_Destroy(transition);
    Heap_Free(transition);
    return transition;
}

/*
 * Start matching 16-frame operations, wait until both report completion, then
 * delete this transition and launch phase 0xE1 with a fresh GameWork state.
 */
int GamePhaseTransition_Update(GamePhaseTransition *transition)
{
    switch (transition->state) {
    case 0:
        DisplayBrightness_StartMainTransition(2, 0x10);
        DisplayBrightness_StartSubTransition(2, 0x10);
        transition->state++;
        break;

    case 1:
        if (DisplayBrightness_IsMainTransitionComplete() != 0 && DisplayBrightness_IsSubTransitionComplete() != 0) {
            transition->state++;
        }
        break;

    case 2:
#ifdef __cplusplus
        delete reinterpret_cast<GamePhaseTransitionDeleteProxy *>(transition);
#else
        if (transition != 0) {
            transition->vtable->destroyAndFree(transition);
        }
#endif
        GamePhase_Start(0xE1, 1);
        return 1;
    }

    return 0;
}

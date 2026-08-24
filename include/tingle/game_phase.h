#ifndef TINGLE_GAME_PHASE_H
#define TINGLE_GAME_PHASE_H

#include "tingle/types.h"

#ifdef __cplusplus
extern "C" {
#endif

typedef struct GamePhaseTransition GamePhaseTransition;
typedef struct GamePhaseCurrencyHud GamePhaseCurrencyHud;

typedef struct GamePhaseTransitionVTable {
    GamePhaseTransition *(*destroy)(GamePhaseTransition *transition);
    GamePhaseTransition *(*destroyAndFree)(GamePhaseTransition *transition);
    int (*update)(GamePhaseTransition *transition);
    int (*method0C)(GamePhaseTransition *transition);
    int (*method10)(GamePhaseTransition *transition);
    int (*method14)(GamePhaseTransition *transition);
    int (*method18)(GamePhaseTransition *transition);
    int (*method1C)(GamePhaseTransition *transition);
    int (*method20)(GamePhaseTransition *transition);
    int (*method24)(GamePhaseTransition *transition);
    int (*method28)(GamePhaseTransition *transition);
} GamePhaseTransitionVTable;

struct GamePhaseTransition {
    GamePhaseTransitionVTable *vtable;
    u32 value04;
    s32 state;
    u8 baseFields[0x18];
};

typedef char GamePhaseTransitionSizeCheck[
    sizeof(GamePhaseTransition) == 0x24 ? 1 : -1];
typedef char GamePhaseTransitionVTableSizeCheck[
    sizeof(GamePhaseTransitionVTable) == 0x2C ? 1 : -1];

typedef struct GamePhaseInitialData {
    GamePhaseTransitionVTable vtable;
    char phaseTag[8];
    char currencyHudTag[8];
} GamePhaseInitialData;

typedef char GamePhaseInitialDataSizeCheck[
    sizeof(GamePhaseInitialData) == 0x3C ? 1 : -1];

extern GamePhaseInitialData gGamePhaseInitialData;
extern GamePhaseCurrencyHud *gGamePhaseCurrencyHud;

void GamePhase_Start(int phaseId, int resetGameWork);
GamePhaseTransition *GamePhase_Bootstrap(void);
GamePhaseTransition *GamePhaseTransition_Init(
    GamePhaseTransition *transition);
GamePhaseTransition *GamePhaseTransition_Destroy(
    GamePhaseTransition *transition);
GamePhaseTransition *GamePhaseTransition_DestroyAndFree(
    GamePhaseTransition *transition);
int GamePhaseTransition_Update(GamePhaseTransition *transition);

#ifdef __cplusplus
}
#endif

#endif

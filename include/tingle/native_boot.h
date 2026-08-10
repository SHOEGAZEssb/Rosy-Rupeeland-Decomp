#ifndef TINGLE_NATIVE_BOOT_H
#define TINGLE_NATIVE_BOOT_H

#include "tingle/native_game_phase.h"
#include "tingle/native_graphics.h"

typedef enum TingleNativeBootState {
    TINGLE_NATIVE_BOOT_SPLASH,
    TINGLE_NATIVE_BOOT_TITLE,
    TINGLE_NATIVE_BOOT_LEAVING_TITLE,
    TINGLE_NATIVE_BOOT_NEXT_PHASE
} TingleNativeBootState;

typedef struct TingleNativeBootScene {
    TingleNativeGamePhaseBoundary phase;
    TingleNativeGameWork *game_work;
    TingleNativeGraphicsResourceSet splash_main;
    TingleNativeGraphicsResourceSet splash_sub;
    TingleNativeGraphicsResourceSet title_background;
    TingleNativeGraphicsResourceSet title_logo;
    TingleNativeGraphicsResourceSet title_copyright;
    TingleNativeBootState state;
    s32 frame;
    s32 resources_loaded;
} TingleNativeBootScene;

/* Constructs retail boot phase 225 and its recovered publisher resources. */
s32 TingleNativeBootScene_Init(TingleNativeBootScene *scene,
                               TingleNativeData *data,
                               TingleNativeGameWork *game_work);

/* Advances recovered boot timing and maps accepted title input to phase 5. */
void TingleNativeBootScene_Update(TingleNativeBootScene *scene,
                                  TingleNativeData *data,
                                  const TingleNativeInput *input);

/* Renders the active retail resource layers through native graphics boundaries. */
void TingleNativeBootScene_Draw(const TingleNativeBootScene *scene,
                                TingleNativeCanvas *canvas);

/* Releases phase overlays and all decoded graphics resources. */
void TingleNativeBootScene_Destroy(TingleNativeBootScene *scene);

#endif

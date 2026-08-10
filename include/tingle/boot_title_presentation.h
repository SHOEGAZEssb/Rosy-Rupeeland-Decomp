#ifndef TINGLE_BOOT_TITLE_PRESENTATION_H
#define TINGLE_BOOT_TITLE_PRESENTATION_H

#include "tingle/native_graphics.h"
#include "tingle/native_platform.h"

typedef enum BootTitlePresentationState {
    BOOT_TITLE_PRESENTATION_SPLASH,
    BOOT_TITLE_PRESENTATION_TITLE,
    BOOT_TITLE_PRESENTATION_LEAVING_TITLE,
    BOOT_TITLE_PRESENTATION_FINISHED
} BootTitlePresentationState;

/* Recovered state retained by the phase-225 to phase-90 presentation slice. */
typedef struct BootTitlePresentation {
    TingleNativeGraphicsResourceSet splashMain;
    TingleNativeGraphicsResourceSet splashSub;
    TingleNativeGraphicsResourceSet titleBackground;
    TingleNativeGraphicsResourceSet titleLogo;
    TingleNativeGraphicsResourceSet titleCopyright;
    TingleNativeFieldResourceSet titleMainField;
    TingleNativeFieldResourceSet titleSubField;
    BootTitlePresentationState state;
    s32 frame;
    u16 previousKeys;
} BootTitlePresentation;

/* Owns loaded resource sets until BootTitlePresentation_Destroy. */
s32 BootTitlePresentation_Init(BootTitlePresentation *self,
                               TingleNativeData *data);
void BootTitlePresentation_Destroy(BootTitlePresentation *self);

/* Advances one 60 Hz game frame using the current host-adapted DS input. */
s32 BootTitlePresentation_Update(BootTitlePresentation *self,
                                 TingleNativeData *data,
                                 const TingleNativeHostInput *input);

/* Emits both DS screens to a 256x384 host canvas without changing game state. */
s32 BootTitlePresentation_Draw(const BootTitlePresentation *self,
                               TingleNativeCanvas *canvas);

#endif

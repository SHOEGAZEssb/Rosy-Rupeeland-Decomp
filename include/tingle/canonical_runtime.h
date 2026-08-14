#ifndef TINGLE_CANONICAL_RUNTIME_H
#define TINGLE_CANONICAL_RUNTIME_H

#include "tingle/types.h"

/* Enter the recovered retail process/static/main initialization sequence. */
s32 TingleRecoveredCanonicalStartup(void);

/* Execute one recovered retail main-loop iteration on the game thread. */
void TingleRecoveredCanonicalRunFrame(void);

/* Return the one-based retail phase owning the active canonical runtime. */
s32 TingleRecoveredCanonicalGetPhase(void);

/* Return the active recovered phase-owned scene's state word, or -1. */
s32 TingleRecoveredCanonicalGetSceneState(void);

/* Identify the active overlay-25 callback for focused runtime validation. */
s32 TingleRecoveredCanonicalGetTitleCallback(void);

#endif

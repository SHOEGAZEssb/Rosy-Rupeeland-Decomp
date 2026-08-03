#ifndef TINGLE_ERROR_DISPLAY_H
#define TINGLE_ERROR_DISPLAY_H

#include "tingle/types.h"

#ifdef __cplusplus
extern "C" {
#endif

#ifdef __cplusplus
void *ErrorDisplayContext_Get(void) throw();
#else
void *ErrorDisplayContext_Get(void);
#endif
void ErrorDisplayContext_Destroy(void *context);
void ErrorDisplay_RunHaltLoop(void);
void ErrorDisplay_ShowAndHalt(s32 resourceSetIndex);
void ErrorDisplay_ShowDefaultAndHalt(void);

#ifdef __cplusplus
}
#endif

#endif

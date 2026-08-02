#ifndef TINGLE_DEBUG_MENU_H
#define TINGLE_DEBUG_MENU_H

#include "tingle/types.h"

#ifdef __cplusplus
extern "C" {
#endif

typedef struct DebugMenu DebugMenu;

typedef struct DebugMenuVTable {
    DebugMenu *(*destroy)(DebugMenu *menu);
    DebugMenu *(*destroyAndFree)(DebugMenu *menu);
    int (*update)(DebugMenu *menu);
} DebugMenuVTable;

struct DebugMenu {
    DebugMenuVTable *vtable;
    u8 baseFields[0x20];
    s32 selection;
};

typedef char DebugMenuSizeCheck[sizeof(DebugMenu) == 0x28 ? 1 : -1];

extern DebugMenuVTable gDebugMenuVTable;

DebugMenu *DebugMenu_Init(DebugMenu *menu);
DebugMenu *DebugMenu_Destroy(DebugMenu *menu);
DebugMenu *DebugMenu_DestroyAndFree(DebugMenu *menu);
int DebugMenu_Update(DebugMenu *menu);
DebugMenu *DebugMenu_Create(void);

#ifdef __cplusplus
}
#endif

#endif

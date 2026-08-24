#ifndef TINGLE_GAME_STRING_LIST_H
#define TINGLE_GAME_STRING_LIST_H

#include "tingle/game_string.h"
#include "tingle/types.h"

typedef struct GameStringListNode GameStringListNode;
typedef struct GameStringList GameStringList;

typedef struct GameStringListVTable {
    GameStringList *(*destroy)(GameStringList *self);
    GameStringList *(*destroyAndFree)(GameStringList *self);
} GameStringListVTable;

struct GameStringListNode {
    GameStringListNode *next;
    GameStringListNode *previous;
    GameString value;
};

struct GameStringList {
    const GameStringListVTable *vtable;
    GameStringListNode *head;
    GameStringListNode *tail;
    s32 count;
};

typedef char GameStringListNodeSizeCheck[
    sizeof(GameStringListNode) == 0x10 ? 1 : -1];
typedef char GameStringListSizeCheck[
    sizeof(GameStringList) == 0x10 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

extern GameStringListVTable gGameStringListVTable;
extern const char gGameStringListNodeAllocationTag[];

GameStringList *GameStringList_Destroy(GameStringList *self);
void GameStringList_Clear(GameStringList *self);
GameStringListNode *GameStringList_Append(GameStringList *self,
                                 const GameString *value);
GameStringList *GameStringList_DestroyAndFree(GameStringList *self);

#ifdef __cplusplus
}
#endif

#endif

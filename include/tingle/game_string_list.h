#ifndef TINGLE_GAME_STRING_LIST_H
#define TINGLE_GAME_STRING_LIST_H

#include "tingle/game_string.h"
#include "tingle/types.h"

typedef struct GameStringListNode GameStringListNode;
typedef struct GameStringList GameStringList;

struct GameStringListNode {
    GameStringListNode *next;
    GameStringListNode *previous;
    GameString value;
};

struct GameStringList {
    const void *vtable;
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

GameStringList *func_02006108(GameStringList *self);
GameStringList *func_02006120(GameStringList *self);
GameStringList *func_02006124(GameStringList *self);
void *func_02006138(void *self);
void *func_0200613c(void *self);
GameStringList *GameStringList_Destroy(GameStringList *self);
void GameStringList_Clear(GameStringList *self);
GameStringListNode *GameStringList_Append(GameStringList *self,
                                 const GameString *value);
GameStringList *GameStringList_DestroyAndFree(GameStringList *self);

#ifdef __cplusplus
}
#endif

#endif

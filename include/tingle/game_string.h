#ifndef TINGLE_GAME_STRING_H
#define TINGLE_GAME_STRING_H

#include "tingle/types.h"

typedef struct GameString {
    const void *vtable;
    char *data;
} GameString;

#ifdef __cplusplus
extern "C" {
#endif

GameString *GameString_Init(GameString *string);
GameString *GameString_InitCString(GameString *string, const char *source,
                                  u32 length);
GameString *GameString_InitFromOther(GameString *string,
                                    const GameString *source);
GameString *GameString_Destroy(GameString *string);
GameString *GameString_DestroyAndFree(GameString *string);
void GameString_Assign(GameString *string, const char *source, u32 length);
void GameString_Append(GameString *string, const char *suffix);
#ifdef __cplusplus
void GameString_Clear(GameString *string) throw();
#else
void GameString_Clear(GameString *string);
#endif
void GameString_InitPrefix(GameString *string, const GameString *source,
                           s32 length);
GameString *GameString_AssignCopy(GameString *string,
                                 const GameString *source);
void GameString_Concat(GameString *result, const GameString *left,
                       const GameString *right);
s32 GameString_Equals(const GameString *left, const GameString *right);

#ifdef __cplusplus
}
#endif

#endif

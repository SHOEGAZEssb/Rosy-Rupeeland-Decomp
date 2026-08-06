#include "tingle/types.h"

/*
 * Expand compact 0x1c-byte tile draw commands through renderer virtual methods.
 * Commands describe source/destination origins, rectangular dimensions, a
 * two-bit layer, and a five-bit attribute; a zero-sized record terminates a list.
 */
typedef struct TileDrawCommand {
    s32 destinationX_00;
    s32 destinationY_04;
    s32 sourceX_08;
    s32 sourceY_0c;
    s32 width_10;
    s32 height_14;
    u32 packed_18;
} TileDrawCommand;

typedef void (*DrawTileMethod)(void *, s32, u16, s32, s32);
typedef void (*DrawCommandMethod)(void *, s32, s32, const TileDrawCommand *);

#ifdef __cplusplus
extern "C" {
#endif
extern void func_0202bb60(void *, s32, s32, s32);
#ifdef __cplusplus
}
#endif

/*
 * Expand one command row-major. Source tiles use a fixed stride of 16; vtable
 * slot 12 receives layer bits 0..1 and each source/destination coordinate,
 * then func_0202bb60 publishes packed bits 2..6 at the destination.
 */
void func_02029d40(void *renderer, s32 x, s32 y,
                   const TileDrawCommand *command)
{
    s32 row;
    s32 column;
    for (row = 0; row < command->height_14; row++) {
        for (column = 0; column < command->width_10; column++) {
            s32 destinationX = x + command->destinationX_00 + column;
            s32 destinationY = y + command->destinationY_04 + row;
            u16 source = (u16)(command->sourceX_08 + column +
                               (command->sourceY_0c + row) * 16);
            ((DrawTileMethod)(*(void ***)renderer)[12])(
                renderer, command->packed_18 & 3, source,
                destinationX, destinationY);
            func_0202bb60(renderer, destinationX, destinationY,
                          (command->packed_18 & 0x7c) >> 2);
        }
    }
}

/* Walk 0x1c-byte commands until both dimensions are zero, dispatching vtable slot 14. */
void func_02029df4(void *renderer, s32 x, s32 y,
                   const TileDrawCommand *commands)
{
    while (commands->width_10 != 0 || commands->height_14 != 0) {
        ((DrawCommandMethod)(*(void ***)renderer)[14])(
            renderer, x, y, commands);
        commands++;
    }
}

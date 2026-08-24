#include "tingle/types.h"

/*
 * Overlay 5 draw-pair application. This recovered helper applies a two-word
 * caller-supplied value to one indexed scene draw object.
 */

typedef struct Overlay005DrawPair {
    u8 field_000[0x04];
    s32 first_004;
    s32 second_008;
} Overlay005DrawPair;

#ifdef __cplusplus
extern "C" {
#endif
extern s32 GraphicsSpriteState_HitTestOpaquePixel(void *drawObject, s32 first, s32 second);
#ifdef __cplusplus
}
#endif

/*
 * Load the draw pointer from state +0xC8+index*4. Return zero when it is null;
 * otherwise call GraphicsSpriteState_HitTestOpaquePixel(draw, pair->first_004, pair->second_008) and
 * return its result. The callee owns observable renderer changes and this
 * wrapper performs no direct hardware access.
 */
#ifdef __cplusplus
extern "C"
#endif
s32 func_ov005_021fbdf8(void *state, s32 index, const Overlay005DrawPair *pair)
{
    void *draw = *(void **)((u8 *)state + 0xc8 + index * 4);

    if (draw == 0) {
        return 0;
    }
    return GraphicsSpriteState_HitTestOpaquePixel(draw, pair->first_004, pair->second_008);
}

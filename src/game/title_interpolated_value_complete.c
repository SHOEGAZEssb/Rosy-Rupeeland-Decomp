/* Completion query for the shared signed interpolator. */
#include "tingle/types.h"

typedef struct TitleInterpolatedValue {
    void *vtable;
    s32 mode;
    s32 start;
    s32 end;
    s32 current;
    s32 duration;
    s32 elapsed;
} TitleInterpolatedValue;

/* Report whether the configured duration has elapsed. */
s32 func_02091cf0(TitleInterpolatedValue *value)
{
    return value->elapsed >= value->duration;
}

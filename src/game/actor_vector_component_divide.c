#include "tingle/types.h"

/* Divide the three spatial components of an actor vector into initialized output storage. */
typedef struct ActorVectorValue {
    u32 field_00;
    s32 x_04;
    s32 y_08;
    s32 z_0c;
} ActorVectorValue;

#ifdef __cplusplus
extern "C" {
#endif
extern void func_02004fe0(void *value);
extern s32 func_020adc90(s32 numerator, s32 denominator);
#ifdef __cplusplus
}
#endif

/*
 * Initialize destination, then fixed-point-divide source components +0x04,
 * +0x08, and +0x0c by divisor. Returns no value. func_02004fe0 establishes
 * the vector's runtime metadata, while func_020adc90 supplies SDK-style
 * signed fixed-point division and therefore inherits its zero-divisor rules.
 */
void func_02038784(ActorVectorValue *destination,
                   const ActorVectorValue *source, s32 divisor)
{
    func_02004fe0(destination);
    destination->x_04 = func_020adc90(source->x_04, divisor);
    destination->y_08 = func_020adc90(source->y_08, divisor);
    destination->z_0c = func_020adc90(source->z_0c, divisor);
}

#include "tingle/types.h"
#include "tingle/vec_fx32.h"

/* Vector and paired-resource helpers used by the phase-90 title chain. */

#define FIELD(type, base, offset) (*(type *)((u8 *)(base) + (offset)))

extern void func_020adfbc(const VecFx32Value *left,
                          const VecFx32Value *right,
                          VecFx32Value *destination);

/*
 * Construct `result` and store left minus right through the SDK fixed-point
 * vector boundary. Null inputs remain null rather than being dereferenced.
 */
void func_ov090_0221c138(VecFx32Object *result, const VecFx32Object *left,
                         const VecFx32Object *right)
{
    VecFx32Object_Init(result);
    func_020adfbc(left != 0 ? &left->value : (const VecFx32Value *)left,
                  right != 0 ? &right->value : (const VecFx32Value *)right,
                  &result->value);
}

/* Write the same byte value at +0x3A in both resources bound at +4 and +8. */
void func_ov090_0221c170(void *self, u8 value)
{
    FIELD(u8, FIELD(void *, self, 4), 0x3a) = value;
    FIELD(u8, FIELD(void *, self, 8), 0x3a) = value;
}

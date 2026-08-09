#include "tingle/types.h"

/*
 * Overlay 50 paired-sprite field-effect lifecycle. The recovered object owns
 * a render record, two sprite instances, randomized animation state, and a
 * small polymorphic base. Exact assembly preserves SDK call and RNG ordering.
 */

/*
 * Construct caller-owned `effect`: initialize its render record, vectors, and
 * two sprites from the supplied font/resource owner, select their initial
 * frames, clear counters, and randomize/reset animation through
 * func_ov050_0220d7c4. Return `effect`. SDK sprite/resource and RNG state change;
 * storage is not allocated and no direct MMIO occurs.
 */
extern "C" void *func_ov050_0220d600(void *effect, void *fontState,
                                      void *resourceOwner);

/*
 * Release both sprites and destroy the embedded render/vector records, then
 * return the unchanged effect pointer. SDK sprite and object-owned state
 * change; storage is not freed and no direct hardware access occurs.
 */
extern "C" void *func_ov050_0220d6b0(void *effect);

/*
 * Advance one effect frame: update the embedded animation, choose/apply sprite
 * frames and alpha, integrate the offset-derived transform values, and invoke
 * the shared feedback helper when its timer gate fires. Effect, sprite, and
 * SDK state change; the recovered status is returned and no direct MMIO occurs.
 */
extern "C" s32 func_ov050_0220d6e8(void *effect);

/*
 * Reset/randomize effect motion and animation records using genrand_int32,
 * reconstruct the embedded animation record, and release its prior state in
 * the recovered order. Effect and RNG/SDK animation state change; nothing is
 * returned and no direct MMIO occurs.
 */
extern "C" void func_ov050_0220d7c4(void *effect);

/*
 * Construct an effect in caller-provided storage, apply initial paired-sprite
 * alpha through func_ov050_0220d7ac, and initialize its render record. Return
 * the same pointer. Sprite/SDK state changes; no allocation or direct MMIO occurs.
 */
extern "C" void *func_ov050_0220d824(void *effect, void *fontState,
                                      void *resourceOwner);

/*
 * Run the base-effect teardown through func_ov050_0220d8b4 and return the
 * unchanged pointer. Owned effect state changes; storage is not freed.
 */
extern "C" void *func_ov050_0220d894(void *effect);

/*
 * Release the base effect's optional owned pointer and restore terminal state,
 * freeing that nested allocation through Heap_Free when present. Return the
 * unchanged effect pointer; heap/owned state changes and no MMIO occurs.
 */
extern "C" void *func_ov050_0220d8b4(void *effect);

/*
 * Apply byte-truncated `alpha` to the effect's paired sprites by forwarding to
 * func_ov050_0220d7ac. Sprite/OAM-visible memory changes, nothing is returned,
 * and no direct hardware access occurs.
 */
extern "C" void func_ov050_0220db40(void *effect, u32 alpha);

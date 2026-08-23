#ifndef TINGLE_POINT_2D_S16_H
#define TINGLE_POINT_2D_S16_H

#include "tingle/types.h"

/* CodeWarrior RTTI identifies this value type as CPoint2D<short>. It owns no
 * external state; the vtable provides ordinary and deleting destruction. */
typedef struct CPoint2DS16 {
    const void *vtable;
    s16 x;
    s16 y;
} CPoint2DS16;

typedef char CPoint2DS16SizeCheck[sizeof(CPoint2DS16) == 8 ? 1 : -1];

#ifdef __cplusplus
extern "C" {
#endif

extern const void *gCPoint2DS16VTable[];

CPoint2DS16 *CPoint2DS16_InitFromRectangle(CPoint2DS16 *self,
                                            const void *rectangle);
CPoint2DS16 *CPoint2DS16_InitComponents(CPoint2DS16 *self, s16 x, s16 y);
void CPoint2DS16_Destroy(CPoint2DS16 *self);
CPoint2DS16 *CPoint2DS16_DestroyAndFree(CPoint2DS16 *self);

#ifdef __cplusplus
}
#endif

#endif

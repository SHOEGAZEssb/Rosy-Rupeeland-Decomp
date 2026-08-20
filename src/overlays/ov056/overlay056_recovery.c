#include "tingle/types.h"

/* Overlay 56 streams a four-by-four terrain window from paired grid/archive
 * files into the sub-engine bitmap and maintains its decoded chunk cache. */
#define F(t, b, o) (*(t *)((u8 *)(b) + (o)))
extern const u8 data_ov056_0220f660[], data_ov056_0220f668[];
extern const u8 data_ov056_0220f670[], data_ov056_0220f6a4[];
extern const char data_ov056_0220f6e4[], data_ov056_0220f6ec[];
extern const char data_ov056_0220f6f4[];
extern const u8 data_ov056_0220f6fc[];
extern u8 gHeapContext[];
#ifdef __cplusplus
extern "C" {
#endif
extern void *Heap_Alloc(u32, const void *, s32, void *);
extern void *func_02003e20(u32, const void *, s32, void *);
extern void func_02003e38(void *), Heap_Free(void *), Heap_DestroyRoot(void);
extern void MIi_CpuClear32(s32, void *, u32),
    MIi_CpuClearFast(s32, void *, u32);
extern void MI_UncompressLZ8(const void *, void *);
extern void VecFx32Object_Init(void *), VecFx32Object_Destroy(void *);
extern void VecFx32Object_InitComponents(void *, s32, s32, s32);
extern void VecFx32Object_Assign(void *, const void *);
extern void func_020adff0(const void *, const void *, void *);
extern void GameFile_Init(void *), GameFile_Destroy(void *),
    GameFile_Close(void *);
extern void GameFile_Open(void *, const char *),
    GameFile_Read(void *, void *, u32);
extern void GameFile_Seek(void *, s32, s32), GameFile_Rewind(void *);
extern s32 GameFile_GetLength(void *), GameFile_HasStatusFlag01(void *);
extern void GameString_InitCString(void *, const char *, s32);
extern void GameString_Concat(void *, const void *, const void *);
extern void GameString_Destroy(void *);
extern void *OverlayManager_GetGlobal(void);
extern void OverlayManager_UnloadOverlay(void *, s32);
extern void GXS_SetGraphicsMode(s32);
extern void *func_020af7e8(void);
extern void func_020b57d4(s32, void *, s32), func_020b44e8(void);
extern void func_020b171c(void *, s32, s32), func_020b1a5c(void *, s32, s32);
extern void func_020b1ff0(void *, s32, s32);
#ifdef __cplusplus
}
#endif

void *func_ov056_0220e6b0(void *);
void func_ov056_0220e71c(void *);
void func_ov056_0220e854(void *), func_ov056_0220e890(void *, void *);
s32 func_ov056_0220ec70(void *, s32, s32),
    func_ov056_0220f40c(void *, s32, s32);
void func_ov056_0220eca0(void *, s32, s32), func_ov056_0220f348(void *);
void *func_ov056_0220f458(void *, void *, s32, s32);
s32 func_ov056_0220f4b0(void *);
void func_ov056_0220f558(void *);
void func_ov056_0220f58c(void *, s32, void *, s32, s32);

/* Free an owned array and clear its pointer/count pair. */
void *func_ov056_0220e6b0(void *a) {
  if (F(void *, a, 0))
    func_02003e38(F(void *, a, 0));
  F(void *, a, 0) = 0;
  F(s32, a, 4) = 0;
  return 0;
}
/* Destroy the optional array and return its container. */
void *func_ov056_0220e690(void *a) {
  if (F(void *, a, 0))
    func_ov056_0220e6b0(a);
  return a;
}
/* Initialize an empty cache-list owner. */
void *func_ov056_0220e6dc(void *l) {
  F(const void *, l, 0) = data_ov056_0220f6a4;
  F(void *, l, 4) = F(void *, l, 8) = 0;
  F(s32, l, 12) = 0;
  return l;
}
/* Destroy a cache list without freeing the owner. */
void *func_ov056_0220e6fc(void *l) {
  F(const void *, l, 0) = data_ov056_0220f6a4;
  func_ov056_0220e71c(l);
  return l;
}
/* Release all linked cache-node allocations. */
void func_ov056_0220e71c(void *l) {
  void *n = F(void *, l, 4);
  while (n) {
    void *x = F(void *, n, 0);
    Heap_Free(n);
    n = x;
  }
  F(void *, l, 4) = F(void *, l, 8) = 0;
  F(s32, l, 12) = 0;
}
/* Resize a word array, discarding its old allocation. */
void func_ov056_0220e75c(void *a, s32 n) {
  if (F(void *, a, 0))
    func_ov056_0220e6b0(a);
  F(void *, a, 0) = func_02003e20(n * 4, data_ov056_0220f660, 4, gHeapContext);
  F(s32, a, 4) = n;
}
/* Configure the sub-engine BG2 affine control register. */
void func_ov056_0220e828(s32 p, s32 c, s32 s, s32 z) {
  volatile u16 *r = (volatile u16 *)0x0400100e;
  *r = (u16)((*r & 0x43) | (p << 14) | (c << 7) | (s << 8) | (z << 2));
}
/* Unlink/free one cache node and reset an emptied list. */
void func_ov056_0220e890(void *l, void *n) {
  void *p = F(void *, n, 4), *x = F(void *, n, 0);
  if (n == F(void *, l, 4))
    F(void *, l, 4) = x;
  else
    F(void *, p, 0) = x;
  if (n == F(void *, l, 8))
    F(void *, l, 8) = p;
  else
    F(void *, x, 4) = p;
  Heap_Free(n);
  if (--F(s32, l, 12) == 0)
    func_ov056_0220e71c(l);
}
/* Release every cached chunk and its decoded payload. */
void func_ov056_0220e854(void *s) {
  void *n = F(void *, s, 0x840);
  while (n) {
    void *x = F(void *, n, 0);
    if (F(void *, n, 8))
      Heap_Free(F(void *, n, 8));
    func_ov056_0220e890((u8 *)s + 0x83c, n);
    n = x;
  }
}
/* Map signed world coordinates into the repeating four-by-four cells. */
s32 func_ov056_0220ec70(void *s, s32 x, s32 y) {
  s32 a = x % 4, b = y % 4;
  if (a < 0)
    a += 4;
  if (b < 0)
    b += 4;
  return F(s32 *, s, 0x814)[a + b * 4];
}
/* Return a grid entry or -1 when outside its dimensions. */
s32 func_ov056_0220f40c(void *g, s32 x, s32 y) {
  if (x < 0 || x >= F(s32, g, 8) || y < 0 || y >= F(s32, g, 12))
    return -1;
  return F(u16 *, g, 0)[y * F(s32, g, 8) + x];
}
/* Read and decompress one entry from the two-level archive table. */
void func_ov056_0220f58c(void *d, s32 i, void *f, s32 stride, s32 sub) {
  u8 z[0x1388];
  u32 off, n;
  GameFile_Seek(f, i * 8 + 4, 0);
  GameFile_Read(f, &off, 4);
  GameFile_Read(f, &n, 4);
  GameFile_Seek(f, off + sub * stride * 8 + 4, 0);
  GameFile_Read(f, z, n);
  MI_UncompressLZ8(z, d);
}
/* Decode one cell and submit its 0x800-byte graphics block. */
void func_ov056_0220e8f8(void *s, s32 x, s32 y) {
  void *b = func_02003e20(0x800, data_ov056_0220f6fc, -4, gHeapContext);
  s32 t = func_ov056_0220f40c((u8 *)s + 0x81c, x, y),
      c = func_ov056_0220ec70(s, x, y);
  if (t < 0)
    MIi_CpuClear32(0, b, 0x800);
  else
    func_ov056_0220f58c(b, t, (u8 *)s + 0x84c, F(s32, s, 0x834),
                        F(s32, s, 0x838));
  func_020b44e8();
  func_020b171c(b, c << 11, 0x800);
  func_02003e38(b);
}
/* Initialize one eight-by-eight tile-map cell. */
void func_ov056_0220e9e0(void *s, s32 x, s32 y) {
  s32 r, c, k = func_ov056_0220ec70(s, x, y);
  for (r = 0; r < 8; r++)
    for (c = 0; c < 8; c++)
      F(u16, s, x * 16 + (r + y * 8) * 64 + c * 2 + 4) =
          (u16)(c + r * 8 + k * 64);
}
/* Initialize all sixteen repeating tile-map cells. */
void func_ov056_0220e9a0(void *s) {
  s32 x, y;
  for (y = 0; y < 4; y++)
    for (x = 0; x < 4; x++)
      func_ov056_0220e9e0(s, x, y);
}
/* Find a cached chunk by its two cell coordinates. */
void *func_ov056_0220ed50(void *s, s32 x, s32 y) {
  void *n = F(void *, s, 0x840);
  while (n) {
    void *c = F(void *, n, 8);
    if (F(s32, c, 8) == x && F(s32, c, 12) == y)
      return c;
    n = F(void *, n, 0);
  }
  return 0;
}
/* Construct a chunk header and read the archive dimensions. */
void *func_ov056_0220f458(void *c, void *f, s32 x, s32 y) {
  F(void *, c, 0) = f;
  F(s32, c, 4) = 0;
  F(s32, c, 8) = x;
  F(s32, c, 12) = y;
  MIi_CpuClear32(0, (u8 *)c + 0x10, 0x800);
  GameFile_Rewind(f);
  GameFile_Read(f, (u8 *)c + 0x814, 2);
  GameFile_Read(f, (u8 *)c + 0x816, 2);
  return c;
}
/* Append a newly decoded cache chunk unless the key is already present. */
void func_ov056_0220eca0(void *s, s32 x, s32 y) {
  void *c, *n, *t;
  if (func_ov056_0220ed50(s, x, y))
    return;
  c = Heap_Alloc(0x818, data_ov056_0220f6fc, -4, gHeapContext);
  if (c)
    func_ov056_0220f458(c, (u8 *)s + 0x84c, x, y);
  n = Heap_Alloc(12, data_ov056_0220f670, 4, gHeapContext);
  if (n) {
    F(void *, n, 0) = F(void *, n, 4) = 0;
    F(void *, n, 8) = c;
  }
  t = F(void *, s, 0x844);
  if (t) {
    F(void *, t, 0) = n;
    F(void *, n, 4) = t;
  } else
    F(void *, s, 0x840) = n;
  F(void *, s, 0x844) = n;
  F(s32, s, 0x848)++;
}
/* Stream cache keys newly exposed by a camera-cell change. */
void func_ov056_0220ea40(void *s, s32 x, s32 y) {
  s32 ox = F(s32, s, 0x82c), oy = F(s32, s, 0x830), i, j, c, t;
  if (x - ox >= 4 || ox - x >= 4 || y - oy >= 4 || oy - y >= 4) {
    for (j = 0; j < 4; j++)
      for (i = 0; i < 4; i++)
        func_ov056_0220e8f8(s, x + i, y + j);
    func_ov056_0220e854(s);
    goto d;
  }
  if (x > ox)
    for (i = ox + 1; i <= x; i++)
      for (j = 0; j < 4; j++) {
        c = func_ov056_0220ec70(s, i + 3, y + j);
        t = func_ov056_0220f40c((u8 *)s + 0x81c, i + 3, y + j);
        func_ov056_0220eca0(s, t, c);
      }
  else if (x < ox)
    for (i = ox - 1; i >= x; i--)
      for (j = 0; j < 4; j++) {
        c = func_ov056_0220ec70(s, i, y + j);
        t = func_ov056_0220f40c((u8 *)s + 0x81c, i, y + j);
        func_ov056_0220eca0(s, t, c);
      }
  if (y > oy)
    for (i = oy + 1; i <= y; i++)
      for (j = 0; j < 4; j++) {
        c = func_ov056_0220ec70(s, x + j, i + 3);
        t = func_ov056_0220f40c((u8 *)s + 0x81c, x + j, i + 3);
        func_ov056_0220eca0(s, t, c);
      }
  else if (y < oy)
    for (i = oy - 1; i >= y; i--)
      for (j = 0; j < 4; j++) {
        c = func_ov056_0220ec70(s, x + j, i);
        t = func_ov056_0220f40c((u8 *)s + 0x81c, x + j, i);
        func_ov056_0220eca0(s, t, c);
      }
d:
  F(s32, s, 0x82c) = x;
  F(s32, s, 0x830) = y;
}
/* Toggle the sub-engine BG2 display-enable bit. */
void func_ov056_0220ee20(void *u, s32 on) {
  volatile u32 *r = (volatile u32 *)0x04001000;
  u32 p = (*r >> 8) & 0x1f;
  (void)u;
  p = on ? p | 8 : p & ~8u;
  *r = (*r & ~0x1f00u) | (p << 8);
}
/* Preload the current four-by-four window and arm initial upload. */
void func_ov056_0220ee78(void *s) {
  s32 x, y;
  func_ov056_0220e828(0, 0, 0x1e, 4);
  for (y = 0; y < 4; y++)
    for (x = 0; x < 4; x++)
      func_ov056_0220e8f8(s, F(s32, s, 0x82c) + x, F(s32, s, 0x830) + y);
  F(s32, s, 0x82c) = F(s32, s, 0x830) = -1000;
  F(s32, s, 0x8a8) = 1;
}
/* Publish fixed-point camera plus local offset to sub BG2 scroll. */
void func_ov056_0220eeec(void *s, const void *o) {
  s32 x = (F(s32, s, 0x89c) >> 12) + (F(s32, o, 4) >> 12),
      y = (F(s32, s, 0x8a0) >> 12) + (F(s32, o, 8) >> 12);
  *(volatile u32 *)0x0400101c = (x & 0x1ff) | ((y & 0x1ff) << 16);
}
/* Initialize the displacement between two optional vector objects. */
void *func_ov056_0220f01c(void *o, const void *a, const void *b) {
  VecFx32Object_Init(o);
  func_020adff0(a ? (const u8 *)a + 4 : 0, b ? (const u8 *)b + 4 : 0,
                (u8 *)o + 4);
  return o;
}
/* Store an integer point as the scene's Q12 camera target. */
void func_ov056_0220f054(void *s, const void *p) {
  u8 v[16];
  VecFx32Object_Init(v);
  F(s32, v, 4) = F(s32, p, 4) << 12;
  F(s32, v, 8) = F(s32, p, 8) << 12;
  F(s32, v, 12) = 0;
  VecFx32Object_Assign((u8 *)s + 0x898, v);
  VecFx32Object_Destroy(v);
}
/* Clear a grid's allocation and dimensions. */
void *func_ov056_0220f330(void *g) {
  F(s32, g, 0) = F(s32, g, 4) = F(s32, g, 8) = F(s32, g, 12) = 0;
  return g;
}
/* Free a grid backing array and clear its pointer/count. */
void func_ov056_0220f348(void *g) {
  if (F(void *, g, 0))
    func_02003e38(F(void *, g, 0));
  F(void *, g, 0) = 0;
  F(s32, g, 4) = 0;
}
/* Resize and index-initialize a width-by-height halfword grid. */
void func_ov056_0220f374(void *g, s32 w, s32 h) {
  s32 i, n = w * h;
  F(s32, g, 8) = w;
  F(s32, g, 12) = h;
  if (F(void *, g, 0))
    func_ov056_0220f348(g);
  F(void *, g, 0) = func_02003e20(n * 2, data_ov056_0220f668, 4, gHeapContext);
  F(s32, g, 4) = n;
  for (i = 0; i < n; i++)
    F(u16 *, g, 0)[i] = (u16)i;
}
/* Destroy a grid owner and return it. */
void *func_ov056_0220f3e4(void *g) {
  func_ov056_0220f348(g);
  if (F(void *, g, 0))
    func_ov056_0220f348(g);
  return g;
}
/* Write a clipped packed pixel into the destination bitmap. */
void func_ov056_0220f298(void *u, void *d, s32 x, s32 y, u16 v) {
  (void)u;
  if (x >= 0 && x < 128 && y >= 0 && y < 256)
    ((u16 *)((u8 *)d + y * 256))[x] = v;
}
/* Read one nibble from a 32-byte-tiled 4-bit image. */
u8 func_ov056_0220f2c8(void *u, const u8 *s, s32 x, s32 y) {
  s32 tx = x / 8, ty = y / 8, ix = x % 8, iy = y % 8;
  u8 v;
  (void)u;
  v = s[tx * 32 + ty * 256 + iy * 4 + ix / 2];
  return (ix & 1) ? v >> 4 : v & 15;
}
/* Expand a decoded 64x64 tile into packed palette indices. */
void func_ov056_0220f200(void *s, void *d, const u8 *b, s32 x, s32 y) {
  s32 r, c;
  for (r = 0; r < 64; r++)
    for (c = 0; c < 32; c++) {
      u16 v = (u16)(func_ov056_0220f2c8(s, b, c * 2, r) |
                    (func_ov056_0220f2c8(s, b, c * 2 + 1, r) << 8));
      func_ov056_0220f298(s, d, x / 2 + c, y + r, v);
    }
}
/* Advance one chunk through request, decode, and completion states. */
s32 func_ov056_0220f4b0(void *c) {
  switch (F(s32, c, 4)) {
  case 0:
    if (GameFile_HasStatusFlag01(F(void *, c, 0)))
      break;
    F(s32, c, 4) = 1;
  case 1:
    if (F(s32, c, 8) >= 0) {
      func_ov056_0220f58c((u8 *)c + 0x10, F(s32, c, 8), F(void *, c, 0),
                          F(u16, c, 0x814), F(u16, c, 0x816));
      func_020b44e8();
    }
    F(s32, c, 0x810) = 1;
    F(s32, c, 4) = 2;
    break;
  case 2:
    if (!F(s32, c, 0x810))
      return 1;
  }
  return 0;
}
/* Submit and clear a chunk's pending decoded tile. */
void func_ov056_0220f558(void *c) {
  if (F(s32, c, 0x810)) {
    F(s32, c, 0x810) = 0;
    func_020b171c((u8 *)c + 0x10, F(s32, c, 12) << 11, 0x800);
  }
}
/* Rebuild the visible 320x320 source window in the destination bitmap. */
void func_ov056_0220f0ac(void *s, void *d, s32 x, s32 y) {
  s32 a, b;
  func_020b1ff0(F(void *, s, 0), 0, 0x20);
  MIi_CpuClearFast(0, d, 0x20000);
  for (b = 0; b < 0x140; b += 0x40)
    for (a = 0; a < 0x140; a += 0x40) {
      s32 wx = x + a, wy = y + b, gx = wx < 0 ? (wx - 0x40) / 0x40 : wx / 0x40,
          gy = wy < 0 ? (wy - 0x40) / 0x40 : wy / 0x40,
          t = func_ov056_0220f40c((u8 *)s + 0x81c, gx, gy);
      void *q = func_02003e20(0x800, data_ov056_0220f6fc, -4, gHeapContext);
      if (t < 0)
        MIi_CpuClear32(0, q, 0x800);
      else
        func_ov056_0220f58c(q, t, (u8 *)s + 0x84c, F(s32, s, 0x834),
                            F(s32, s, 0x838));
      func_ov056_0220f200(s, d, (const u8 *)q, gx * 64 - x, gy * 64 - y);
      func_02003e38(q);
    }
}
/* Update camera streaming and retire chunks whose transfer completed. */
void func_ov056_0220ef34(void *s, const void *c) {
  u8 v[16];
  void *n;
  VecFx32Object_Assign((u8 *)s + 0x804, c);
  func_ov056_0220f01c(v, (u8 *)s + 0x804, (u8 *)s + 0x898);
  {
    s32 x = F(s32, v, 4) >> 12, y = F(s32, v, 8) >> 12,
        cx = x < 0 ? ((x + 63) >> 6) - 1 : (x + 63) >> 6,
        cy = y < 0 ? ((y + 63) >> 6) - 1 : (y + 63) >> 6;
    func_ov056_0220ea40(s, cx, cy);
  }
  n = F(void *, s, 0x840);
  while (n) {
    void *z = F(void *, n, 0), *q = F(void *, n, 8);
    if (func_ov056_0220f4b0(q)) {
      if (q)
        Heap_Free(q);
      func_ov056_0220e890((u8 *)s + 0x83c, n);
    }
    n = z;
  }
  VecFx32Object_Destroy(v);
}
/* Update cached transfers, initial upload, and sub-screen scroll. */
s32 func_ov056_0220ed9c(void *s) {
  void *n = F(void *, s, 0x840);
  while (n) {
    func_ov056_0220f558(F(void *, n, 8));
    n = F(void *, n, 0);
  }
  if (F(s32, s, 0x8a8)) {
    F(s32, s, 0x8a8) = 0;
    func_020b1a5c((u8 *)s + 4, 0, 0x800);
    func_020b1ff0(F(void *, s, 0), 0, 0x20);
  }
  func_ov056_0220eeec(s, (u8 *)s + 0x804);
  return 0;
}
/* Destroy every file, vector, grid, array, and cached-chunk resource. */
void *func_ov056_0220e79c(void *s) {
  func_02003e38(F(void *, s, 0));
  func_ov056_0220e854(s);
  GameFile_Close((u8 *)s + 0x84c);
  OverlayManager_UnloadOverlay(OverlayManager_GetGlobal(), 1);
  VecFx32Object_Destroy((u8 *)s + 0x898);
  GameFile_Destroy((u8 *)s + 0x84c);
  F(const void *, s, 0x83c) = data_ov056_0220f6a4;
  func_ov056_0220e71c((u8 *)s + 0x83c);
  func_ov056_0220f3e4((u8 *)s + 0x81c);
  func_ov056_0220e690((u8 *)s + 0x814);
  VecFx32Object_Destroy((u8 *)s + 0x804);
  return s;
}
/* Deleting destructor for a standalone cache-list owner. */
void *func_ov056_0220f62c(void *l) {
  F(const void *, l, 0) = data_ov056_0220f6a4;
  func_ov056_0220e71c(l);
  Heap_Free(l);
  return l;
}
/* Construct the terrain streamer from its metadata and archive files. */
void *func_ov056_0220e400(void *s, const char *dir, s32 show) {
  u8 f[0x4c], a[8], b[8], p[8], v[16];
  u16 w, h;
  s32 i, j, n;
  VecFx32Object_Init((u8 *)s + 0x804);
  F(s32, s, 0x814) = F(s32, s, 0x818) = 0;
  func_ov056_0220f330((u8 *)s + 0x81c);
  F(s32, s, 0x82c) = F(s32, s, 0x830) = F(s32, s, 0x834) = F(s32, s, 0x838) = 0;
  func_ov056_0220e6dc((u8 *)s + 0x83c);
  GameFile_Init((u8 *)s + 0x84c);
  VecFx32Object_Init((u8 *)s + 0x898);
  F(s32, s, 0x8a8) = 0;
  Heap_DestroyRoot();
  GameFile_Init(f);
  GameString_InitCString(a, dir, 0);
  GameString_InitCString(b, data_ov056_0220f6e4, 0);
  GameString_Concat(p, a, b);
  GameFile_Open(f, F(const char *, p, 4));
  GameString_Destroy(p);
  GameString_Destroy(b);
  n = GameFile_GetLength(f);
  F(void *, s, 0) = func_02003e20(n * 2, data_ov056_0220f6ec, 4, gHeapContext);
  GameFile_Read(f, F(void *, s, 0), n);
  GameFile_Close(f);
  GameString_InitCString(b, data_ov056_0220f6f4, 0);
  GameString_Concat(p, a, b);
  GameFile_Open((u8 *)s + 0x84c, F(const char *, p, 4));
  GameString_Destroy(p);
  GameString_Destroy(b);
  GameFile_Read((u8 *)s + 0x84c, &w, 2);
  GameFile_Read((u8 *)s + 0x84c, &h, 2);
  F(s32, s, 0x834) = w;
  F(s32, s, 0x838) = h;
  func_ov056_0220f374((u8 *)s + 0x81c, w, h);
  func_ov056_0220e75c((u8 *)s + 0x814, 16);
  for (j = 0; j < 4; j++)
    for (i = 0; i < 4; i++)
      F(s32 *, s, 0x814)[i + j * 4] = i + j * 4;
  VecFx32Object_InitComponents(v, 0, 0, 0);
  VecFx32Object_Assign((u8 *)s + 0x804, v);
  VecFx32Object_Destroy(v);
  func_ov056_0220e9a0(s);
  if (show) {
    GXS_SetGraphicsMode(0);
    func_ov056_0220e828(0, 0, 0x1e, 4);
    func_ov056_0220ee78(s);
  }
  func_020b57d4(0, func_020af7e8(), 0x8000);
  GameString_Destroy(a);
  GameFile_Destroy(f);
  return s;
}

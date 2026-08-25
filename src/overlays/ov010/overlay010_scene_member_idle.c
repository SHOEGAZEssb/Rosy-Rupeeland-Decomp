#include "tingle/types.h"
/* Overlay 10 scene-member idle callback. */
#ifdef __cplusplus
extern "C" {
#endif
extern const void *data_ov010_021fea38[]; extern void Overlay010_InitSceneFields(void *,s32,s32,s32);
#ifdef __cplusplus
}
#endif
/* If state +0x28 is zero, initialize embedded +0x24 from descriptor entries +0x28/+0x2C-0x48; return zero and delegate member effects. */
#ifdef __cplusplus
extern "C"
#endif
s32 Overlay010_IdleSceneMember(void *s){if(*(s32 *)((u8 *)s+0x28)==0)Overlay010_InitSceneFields((u8 *)s+0x24,(s32)data_ov010_021fea38[10],(s32)data_ov010_021fea38[11]-0x48,0);return 0;}

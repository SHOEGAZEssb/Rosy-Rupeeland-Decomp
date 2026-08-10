#include "tingle/heap.h"
#include "tingle/random.h"
#include "tingle/types.h"

/* Build descriptor-indexed resource objects and the primary actor attachment. */
extern u16 data_020e78f4[];
extern u16 data_020e7c78[];
extern u16 data_020e7570[];
extern u16 data_020e7ffc[];
extern u8 data_020e8394[];
extern const char data_020e00c0[];

#ifdef __cplusplus
extern "C" {
#endif
extern void *AnimationResource_Init(void *allocation, u16 first, u16 second, u16 third);
extern void *Actor_GetCollection(void *actor);
extern void *ActorCollection_GetSpriteOwner(void *value);
extern void *func_02073fc4(void *context, u32 first, u32 second, u32 third,
                           s32 kind);
extern void func_02072b68(void *attachment, u32 animation);
extern void func_020313b4(void *actor, void *resource, u8 value);
#ifdef __cplusplus
}
#endif

/* Allocate a 16-byte object and initialize it from one three-halfword record. */
static void *createResource(const u16 *record)
{
    void *allocation = Heap_Alloc(0x10, data_020e00c0, 4, &gHeapContext);
    if (allocation != 0)
        allocation = AnimationResource_Init(allocation, record[0], record[1], record[2]);
    return allocation;
}

/*
 * Use actor index +0x4e to select six-byte records from data_020e78f4 and
 * data_020e7c78, creating resources +0x208/+0x20c. Records from data_020e7570
 * and data_020e7ffc create optional +0x210/+0x214 resources only when their
 * first halfword is nonzero. Resolve Actor_GetCollection then ActorCollection_GetSpriteOwner and build
 * attachment +0x54 through func_02073fc4 using words +0x04/+0x08/+0x0c of the
 * first resource and kind two.
 *
 * Normally select attachment animation eight. Index 0x30 instead samples the
 * RNG, stores its low 16 bits in +0xc8/+0xcc, derives bytes +0xd4/+0xd5 from
 * (sample+0x1000 truncated to 16 bits)>>13, and selects that value plus eight.
 * Invoke virtual +0x14, pass config byte +0x10 and resource +0x208 through
 * func_020313b4, and when actor +0x14 bit 0x80 is set copy config halfword +0x3c
 * to attachment byte +0x3a. If +0x272 bits 0x1800 are set or +0x250 is zero,
 * invoke virtual +0xfc and copy the descriptor table halfword at index*0x30
 * into +0x24e; otherwise decrement a positive +0x250. Returns no value; heap,
 * RNG, attachment, virtual, and actor presentation state may change.
 */
void ActorExtendedType2_InitializePresentation(void *self, const void *configuration)
{
    u8 *actor = (u8 *)self;
    const u8 *config = (const u8 *)configuration;
    u16 index = *(u16 *)(actor + 0x4e);
    const u16 *record;
    void *context;
    u8 *attachment;

    record = data_020e78f4 + index * 3;
    *(void **)(actor + 0x208) = createResource(record);
    record = data_020e7c78 + index * 3;
    *(void **)(actor + 0x20c) = createResource(record);
    record = data_020e7570 + index * 3;
    *(void **)(actor + 0x210) = record[0] != 0 ? createResource(record) : 0;
    record = data_020e7ffc + index * 3;
    *(void **)(actor + 0x214) = record[0] != 0 ? createResource(record) : 0;

    context = ActorCollection_GetSpriteOwner(Actor_GetCollection(actor));
    {
        u32 *resource = (u32 *)*(void **)(actor + 0x208);
        attachment = (u8 *)func_02073fc4(context, resource[1], resource[2],
                                         resource[3], 2);
    }
    *(u8 **)(actor + 0x54) = attachment;
    if (index == 0x30) {
        u32 random = genrand_int32();
        u16 sample = (u16)random;
        u16 wrapped = (u16)(sample + 0x1000);
        s32 choice = wrapped >> 13;
        *(u32 *)(actor + 0xcc) = sample;
        *(u32 *)(actor + 0xc8) = sample;
        actor[0xd5] = (u8)choice;
        actor[0xd4] = (u8)choice;
        func_02072b68(attachment, (u8)(choice + 8));
    } else {
        func_02072b68(attachment, 8);
    }

    (*(void (**)(void *))(*(u8 **)actor + 0x14))(actor);
    func_020313b4(actor, *(void **)(actor + 0x208), config[0x10]);
    if ((*(u32 *)(actor + 0x14) & 0x80) != 0)
        attachment[0x3a] = (u8)*(s16 *)(config + 0x3c);

    if ((*(u16 *)(actor + 0x272) & 0x1800) != 0 ||
        *(s16 *)(actor + 0x250) == 0) {
        (*(void (**)(void *))(*(u8 **)actor + 0xfc))(actor);
        *(u16 *)(actor + 0x24e) =
            *(u16 *)(data_020e8394 + index * 0x30);
    } else if (*(s16 *)(actor + 0x250) > 0) {
        --*(s16 *)(actor + 0x250);
    }
}

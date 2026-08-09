#include "tingle/types.h"

/*
 * Overlay 44 graphics-resource setup. These recovered helpers load temporary
 * resource sets from the scene archive and upload palette/tile data to the
 * Nintendo DS graphics engines before destroying the temporary descriptors.
 */

typedef struct GraphicsResourceSet {
    u32 fields[3];
} GraphicsResourceSet;

extern "C" void *data_020f4e18;
extern "C" void GraphicsResourceSet_Init(GraphicsResourceSet *set);
extern "C" void GraphicsResourceSet_Load(GraphicsResourceSet *set,
                                           void *archive, s32 first,
                                           s32 second, s32 third);
extern "C" void GraphicsResourceSet_Apply(GraphicsResourceSet *set,
                                            s32 destination, s32 offset);
extern "C" void GraphicsResourceSet_Destroy(GraphicsResourceSet *set);
extern "C" void func_02070f80(void *resource, s32 value);
extern "C" void func_020b44e8(void);
extern "C" void func_02072048(GraphicsResourceSet *set, s32 destination,
                                s32 offset);
extern "C" void func_02070eac(void *resource, s32 destination, s32 offset);
extern "C" void func_ov044_0220c3e4(void *object);

/*
 * Load resource groups 0x8004..0x8006, 0x8012..0x8014, and 0x8012..0x801A
 * into two temporary descriptors. Confirmed effects include setting value 8
 * on the first set's third resource, uploading that set to destination 3 at
 * offset 0x100, applying the later sets to destination zero, applying the
 * second set's third resource to destination 2, and invoking the auxiliary
 * upload performed by func_ov044_0220c3e4. Both temporary sets are destroyed;
 * the scene pointer is otherwise only forwarded and no value is returned.
 */
extern "C" void func_ov044_0220c2e4(void *object)
{
    GraphicsResourceSet first;
    GraphicsResourceSet second;
    GraphicsResourceSet_Init(&first);
    GraphicsResourceSet_Init(&second);
    GraphicsResourceSet_Load(&first, data_020f4e18,
                             0x8004, 0x8005, 0x8006);
    func_02070f80((void *)first.fields[2], 8);
    func_020b44e8();
    func_02072048(&first, 3, 0x100);
    GraphicsResourceSet_Apply(&first, 3, 0x100);
    GraphicsResourceSet_Load(&first, data_020f4e18,
                             0x8012, 0x8013, 0x8014);
    GraphicsResourceSet_Load(&second, data_020f4e18,
                             0x8012, 0x8013, 0x801a);
    func_020b44e8();
    GraphicsResourceSet_Apply(&first, 0, 0);
    func_02070eac((void *)second.fields[2], 2, 0);
    func_ov044_0220c3e4(object);
    GraphicsResourceSet_Destroy(&second);
    GraphicsResourceSet_Destroy(&first);
}

/*
 * Load temporary resource group 0x8012/0x8013/0x8017, select graphics engine
 * destination 2, upload it at offset zero, then destroy the descriptor. The
 * recovered object parameter is unused and no value is returned.
 */
extern "C" void func_ov044_0220c3e4(void *object)
{
    (void)object;
    GraphicsResourceSet set;
    GraphicsResourceSet_Init(&set);
    GraphicsResourceSet_Load(&set, data_020f4e18,
                             0x8012, 0x8013, 0x8017);
    func_020b44e8();
    func_02072048(&set, 2, 0);
    GraphicsResourceSet_Destroy(&set);
}

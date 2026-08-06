#include "tingle/types.h"

/*
 * Recovered ARM9 static-initialization block. These compiler-generated entry
 * points construct global objects and register their shutdown destructors in
 * the retail initialization order.
 */
typedef void (*GlobalObjectRoutine)(void *);

#ifdef __cplusplus
extern "C" {
#endif
extern void __register_global_object(void *object,
                                     GlobalObjectRoutine destructor,
                                     void *record);
extern void __construct_array(void *array, u32 count, u32 elementSize,
                              GlobalObjectRoutine constructor,
                              GlobalObjectRoutine destructor);

extern void func_02001d10(void *);
extern void func_02001d30(void *);
extern void func_02002068(void *);
extern void func_020020a0(void *);
extern void func_02002cdc(void *);
extern void func_02002d24(void *);
extern void MainBgPaletteBuffer_Init(void *);
extern void MainBgPaletteBuffer_Destroy(void *);
extern void SubBgPaletteBuffer_Init(void *);
extern void SubBgPaletteBuffer_Destroy(void *);
extern void MainBgExtendedPaletteBuffer_Init(void *);
extern void MainBgExtendedPaletteBuffer_Destroy(void *);
extern void SubBgExtendedPaletteBuffer_Init(void *);
extern void SubBgExtendedPaletteBuffer_Destroy(void *);
extern void func_0200ad90(void *);
extern void func_0200ae10(void *);
extern void func_020083b0(void *, s32, s32, s32, s32);
extern void func_02004ac8(void *);
extern void func_02092364(void *);
extern void func_020923a0(void *);
extern void func_02059a48(void *);
extern void func_02059a64(void *);
extern void func_02059a68(void *);
extern void func_020645d8(void *);
extern void func_020646cc(void *);
extern void func_02022fbc(void *);
extern void func_0206f750(void *);
extern void func_0206f760(void *);
extern void func_0206fbb0(void *);
extern void func_0206fbe8(void *);
extern void func_0206fd78(void *);
extern void func_0206fdd8(void *);
extern void func_02072aec(void *);
extern void func_020766cc(void *);
extern void func_020766d0(void *);
extern void func_020787bc(void *);
extern void func_020787c0(void *);
extern void func_0207a064(void *);
extern void func_0207a10c(void *);
extern void func_0207a13c(void *);
extern void func_0207a14c(void *);
extern void func_0207a16c(void *);
extern void func_0207a17c(void *);
extern void func_0207c38c(void *);
extern void func_0207c424(void *);
extern void func_02082890(void *);
extern void func_0208289c(void *);
extern void func_020983c8(void *);
extern void func_02098450(void *);

extern u8 gFrameTaskList[];
extern u8 data_020f3784[];
extern u8 data_020f37ac[];
extern u8 data_020f37a0[];
extern u8 data_020f4dc8[];
extern u8 data_020f4dbc[];
extern u8 data_020f4e50[];
extern u8 data_020f4e2c[];
extern u8 data_020f5058[];
extern u8 data_020f4e20[];
extern u8 data_020f5260[];
extern u8 data_020f4e38[];
extern u8 data_020fd268[];
extern u8 data_020f4e44[];
extern u8 data_02105310[];
extern u8 data_02105304[];
extern u8 data_021055b8[];
extern u8 data_021055ac[];
extern u8 data_021055c0[];
extern u8 data_021055a0[];
extern u8 data_021055dc[];
extern u8 data_021055d0[];
extern u8 data_0210588c[];
extern u8 data_02105864[];
extern u8 data_0210587c[];
extern u8 data_02105870[];
extern u8 data_021e9ad0[];
extern u8 data_021e9ac4[];
extern u8 data_021e9db8[];
extern u8 data_021e9de8[];
extern u8 data_021e9ddc[];
extern u8 data_021e9e00[];
extern u8 data_021e9df4[];
extern u8 data_021e9e1c[];
extern u8 data_021e9e10[];
extern u8 data_021edea0[];
extern u8 data_021ede74[];
extern u8 data_021f38fc[];
extern u8 data_021f38f0[];
extern u8 data_021f3ecc[];
extern u8 data_021f3d44[];
extern u8 data_021f4090[];
extern u8 data_021f3d50[];
extern u8 data_021f3d68[];
extern u8 data_021f3d5c[];
extern u8 data_021f5138[];
extern u8 data_021f512c[];
extern u8 data_021f5ebc[];
extern u8 data_021f5ec0[];
extern u8 data_021f5f18[];
extern u8 data_021f5f0c[];
#ifdef __cplusplus
}
#endif

/*
 * No inputs. Construct gFrameTaskList and register func_02001d30 with record
 * data_020f3784 for shutdown. Global task-list lifetime state changes; the
 * routine returns no value and has no direct hardware effect.
 */
void __sinit_020c1374(void)
{
    func_02001d10(gFrameTaskList);
    __register_global_object(gFrameTaskList, func_02001d30, data_020f3784);
}

/*
 * No inputs. Construct data_020f37ac and register func_020020a0 with record
 * data_020f37a0. Global timer-bank lifetime state changes; no value is returned
 * and no SDK or hardware service is called directly.
 */
void __sinit_020c13a0(void)
{
    func_02002068(data_020f37ac);
    __register_global_object(data_020f37ac, func_020020a0, data_020f37a0);
}

/*
 * No inputs. Construct data_020f4dc8 and register func_02002d24 with record
 * data_020f4dbc. Global subsystem lifetime state changes; this routine returns
 * no value and has no direct hardware effect.
 */
void __sinit_020c13cc(void)
{
    func_02002cdc(data_020f4dc8);
    __register_global_object(data_020f4dc8, func_02002d24, data_020f4dbc);
}

/*
 * No inputs. Construct the main/sub standard and extended background-palette
 * buffers, registering each matching destructor and its adjacent lifetime
 * record. Four global buffer lifetimes change; constructors may initialize
 * presentation state, but this wrapper has no direct hardware access or return.
 */
void __sinit_020c13f8(void)
{
    MainBgPaletteBuffer_Init(data_020f4e50);
    __register_global_object(data_020f4e50, MainBgPaletteBuffer_Destroy,
                             data_020f4e2c);
    SubBgPaletteBuffer_Init(data_020f5058);
    __register_global_object(data_020f5058, SubBgPaletteBuffer_Destroy,
                             data_020f4e20);
    MainBgExtendedPaletteBuffer_Init(data_020f5260);
    __register_global_object(data_020f5260,
                             MainBgExtendedPaletteBuffer_Destroy,
                             data_020f4e38);
    SubBgExtendedPaletteBuffer_Init(data_020fd268);
    __register_global_object(data_020fd268,
                             SubBgExtendedPaletteBuffer_Destroy,
                             data_020f4e44);
}

/*
 * No inputs. Construct data_02105310 and register func_0200ae10 with record
 * data_02105304. Global object lifetime state changes; no value is returned and
 * no hardware is accessed directly.
 */
void __sinit_020c1490(void)
{
    func_0200ad90(data_02105310);
    __register_global_object(data_02105310, func_0200ae10, data_02105304);
}

/*
 * No inputs. Initialize data_021055b8 with recovered values
 * (0,0,0x400,0x300) and data_021055c0 with five zeros, then register
 * func_02004ac8 for each using records data_021055ac/data_021055a0. Both
 * global object lifetimes change; no value or direct hardware effect occurs.
 */
void __sinit_020c14bc(void)
{
    func_020083b0(data_021055b8, 0, 0, 0x400, 0x300);
    __register_global_object(data_021055b8, func_02004ac8, data_021055ac);
    func_020083b0(data_021055c0, 0, 0, 0, 0);
    __register_global_object(data_021055c0, func_02004ac8, data_021055a0);
}

/*
 * No inputs. Construct data_021055dc and register func_020923a0 with record
 * data_021055d0. Global lifetime state changes; no value is returned and no
 * direct hardware access occurs.
 */
void __sinit_020c152c(void)
{
    func_02092364(data_021055dc);
    __register_global_object(data_021055dc, func_020923a0, data_021055d0);
}

/*
 * No inputs. Construct 32 elements of size 0x10 at data_0210588c using
 * func_02059a48/func_02059a64 and register the array destructor thunk
 * func_02059a68 with a null object and record data_02105864. Then construct
 * data_0210587c and register func_02059a64 with data_02105870. Global array and
 * singleton lifetimes change; no value or direct hardware effect occurs.
 */
void __sinit_020c1558(void)
{
    __construct_array(data_0210588c, 0x20, 0x10,
                      func_02059a48, func_02059a64);
    __register_global_object(0, func_02059a68, data_02105864);
    func_02059a48(data_0210587c);
    __register_global_object(data_0210587c, func_02059a64, data_02105870);
}

/*
 * No inputs. Construct data_021e9ad0 and register func_020646cc with record
 * data_021e9ac4. Global lifetime state changes; this routine returns no value
 * and has no direct hardware effect.
 */
void __sinit_020c15c0(void)
{
    func_020645d8(data_021e9ad0);
    __register_global_object(data_021e9ad0, func_020646cc, data_021e9ac4);
}

/*
 * No inputs. Initialize data_021e9db8 by calling func_02022fbc. The retail body
 * is a tail call. Global configuration state changes; no value is returned and
 * no direct SDK or hardware effect is introduced here.
 */
void __sinit_020c15ec(void)
{
    func_02022fbc(data_021e9db8);
}

/*
 * No inputs. Construct data_021e9de8 and register func_0206f760 with record
 * data_021e9ddc. Global lifetime state changes; no value or direct hardware
 * effect occurs.
 */
void __sinit_020c1600(void)
{
    func_0206f750(data_021e9de8);
    __register_global_object(data_021e9de8, func_0206f760, data_021e9ddc);
}

/*
 * No inputs. Construct data_021e9e00 and register func_0206fbe8 with record
 * data_021e9df4. Global lifetime state changes; no value is returned and no
 * hardware is accessed directly.
 */
void __sinit_020c162c(void)
{
    func_0206fbb0(data_021e9e00);
    __register_global_object(data_021e9e00, func_0206fbe8, data_021e9df4);
}

/*
 * No inputs. Construct data_021e9e1c and register func_0206fdd8 with record
 * data_021e9e10. Global lifetime state changes; no value or direct hardware
 * effect occurs.
 */
void __sinit_020c1658(void)
{
    func_0206fd78(data_021e9e1c);
    __register_global_object(data_021e9e1c, func_0206fdd8, data_021e9e10);
}

/*
 * No inputs. Construct 384 elements of size 0x3c at data_021edea0 using
 * func_02072aec/func_020766cc, then register array destructor thunk
 * func_020766d0 with a null object and record data_021ede74. Global pool
 * lifetime state changes; no value or direct hardware effect occurs.
 */
void __sinit_020c1684(void)
{
    __construct_array(data_021edea0, 0x180, 0x3c,
                      func_02072aec, func_020766cc);
    __register_global_object(0, func_020766d0, data_021ede74);
}

/*
 * No inputs. Construct data_021f38fc and register func_020787c0 with record
 * data_021f38f0. Global lifetime state changes; no value or direct hardware
 * effect occurs.
 */
void __sinit_020c16cc(void)
{
    func_020787bc(data_021f38fc);
    __register_global_object(data_021f38fc, func_020787c0, data_021f38f0);
}

/*
 * No inputs. Construct three globals in retail order: data_021f3ecc,
 * data_021f4090, and data_021f3d68. Register their respective destructors
 * func_0207a10c, func_0207a14c, and func_0207a17c with records
 * data_021f3d44/data_021f3d50/data_021f3d5c. Global lifetimes change; no value
 * is returned and no direct hardware effect occurs.
 */
void __sinit_020c16f8(void)
{
    func_0207a064(data_021f3ecc);
    __register_global_object(data_021f3ecc, func_0207a10c, data_021f3d44);
    func_0207a13c(data_021f4090);
    __register_global_object(data_021f4090, func_0207a14c, data_021f3d50);
    func_0207a16c(data_021f3d68);
    __register_global_object(data_021f3d68, func_0207a17c, data_021f3d5c);
}

/*
 * No inputs. Construct data_021f5138 and register func_0207c424 with record
 * data_021f512c. Global lifetime state changes; no value or direct hardware
 * effect occurs.
 */
void __sinit_020c176c(void)
{
    func_0207c38c(data_021f5138);
    __register_global_object(data_021f5138, func_0207c424, data_021f512c);
}

/*
 * No inputs. Construct data_021f5ebc and register func_0208289c with record
 * data_021f5ec0. Global lifetime state changes; no value is returned and no
 * hardware is accessed directly.
 */
void __sinit_020c1798(void)
{
    func_02082890(data_021f5ebc);
    __register_global_object(data_021f5ebc, func_0208289c, data_021f5ec0);
}

/*
 * No inputs. Construct data_021f5f18 and register func_02098450 with record
 * data_021f5f0c. Global lifetime state changes; no value or direct hardware
 * effect occurs.
 */
void __sinit_020c17c4(void)
{
    func_020983c8(data_021f5f18);
    __register_global_object(data_021f5f18, func_02098450, data_021f5f0c);
}

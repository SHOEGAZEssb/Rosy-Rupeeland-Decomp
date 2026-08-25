/*
 * Scene-facing NitroSDK VRAM-bank snapshot and restore helpers. The snapshot
 * contains the thirteen SDK ownership domains in the exact order consumed by
 * the retail restore routine; each entry is widened to 32 bits.
 */
#include "tingle/types.h"

#ifdef __cplusplus
extern "C" {
#endif

extern u32 GX_VBlankIntr(u32 enabled);
extern u32 func_020ae668(void);
extern u32 func_020ae658(void);
extern u32 func_020ae648(void);
extern u32 func_020ae638(void);
extern u32 func_020ae628(void);
extern u32 func_020ae618(void);
extern u32 func_020ae608(void);
extern u32 func_020ae5d8(void);
extern u32 func_020ae5c8(void);
extern u32 func_020ae5b8(void);
extern u32 func_020ae5a8(void);
extern u32 func_020ae5f8(void);
extern u32 func_020ae5e8(void);

extern void func_020ae7b0(void);
extern void func_020ae79c(void);
extern void func_020ae778(void);
extern void func_020ae754(void);
extern void func_020ae740(void);
extern void func_020ae72c(void);
extern void func_020ae718(void);
extern void func_020ae6dc(void);
extern void func_020ae6c8(void);
extern void func_020ae6a0(void);
extern void func_020ae678(void);
extern void func_020ae704(void);
extern void GX_DisableBankForLCDC(void);

extern void GX_SetBankForBG(u32 banks);
extern void func_020af30c(u32 banks);
extern void func_020af1f8(u32 banks);
extern void func_020af140(u32 banks);
extern void func_020aef3c(u32 banks);
extern void func_020aee48(u32 banks);
extern void func_020aed08(u32 banks);
extern void GX_SetBankForSubBG(u32 banks);
extern void func_020aeb08(u32 banks);
extern void func_020aea7c(u32 banks);
extern void func_020ae9f0(u32 banks);
extern void func_020aec50(u32 banks);
extern void GX_SetBankForLCDC(u32 banks);

#ifdef __cplusplus
}
#endif

/* Query every NitroSDK ownership domain and write thirteen u32 entries to the
 * caller-owned 0x34-byte snapshot. No hardware state is changed. */
void GraphicsBankStateSnapshot_Capture(u32 *snapshot)
{
    snapshot[0] = func_020ae668();
    snapshot[1] = func_020ae658();
    snapshot[2] = func_020ae648();
    snapshot[3] = func_020ae638();
    snapshot[4] = func_020ae628();
    snapshot[5] = func_020ae618();
    snapshot[6] = func_020ae608();
    snapshot[7] = func_020ae5d8();
    snapshot[8] = func_020ae5c8();
    snapshot[9] = func_020ae5b8();
    snapshot[10] = func_020ae5a8();
    snapshot[11] = func_020ae5f8();
    snapshot[12] = func_020ae5e8();
}

/* Restore a snapshot captured by GraphicsBankStateSnapshot_Capture. Changed ownership domains are
 * disabled before every saved assignment is reapplied. VBlank IRQ delivery is
 * suppressed for the complete hardware transition and restored on return. */
void GraphicsBankStateSnapshot_Restore(const u32 *snapshot)
{
    u32 interruptState = GX_VBlankIntr(0);

    if (snapshot[0] != func_020ae668()) func_020ae7b0();
    if (snapshot[1] != func_020ae658()) func_020ae79c();
    if (snapshot[2] != func_020ae648()) func_020ae778();
    if (snapshot[3] != func_020ae638()) func_020ae754();
    if (snapshot[4] != func_020ae628()) func_020ae740();
    if (snapshot[5] != func_020ae618()) func_020ae72c();
    if (snapshot[6] != func_020ae608()) func_020ae718();
    if (snapshot[7] != func_020ae5d8()) func_020ae6dc();
    if (snapshot[8] != func_020ae5c8()) func_020ae6c8();
    if (snapshot[9] != func_020ae5b8()) func_020ae6a0();
    if (snapshot[10] != func_020ae5a8()) func_020ae678();
    if (snapshot[11] != func_020ae5f8()) func_020ae704();
    if (snapshot[12] != func_020ae5e8()) GX_DisableBankForLCDC();

    GX_SetBankForBG(snapshot[0]);
    func_020af30c(snapshot[1]);
    func_020af1f8(snapshot[2]);
    func_020af140(snapshot[3]);
    func_020aef3c(snapshot[4]);
    func_020aee48(snapshot[5]);
    func_020aed08(snapshot[6]);
    GX_SetBankForSubBG(snapshot[7]);
    func_020aeb08(snapshot[8]);
    func_020aea7c(snapshot[9]);
    func_020ae9f0(snapshot[10]);
    func_020aec50(snapshot[11]);
    GX_SetBankForLCDC(snapshot[12]);
    GX_VBlankIntr(interruptState);
}

/*
 * Recovered overlay 107 compact interpreter-data subsystem.
 *
 * The overlay registers a large initialized bytecode-like record set with the
 * engine and owns two trailing zero-initialized work fields. Record semantics
 * are not yet confirmed, so address-derived names remain in use.
 */

/*
 * Registers the overlay records when r0 is zero; otherwise returns immediately.
 * The routine updates engine-managed registration state, returns no value, and
 * has no direct hardware effects visible in this overlay.
 */
void func_ov107_0221d6c0(void);

/* Exact initialized records and zero-initialized work fields used by the overlay. */
extern unsigned char data_ov107_0221d720[];
extern unsigned char data_ov107_02229d20[];

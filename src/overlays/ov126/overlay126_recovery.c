/*
 * Recovered overlay 126 compact interpreter-data subsystem.
 *
 * The overlay registers a large initialized bytecode-like record set with the
 * engine and owns two trailing zero-initialized work fields. Record semantics
 * remain unconfirmed, so address-derived names are retained.
 */

/* Registers records when r0 is zero; updates engine registration state, returns no value, and has no direct hardware effects. */
void func_ov126_0221d6c0(void);

/* Exact initialized records and zero-initialized work fields used by the overlay. */
extern unsigned char data_ov126_0221d720[];
extern unsigned char data_ov126_0222c700[];

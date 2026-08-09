/*
 * Recovered overlay 187 compact interpreter-data subsystem.
 *
 * The overlay registers fifteen initialized record groups with the engine
 * and owns trailing zero-initialized work storage. Record semantics remain
 * unconfirmed, so address-derived names are retained.
 */

/* Registers records when r0 is zero; updates engine registration state, returns no value, and has no direct hardware effects. */
void func_ov187_0221d6c0(void);

/* Exact initialized records and zero-initialized work storage used by the overlay. */
extern unsigned char data_ov187_0221d720[];
extern unsigned char data_ov187_BSSSTART[];

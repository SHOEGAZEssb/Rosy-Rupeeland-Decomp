/*
 * Recovered overlay 139 compact interpreter-data subsystem.
 *
 * The overlay registers an initialized bytecode-like record set with the
 * engine and owns trailing zero-initialized work storage. Record semantics
 * remain unconfirmed, so address-derived names are retained.
 */

/* Registers records when r0 is zero; updates engine registration state, returns no value, and has no direct hardware effects. */
void func_ov139_0221d6c0(void);

/* Exact initialized records and zero-initialized work storage used by the overlay. */
extern unsigned char data_ov139_0221d720[];
extern unsigned char data_ov139_02223300[];

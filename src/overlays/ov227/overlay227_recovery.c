/*
 * Recovered overlay 227 compact interpreter-data subsystem.
 *
 * The overlay initializes the engine and registers three top-level records
 * plus two auxiliary data regions. Internal record fields, including the
 * leading value six at 0x0221d734, remain semantically unconfirmed.
 */

/*
 * Initializes and registers the overlay when r0 is zero; updates engine
 * registration state, returns no value, and has no direct hardware effects.
 */
void func_ov227_0221d6c0(void);

/* Exact initialized records and zero-initialized work storage used by the overlay. */
extern unsigned char data_ov227_0221d720[];
extern unsigned char data_ov227_0221d734[];
extern unsigned char data_ov227_0221f5d2[];
extern unsigned char data_ov227_02221e40[];
extern unsigned char data_ov227_02221e44[];

/*
 * Recovered overlay 327 compact interpreter-data subsystem.
 *
 * The overlay initializes the engine and registers three records plus two
 * auxiliary runtime regions. Their semantics remain unconfirmed, so the
 * address-derived names are retained.
 */

/*
 * Initializes and registers the overlay when r0 is zero; updates engine
 * registration state, returns no value, and has no direct hardware effects.
 */
void func_ov327_0221d6c0(void);

/* Exact initialized records and zero-initialized work storage used by the overlay. */
extern unsigned char data_ov327_0221d720[];
extern unsigned char data_ov327_0221d734[];
extern unsigned char data_ov327_0221e7a9[];
extern unsigned char data_ov327_02222b00[];
extern unsigned char data_ov327_02222b04[];

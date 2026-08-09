/*
 * Recovered overlay 242 compact interpreter-data subsystem.
 *
 * The overlay initializes the engine and registers three records plus two
 * auxiliary data regions. The record semantics remain unconfirmed, so the
 * address-derived names are retained.
 */

/*
 * Initializes and registers the overlay when r0 is zero; updates engine
 * registration state, returns no value, and has no direct hardware effects.
 */
void func_ov242_0221d6c0(void);

/* Exact initialized records and zero-initialized work storage used by the overlay. */
extern unsigned char data_ov242_0221d720[];
extern unsigned char data_ov242_0221e289[];
extern unsigned char data_ov242_0221e2e0[];
extern unsigned char data_ov242_0221e2e4[];
extern unsigned char data_ov242_0221e2e8[];

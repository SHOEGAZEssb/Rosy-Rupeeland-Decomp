/*
 * Recovered overlay 210 compact interpreter-data subsystem.
 *
 * The overlay initializes the engine and registers three record groups plus
 * two auxiliary data regions. Record semantics remain unconfirmed, so
 * address-derived names are retained.
 */

/*
 * Initializes and registers the overlay when r0 is zero; updates engine
 * registration state, returns no value, and has no direct hardware effects.
 */
void func_ov210_0221d6c0(void);

/* Exact initialized records and zero-initialized work storage used by the overlay. */
extern unsigned char data_ov210_0221d720[];
extern unsigned char data_ov210_0221d734[];
extern unsigned char data_ov210_0221ef9b[];
extern unsigned char data_ov210_02227000[];
extern unsigned char data_ov210_02227004[];

/*
 * Recovered overlay 440 interpreter-data subsystem.
 *
 * The overlay registers three initialized records, installs an interpreter
 * script record, and publishes a separate zero-initialized engine work word.
 * Several embedded records deliberately share the same address-derived target.
 */

/* Initializes engine registration state, returns no value, and has no direct hardware effects. */
void func_ov440_02233c60(void);

/* Principal initialized records and zero-initialized work words used by the initializer. */
extern unsigned char data_ov440_02233ca0[];
extern unsigned char data_ov440_02234752[];
extern unsigned char data_ov440_02234b00[];
extern unsigned char data_ov440_02234b04[];

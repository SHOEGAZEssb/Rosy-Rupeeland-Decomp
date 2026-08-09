/*
 * Recovered overlay 377 interpreter-data subsystem.
 *
 * The overlay registers a three-entry runtime block, installs an initialized
 * interpreter record, and passes a second work word to the engine. The exact
 * meaning of the embedded command stream remains unconfirmed.
 */

/*
 * Initializes the overlay runtime; updates engine registration state, returns
 * no value, and has no direct hardware effects.
 */
void func_ov377_02233c60(void);

/* Exact command-stream records and zero-initialized engine work storage. */
extern unsigned char data_ov377_02233ed6[];
extern unsigned char data_ov377_02233f19[];
extern unsigned char data_ov377_02233f30[];
extern unsigned char data_ov377_02233f56[];
extern unsigned char data_ov377_02233f90[];
extern unsigned char data_ov377_02234084[];
extern unsigned char data_ov377_02234098[];
extern unsigned char data_ov377_022340be[];
extern unsigned char data_ov377_02234141[];
extern unsigned char data_ov377_02234142[];
extern unsigned char data_ov377_022342a2[];
extern unsigned char data_ov377_022342c0[];
extern unsigned char data_ov377_022342c4[];
extern unsigned char data_ov377_022342c8[];

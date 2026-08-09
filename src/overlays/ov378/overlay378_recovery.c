/*
 * Recovered overlay 378 interpreter-data subsystem.
 *
 * This module is byte-identical to overlay 377. It registers a three-entry
 * runtime block and two interpreter work records; their semantics are not yet
 * confirmed, so address-derived names remain in use.
 */

/*
 * Initializes the overlay runtime; updates engine registration state, returns
 * no value, and has no direct hardware effects.
 */
void func_ov378_02233c60(void);

/* Exact command-stream records and zero-initialized engine work storage. */
extern unsigned char data_ov378_02233ed6[];
extern unsigned char data_ov378_02233f19[];
extern unsigned char data_ov378_02233f30[];
extern unsigned char data_ov378_02233f56[];
extern unsigned char data_ov378_02233f90[];
extern unsigned char data_ov378_02234084[];
extern unsigned char data_ov378_02234098[];
extern unsigned char data_ov378_022340be[];
extern unsigned char data_ov378_02234141[];
extern unsigned char data_ov378_02234142[];
extern unsigned char data_ov378_022342a2[];
extern unsigned char data_ov378_022342c0[];
extern unsigned char data_ov378_022342c4[];
extern unsigned char data_ov378_022342c8[];

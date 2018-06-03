;/////Part 1/////256 bytes/////Main program////////////////////////////////////////////////////////////

.org $0000


Addr_0000:
	LD	SP,$FFFE		; $0000 Setup stack
	LD	A,$02			; $0003 
	JP	Addr_007C		; $0005 Jump to Initializing code


Addr_0008:
	;DMA data 1, D300 -> 9800, 130 bytes
	.DB $D3,$00,$98,$A0,$12

Addr_000D:
	; DMA data 2, D300 -> 8000, 410 bytes
	.DB $D3,$00,$80,$00,$40


Addr_0012:
	; Palette data to use on welcome-splash when different keys are pressed.
	.DB $1E,$53,$D0,$00
	.DB $1F,$42,$1C,$00
	.DB $14,$2A,$4D,$19
	.DB $8C,$7E,$00,$7C
	.DB $31,$6E,$4A,$45
	.DB $52,$4A,$00,$00
	.DB $FF,$53,$1F,$7C
	.DB $FF,$03,$1F,$00
	.DB $FF,$1F,$A7,$00
	.DB $EF,$1B,$1F,$00
	.DB $EF,$1B,$00,$7C
	.DB $00,$00,$FF,$03


Addr_0042:
	;Nintendo Logo. Each 2 bytes represent a 4x4 bitmap, scaled up to 8x8 by the drawing routine.
	.DB $CE,$ED,$66,$66,$CC,$0D,$00,$0B,$03,$73,$00,$83,$00,$0C,$00,$0D,$00,$08,$11,$1F,$88,$89,$00,$0E
	.DB $DC,$CC,$6E,$E6,$DD,$DD,$D9,$99,$BB,$BB,$67,$63,$6E,$0E,$EC,$CC,$DD,$DC,$99,$9F,$BB,$B9,$33,$3E 

Addr_0072:
	; (R) sign, the 8 bytes represent an 8x8 bitmap.
	.DB $3C,$42,$B9,$A5,$B9,$A5,$42,$3C


Addr_007A:
	; Title-checksums for games that seems to REQUIRE the original DMG-style logo to be mapped to the screen
	.DB $58,$43


Addr_007C:
	; Setup system, clear memory to use, and setup sound.
	LD	($FF00+$70),A		; $007C Set RAM-bank to 2
	LD	A,$FC			; $007E
	LD	($FF00+$47),A		; $0080 Set DMG palette to black-black-black-white
	CALL	Addr_0275		; $0082 Set up sound
	CALL	Addr_0200		; $0085 Clear 8k at $8000 (VRAM)
	LD	H,$D0			; $0088
	CALL	Addr_0203		; $008A Clear 8k at $D000 (Internal RAM)
	LD	HL,$FE00		; $008D Clear $FE00-$FEA0 (Sprite Attrib Memory)
	LD	C,$A0			; $0090
	XOR	A			; $0092
Addr_0093:
	LD	(HL+),A			; $0093
	DEC	C			; $0094
	JR	NZ,Addr_0093		; $0095

	; Load logo from cartridge to Hi-RAM, and scale it into 8*8 bitmap pieces which is written to VRAM. The "(R)" sign is also stored in VRAM.
	LD	DE,$0104		; $0097
	LD	HL,$8010		; $009A
	LD	C,H			; $009D
Addr_009E:
	LD	A,(DE)			; $009E
	LD	($FF00+C),A		; $009F
	INC	C			; $00A0
	CALL	Addr_03C6		; $00A1 Scale nibble 1
	CALL	Addr_03C7		; $00A4 Scale nibble 2
	INC	DE			; $00A7
	LD	A,E			; $00A8
	CP	$34			; $00A9
	JR	NZ,Addr_009E		; $00AB
	LD	DE,$0072		; $00AD Load "(R)" to VRAM
	LD	B,$08			; $00B0
Addr_00B2:
	LD	A,(DE)			; $00B2
	INC	DE			; $00B3
	LD	(HL+),A			; $00B4
	INC	HL			; $00B5
	DEC	B			; $00B6
	JR	NZ,Addr_00B2		; $00B7

	; Initalize the welcome splash in VRAM bank 1, determine default palette for DMG and SGB games, and run the welcome splash animation.
	CALL	Addr_03F0		; $00B9 Draw welcome splash and determine default palette.
	LD	A,$01			; $00BC
	LD	($FF00+$4F),A		; $00BE Select VRAM bank 1
	LD	A,$91			; $00C0
	LD	($FF00+$40),A		; $00C2 Turn on LCD
	LD	HL,$98B2		; $00C4 ?
	LD	B,$4E			; $00C7 ?
	LD	C,$44			; $00C9 ?frames?
	CALL	Addr_0291		; $00CB Run welcome splash animation
	XOR	A			; $00CE
	LD	($FF00+$4F),A		; $00CF Select VRAM bank 0

	; Compare the upper half (first 24 bytes) of logo in cartridge with logo stored above.
	LD	C,$80			; $00D1
	LD	HL,$0042		; $00D3
	LD	B,$18			; $00D6
Addr_00D8:
	LD	A,($FF00+C)		; $00D8
	INC	C			; $00D9
	CP	(HL)			; $00DA
Addr_00DB:
	JR	NZ,Addr_00DB		; $00DB Halt if not equal
	INC	HL			; $00DD
	DEC	B			; $00DE
	JR	NZ,Addr_00D8		; $00DF

	; Check the header checksum at ($014D).
	LD	HL,$0134		; $00E1
	LD	B,$19			; $00E4
	LD	A,B			; $00E6
Addr_00E7:
	ADD	A,(HL)			; $00E7
	INC	L			; $00E8
	DEC	B			; $00E9
	JR	NZ,Addr_00E7		; $00EA
	ADD	A,(HL)			; $00EC
Addr_00ED:
	JR	NZ,Addr_00ED		; $00ED Halt if incorrect

	; End welcome splash animation with a white-out, and reset graphics memory using DMA transfers.
	CALL	Addr_031C		; $00EF Go white out display and reset graphics memory
	JR	Addr_00F6		; $00F2 Skip unused space


Addr_00F4:
	; unused space
	.DB $00,$00  


Addr_00F6:
	; Set system-mode and palette (for DMG/SGB games), Select an unused RAM bank, and hide the ROM from the memory map while transfering control to $0100.
	CALL	Addr_05D0		; $00F6 set system mode
	XOR	A			; $00F9
	LD	($FF00+$70),A		; $00FA Select internal RAM bank 0
	LD	A,$11			; $00FC
	LD	($FF00+$50),A		; $00FE Lock internal ROM


;/////Part 2/////768 bytes/////Sub-routines////////////////////////////////////////////////////////////

.org $0200


Addr_0200:
	; Clear 8KB, starting from address $8000
	LD	HL,$8000		; $0200
Addr_0203:
	; Clear to closest 8KB boundary, starting from HL, taken bit 5 of H is reset.
	XOR	A			; $0203
Addr_0204:
	LD	(HL+),A			; $0204
	BIT	5,H			; $0205 Bit 5 of H indicates 
	JR	Z,Addr_0204		; $0207
	RET				; $0209


Addr_020A:
	; Copy C bytes from (HL+) to (DE+)
	LD	A,(HL+)			; $020A
	LD	(DE),A			; $020B
	INC	DE			; $020C
	DEC	C			; $020D
	JR	NZ,Addr_020A		; $020E
	RET				; $0210


Addr_0211:
	; Wait for VBlank interrupt
	PUSH	HL			; $0211
	LD	HL,$FF0F		; $0212 Location of interrupt flags
	RES	0,(HL)			; $0215 Make sure it is reset
Addr_0217:
	BIT	0,(HL)			; $0217
	JR	Z,Addr_0217		; $0219
	POP	HL			; $021B
	RET				; $021C


Addr_021D:
	; Read keypad and store current state in $D003 / C, and store changes in $D004 / B.
	LD	DE,$FF00		; $021D Register for keypad state
	LD	HL,$D003		; $0220 Location of previous keystate
	LD	C,$0F			; $0223
	LD	A,$30			; $0225
	LD	(DE),A			; $0227 Reset keypad
	LD	A,$20			; $0228
	LD	(DE),A			; $022A
	LD	A,(DE)			; $022B Get Dpad state
	CPL				; $022C
	AND	C			; $022D
	RDX	A			; $022E
	LD	B,A			; $0230
	LD	A,$10			; $0231
	LD	(DE),A			; $0233
	LD	A,(DE)			; $0234 Get buttonstate
	CPL				; $0235
	AND	C			; $0236
	OR	B			; $0237
	LD	C,A			; $0238
	LD	A,(HL)			; $0239
	XOR	C			; $023A
	AND	$F0			; $023B Get keystate changes for the Dpad 
	LD	B,A			; $023D
	LD	A,(HL+)			; $023E
	XOR	C			; $023F
	AND	C			; $0240 Get keys which has been turned on since last read
	OR	B			; $0241 Combine so buttons which has been turned on plus any change to the DPad are stored
	LD	(HL-),A			; $0242 Save it in D004 and B
	LD	B,A			; $0243
	LD	A,C			; $0244
	LD	(HL),A			; $0245 Save actuall keystate in D003 and C
	LD	A,$30			; $0246
	LD	(DE),A			; $0248 Reset keypad
	RET				; $0249


Addr_024A:
	; Load GBC palettes into Palette-RAM. HL = offset to OBJ palette data, B = OBJ palette data length, D = Bytes between OBJ palette data and BG palette data, E = BG palette data length.
	LD	A,$80			; $024A
	LD	($FF00+$68),A		; $024C Make BG palette input register accept data in increasing order
	LD	($FF00+$6A),A		; $024E Make OBJ palette input register accept data in increasing order
	LD	C,$6B			; $0250
Addr_0252:
	LD	A,(HL+)			; $0252
	LD	($FF00+C),A		; $0253 Move B bytes from (HL+) to OBJ palette RAM
	DEC	B			; $0254
	JR	NZ,Addr_0252		; $0255
	LD	C,D			; $0257
	ADD	HL,BC			; $0258 Get start of BG palette data
	LD	B,E			; $0259
	LD	C,$69			; $025A
Addr_025C:
	LD	A,(HL+)			; $025C
	LD	($FF00+C),A		; $025D Move E bytes from (HL+B+D+) to BG palette RAM
	DEC	B			; $025E
	JR	NZ,Addr_025C		; $025F
	RET				; $0261


Addr_0262:
	; Send 1 byte of OBJ palette data from ($D800), and 64 byte BG palette data from ($D840+), aka: update all BG palettes with palette data from ($D840+).
	PUSH	BC			; $0262
	PUSH	DE			; $0263
	PUSH	HL			; $0264
	LD	HL,$D800		; $0265 Start address
	LD	B,$01			; $0268 Size of OBJ palette data
	LD	D,$3F			; $026A Space between OBJ palette data and BG palette data
	LD	E,$40			; $026C Size of BG palette data
	CALL	Addr_024A		; $026E Send data to palette RAM
	POP	HL			; $0271
	POP	DE			; $0272
	POP	BC			; $0273
	RET				; $0274


Addr_0275:
	; Setup sound-system and initalize chanels.
	LD	A,$80			; $0275
	LD	($FF00+$26),A		; $0277 Turn audio-coltroller on, all chanels off
	LD	($FF00+$11),A		; $0279 50% Wave pattern duty
	LD	A,$F3			; $027B
	LD	($FF00+$12),A		; $027D Set up Chanel 1 volume envelope, full volume, decreasing direction, sweep 3
	LD	($FF00+$25),A		; $027F Output sound chanel 3-4 to SO1 terminal, output sound chanel 1-4 to SO2 terminal
	LD	A,$77			; $0281
	LD	($FF00+$24),A		; $0283 Set SO1 and SO2 volume to max.
	LD	HL,$FF30		; $0285
	XOR	A			; $0288
	LD	C,$10			; $0289
Addr_028B:
	LD	(HL+),A			; $028B Fill Wave-pattern RAM with "00 FF 00 FF 00 FF 00 FF 00 FF 00 FF 00 FF 00 FF"
	CPL				; $028C
	DEC	C			; $028D
	JR	NZ,Addr_028B		; $028E
	RET				; $0290


Addr_0291:
	; Run welcome splash and play two tones, while getting input for choosing palette for DMG games. HL=Pointer to attribute VRAM to start scrolling at, B=Secondary framecount when scrolling logo, C=Primary framecount.
	CALL	Addr_0211		; $0291 Wait for Vblank
	CALL	Addr_0262		; $0294 Update BG palette
	LD	A,C			; $0297 Map/display Nintendo(R) logo on ($44-$38+$01=) 13th frame
	CP	$38			; $0298
	JR	NZ,Addr_02B0		; $029A
	PUSH	HL			; $029C
	XOR	A			; $029D
	LD	($FF00+$4F),A		; $029E Select RAM bank 0
	LD	HL,$99A7		; $02A0
	LD	A,$38			; $02A3
Addr_02A5:
	LD	(HL+),A			; $02A5 Map "Nintendo(R)"
	INC	A			; $02A6
	CP	$3F			; $02A7
	JR	NZ,Addr_02A5		; $02A9
	LD	A,$01			; $02AB
	LD	($FF00+$4F),A		; $02AD Back to RAM bank 1
	POP	HL			; $02AF
Addr_02B0:
	PUSH	BC			; $02B0
	PUSH	HL			; $02B1
	LD	HL,$0143		; $02B2
	BIT	7,(HL)			; $02B5
	CALL	Z,Addr_0589		; $02B7 Check keypad and change palette if key is pressed, unless the game has GBC-flag set
	POP	HL			; $02BA
	POP	BC			; $02BB
	CALL	Addr_0211		; $02BC Wait for Vblank
	LD	A,C			; $02BF
	SUB	$30			; $02C0
	JP	NC,Addr_0306		; $02C2
	LD	A,C			; $02C5
	CP	$01			; $02C6
	JP	Z,Addr_0306		; $02C8
	LD	A,L			; $02CB
	CP	$D1			; $02CC
	JR	Z,Addr_02F1		; $02CE Scroll logo on ($44-$29->$02+$01=) 28th->67th frame, and play sound, but only if it isn't fully scrolled yet
	; Change BG palette for 15 objects in 3 rows starting at (HL+) to BG1 (first 3 objects in each row), BG2 (next 3 objects...), BG3 (next 3...), BG4 (next 3...), and BG5 (last 3 objects in each row).
	PUSH	BC			; $02D0
	LD	B,$03			; $02D1
Addr_02D3:
	LD	C,$01			; $02D3
Addr_02D5:
	LD	D,$03			; $02D5
Addr_02D7:
	LD	A,(HL)			; $02D7
	AND	$F8			; $02D8
	OR	C			; $02DA
	LD	(HL+),A			; $02DB Change BG of one object
	DEC	D			; $02DC
	JR	NZ,Addr_02D7		; $02DD Do next object in current block of 3 objects
	INC	C			; $02DF
	LD	A,C			; $02E0
	CP	$06			; $02E1
	JR	NZ,Addr_02D5		; $02E3 Do next BG in current row of 5 blocks
	LD	DE,$0011		; $02E5
	ADD	HL,DE			; $02E8
	DEC	B			; $02E9
	JR	NZ,Addr_02D3		; $02EA Do next row in the logo of 3 rows
	LD	DE,$FFA1		; $02EC Prepare for next frame by returning pointer to first row, but one coloumn to the rigth of the original position.
	ADD	HL,DE			; $02EF
	POP	BC			; $02F0
Addr_02F3:
	INC	B			; $02F1
	LD	A,B			; $02F2
	LD	E,$83			; $02F3
	CP	$62			; $02F5
	JR	Z,Addr_02FF		; $02F7 Play first sound on the ($62-$4E+$01) 21st frame of scrolling, aka: (28+21-1=) 48th frame of animation
	LD	E,$C1			; $02F9
	CP	$64			; $02FB
	JR	NZ,Addr_0306		; $02FD Play second sound on the ($64-$4E+$01) 23rd frame of scrolling, aka: (28+23-1=) 50th frame of animation
	LD	A,E			; $02FF
	LD	($FF00+$13),A		; $0300 Store 8 low bits of frequency for chanel 1
	LD	A,$87			; $0302
	LD	($FF00+$14),A		; $0304 Store 3 high bits of frequency for chanel 1, and Play sound
Addr_0306:
	LD	A,($D002)		; $0306
	CP	$00			; $0309
	JR	Z,Addr_0317		; $030B
	DEC	A			; $030D
	LD	($D002),A		; $030E
	LD	A,C			; $0311
	CP	$01			; $0312
	JP	Z,Addr_0291		; $0314 Repeat 68th and final frame if a delay is present, as a result of a recent keystroke
Addr_0317:
	DEC	C			; $0317
	JP	NZ,Addr_0291		; $0318 Do next frame
	RET				; $031B


Addr_031C:
	; Increase all palettes to white, and clear VRAM using DMA.
	LD   C,$26			; $031C
Addr_031E:
	CALL	Addr_034A		; $031E Increase components of all BG palettes in the buffer by 1
	CALL	Addr_0211		; $0321 Wait for Vblank
	CALL	Addr_0262		; $0324 Update actual palettes
	DEC	C			; $0327
	JR	NZ,Addr_031E		; $0328 Repeat untill everything is white
	CALL	Addr_0211		; $032A Wait for Vblank
	LD	A,$01			; $032D
	LD	($FF00+$4F),A		; $032F Select VRAM bank 1
	CALL	Addr_033E		; $0331 Run DMA routine to clear map VRAM
	CALL	Addr_0341		; $0334 Run DMA routine to clear object VRAM
	XOR	A			; $0337
	LD	($FF00+$4F),A		; $0338 Select VRAM bank 0
	CALL	Addr_033E		; $033A Run DMA routine to clear map VRAM
	RET				; $033D


Addr_033E:
	; Store 5 bytes at ($0008+) to DMA regs at ($FF51+)
	LD	HL,$0008		; $033E
Addr_0341:
	; Store 5 Bytes at (HL+) to DMA regs at $FF51+
	LD	DE,$FF51		; $0341 Set destination in DE
	LD	C,$05			; $0344 Number of bytes
	CALL	Addr_020A		; $0346 Transfer
	RET				; $0349


Addr_034A:
	; Increase any component of any color in the BG palettes by 1, unless component is fully on.
	PUSH	BC			; $034A
	PUSH	DE			; $034B
	PUSH	HL			; $034C
	LD	HL,$D840		; $034D
	LD	C,$20			; $0350 Loop 32 times, one for each color of every GB palette
Addr_0352:
	LD	A,(HL)			; $0352
	AND	$1F			; $0353
	CP	$1F			; $0355
	JR	Z,Addr_035A		; $0357 Is Red fully on?
	INC	A			; $0359 increase if not.
Addr_035A:
	LD	D,A			; $035A
	LD	A,(HL+)			; $035B
	RLCA				; $035C
	RLCA				; $035D
	RLCA				; $035E
	AND	$07			; $035F
	LD	B,A			; $0361
	LD	A,(HL-)			; $0362
	RLCA				; $0363
	RLCA				; $0364
	RLCA				; $0365
	AND	$18			; $0366
	OR	B			; $0368
	CP	$1F			; $0369 Is Green fully on?
	JR	Z,Addr_036E		; $036B increase if not.
	INC	A			; $036D
Addr_036E:
	RRCA				; $036E
	RRCA				; $036F
	RRCA				; $0370
	LD	B,A			; $0371
	AND	$E0			; $0372
	OR	D			; $0374
	LD	(HL+),A			; $0375
	LD	A,B			; $0376
	AND	$03			; $0377
	LD	E,A			; $0379
	LD	A,(HL)			; $037A
	RRCA				; $037B
	RRCA				; $037C
	AND	$1F			; $037D
	CP	$1F			; $037F
	JR	Z,Addr_0384		; $0381 Is Bule fully on?
	INC	A			; $0383 increase if not.
Addr_0384:
	RLCA				; $0384
	RLCA				; $0385
	OR	E			; $0386
	LD	(HL+),A			; $0387
	DEC	C			; $0388
	JR	NZ,Addr_0352		; $0389 Repeat for every color in the BG palette buffer
	POP	HL			; $038B
	POP	DE			; $038C
	POP	BC			; $038D
	RET				; $038E


Addr_038F:
	; Arrange 12 4x4 bitmaps as 6 8x4 bitmaps within 6 8x8 bitmaps in VRAM without scaling. 2 4x4 bitmaps are arranged as an 8x4 row within an 8x8 object, where the remaining 8x4 sized area is left as it was before the routine. HL = pointer to where to start writing, DE = Pointer to source of 4x4 bitmaps.
	LD	C,$00			; $038F
Addr_0391:
	LD	A,(DE)			; $0391 Get a 4x2 bitmap
	AND	$F0			; $0392 Make top row into the leftmost 4x1 bitmap part of a 8x1 bitmap
	BIT	1,C			; $0394
	JR	Z,Addr_039A		; $0396 don't move it to the rigthmost side if turn left-side 4x4 bitmap processed
	RDX	A			; $0398
Addr_039A:
	LD	B,A			; $039A
	INC	HL			; $039B
	LD	A,(HL)			; $039C
	OR	B			; $039D
	LD	(HL+),A			; $039E Paste 4x1 bitmap into final bitmap using color 2 of palette
	LD	A,(DE)			; $039F Get the 4x2 bitmap again
	AND	$0F			; $03A0 Make bottom row into the rightmost 4x1 bitmap part of a 8x1 bitmap
	BIT	1,C			; $03A2
	JR	NZ,Addr_03A8		; $03A4 don't move it to the leftmost side if rigth-side 4x4 bitmap processed
	RDX	A			; $03A6
Addr_03A8:
	LD	B,A			; $03A8
	INC	HL			; $03A9
	LD	A,(HL)			; $03AA
	OR	B			; $03AB
	LD	(HL+),A			; $03AC Paste 4x1 bitmap into final bitmap using color 2 of palette
	INC	DE			; $03AD point to next 4x2 bitmap
	BIT	0,C			; $03AE
	JR	Z,Addr_03BF		; $03B0 Don't move on to next 4x4 bitmap before both 4x2 parts of current bitmap is done
	PUSH	DE			; $03B2
	LD	DE,$FFF8		; $03B3 if left-side 4x4 bitmap has been processed, go back to first row to map rigth-side pixels.
	BIT	1,C			; $03B6
	JR	Z,Addr_03BD		; $03B8 if rigth-side 4x4 bitmap has been processed, go to next object
	LD	DE,$0008		; $03BA
Addr_03BD:
	ADD	HL,DE			; $03BD
	POP	DE			; $03BE
Addr_03BF:
	INC	C			; $03BF change turn/loop counter
	LD	A,C			; $03C0
	CP	$18			; $03C1
	JR	NZ,Addr_0391		; $03C3 Keep going untill done
	RET				; $03C5


Addr_03C6:
	; Scale bitmap from 2x4 to 4x8 and store it in VRAM
	LD	B,A			; $03C6
Addr_03C7:
	; Scale the second 2x4 part of a 4x4 bitmap to get a final 8x8 bitmap.
	PUSH	DE			; $03C7
	LD	D,$04			; $03C8 Scale upper nibble of B into A
Addr_03CA:
	LD	E,B			; $03CA
	RL	B			; $03CB
	RLA				; $03CD Rotate the curent bit into A
	RL	E			; $03CE
	RLA				; $03D0 Rotate it in twice to scale it horizontally
	DEC	D			; $03D1
	JR	NZ,Addr_03CA		; $03D2 Go scale the next bit of B
	POP	DE			; $03D4
	LD	(HL+),A			; $03D5 Store it in VRAM as color 1
	INC	HL			; $03D6
	LD	(HL+),A			; $03D7 Store it twice to scale it vertically
	INC	HL			; $03D8
	RET				; $03D9


Addr_03DA:
	; Map DMG-style logo for fully supporting two specific DMG games
	LD	A,$19			; $03DA
	LD	($9910),A		; $03DC Map (R) mark
	LD	HL,$992F		; $03DF
Addr_03E2:
	LD	C,$0C			; $03E2
	DEC	A			; $03E4
	JR	Z,Addr_03EF		; $03E5
	LD	(HL-),A			; $03E7 Map scaled "Nintendo" logo, in decreasing order
	DEC	C			; $03E8
	JR	NZ,Addr_03E4		; $03E9
	LD	L,$0F			; $03EB When done mapping the bottom row, map the upper row
	JR	Addr_03E2		; $03ED
Addr_03EF:
	RET				; $03EF


Addr_03F0:
	; Draw and map GBC-style logo, identify cartridge, and select default palette.
	LD	A,$01			; $03F0
	LD	($FF00+$4F),A		; $03F2 Select VRAM bank 1
	CALL	Addr_0200		; $03F4 Clear VRAM
	LD	DE,$0607		; $03F7
	LD	HL,$8080		; $03FA
	LD	C,$C0			; $03FD
Addr_03FF:
	LD	A,(DE)			; $03FF
	LD	HL+),A			; $0400 Load "GAME BOY" logo to VRAM using color 1
	INC	HL			; $0401
	LD	(HL+),A			; $0402 Load each byte twice to scale it vertically
	INC	HL			; $0403
	INC	DE			; $0404
	DEC	C			; $0405
	JR	NZ,Addr_03FF		; $0406
	LD	DE,$0104		; $0408
	CALL	Addr_038F		; $040B Arrange upper half of Nintendo logo in VRAM without scaling
	LD	BC,$FFA8		; $040E
	ADD	HL,BC			; $0411 Go back to first object of the arranged Nintendo logo, but starting at row 4 instead of row 0
	CALL	Addr_038F		; $0412 Arrange lower half of Nintendo logo in VRAM without scaling
	LD	BC,$FFF8		; $0415
	ADD	HL,BC			; $0418 Take pointer to start of the current object (it's left in the middle of it by the routine above)
	LD	DE,$0072		; $0419
	LD	C,$08			; $041C
Addr_041E:
	INC	HL			; $041E
	LD	A,(DE)			; $041F
	LD	(HL+),A			; $0420 Load (R) mark into VRAM
	INC	DE			; $0421
	DEC	C			; $0422
	JR	NZ,Addr_041E		; $0423
	LD	HL,$98C2		; $0425
	LD	B,$08			; $0428
	LD	A,$08			; $042A
Addr_042C:
	LD	C,$10			; $042C
Addr_042E:
	LD	(HL+),A			; $042E Set the area of where the welcome splash will be mapped to the BG0 palette, VRAM bank 0, no flipping, and no priority over OBJ.
	DEC	C			; $042F
	JR	NZ,Addr_042E		; $0430
	LD	DE,$0010		; $0432
	ADD	HL,DE			; $0435
	DEC	B			; $0436
	JR	NZ,Addr_042C		; $0437
	XOR	A			; $0439
	LD	($FF00+$4F),A		; $043A Select VRAM bank 0
	LD	HL,$98C2		; $043C Begin map upper row
	LD	A,$08			; $043F
Addr_0441:
	LD	(HL+),A			; $0441 Map "GAME BOY" logo
	INC	A			; $0442
	CP	$18			; $0443
	JR	NZ,Addr_0449		; $0445
	LD	L,$E2			; $0447 Start to map middle row
Addr_0449:
	CP	$28			; $0449
	JR	NZ,Addr_0450		; $044B
	LD	HL,$9902		; $044D Start to map lower row
Addr_0450:
	CP	$38			; $0450
	JR	NZ,Addr_0441		; $0452
	LD	HL,$08D8		; $0454 Pointer to colors to use as palette when scrolling on logo
	LD	DE,$D840		; $0457 Pointer to BG palette buffer
	LD	B,$08			; $045A Update all palettes, even only the first 6 are used
	LD	A,$FF			; $045C
	LD	(DE),A			; $045E
	INC	DE			; $045F
	LD	(DE),A			; $0460 Set color 0 to white (1F/1F/1F/)
	INC	DE			; $0461
	LD	C,$02			; $0462
	CALL	Addr_020A		; $0464 Set color 1 to data from table at $08D8
	LD	A,$00			; $0467
	LD	(DE),A			; $0469
	INC	DE			; $046A
	LD	(DE),A			; $046B Set color 2 to black (00/00/00)
	INC	DE			; $046C
	INC	DE			; $046D
	INC	DE			; $046E Leave color 3 as it is
	DEC	B			; $046F
	JR	NZ,Addr_045C		; $0470
	CALL	Addr_0262		; $0472
	; If license = 01, determin what default palette to use if the game is a non GBC game.
	LD	HL,$014B		; $0475 Check license
	LD	A,(HL)			; $0478
	CP	$33			; $0479
	JR	NZ,Addr_0488		; $047B
	LD	L,$44			; $047D New license
	LD	E,$30			; $047F
	LD	A,(HL+)			; $0481
	CP	E			; $0482
	JR	NZ,Addr_04CE		; $0483
	INC	E			; $0485
	JR	Addr_048C		; $0486
Addr_0488:
	LD	L,$4B			; $0488 Old license
	LD	E,$01			; $048A
Addr_048C:
	LD	A,(HL+)			; $048C
	CP	E			; $048D
	JR	NZ,Addr_04CE		; $048E
	LD	L,$34			; $0490 Calculate checksum of Title (16-bytes)
	LD	BC,$0010		; $0492
Addr_0495:
	LD	A,(HL+)			; $0495
	ADD	A,B			; $0496
	LD	B,A			; $0497
	DEC	C			; $0498
	JR	NZ,Addr_0495		; $0499
	LD	($D000),A		; $049B
	LD	HL,$06C7		; $049E Compare checksum with a list of 78 valid checksums, skip lookup if not found
	LD	C,$00			; $04A1
Addr_04A3:
	LD	A,(HL+)			; $04A3
	CP	B			; $04A4
	JR	Z,Addr_04AF		; $04A5
	INC	C			; $04A7
	LD	A,C			; $04A8
	CP	$4F			; $04A9
	JR	NZ,Addr_04A3		; $04AB
	JR	Addr_04CE		; $04AD
Addr_04AF:
	LD	A,C			; $04AF Determin if several variations exist for spesific checksum
	SUB	$41			; $04B0
	JR	C,Addr_04D0		; $04B2
	LD	HL,$0716		; $04B4
	LD	D,$00			; $04B7
	LD	E,A			; $04B9
	ADD	HL,DE			; $04BA
Addr_04BB:
	LD	A,($0137)		; $04BB Check for different variations if more than one exist
	LD	D,A			; $04BE
	LD	A,(HL)			; $04BF
	CP	D			; $04C0
	JR	Z,Addr_04D0		; $04C1
	LD	DE,$000E		; $04C3
	ADD	HL,DE			; $04C6
	LD	A,C			; $04C7
	ADD	A,E			; $04C8
	LD	C,A			; $04C9
	SUB	$5E			; $04CA
	JR	C,Addr_04BB		; $04CC
Addr_04CE:
	LD	C,$00			; $04CE Not a Nintendo-game, use default palette referance.
Addr_04D0:
	LD	HL,$0733		; $04D0
	LD	B,$00			; $04D3
	ADD	HL,BC			; $04D5
	LD	A,(HL)			; $04D6 Get palette referance for spesific game
	AND	$1F			; $04D7 Save palette index number
	LD	($D008),A		; $04D9
	LD	A,(HL)			; $04DC
	AND	$E0			; $04DD
	RLCA				; $04DF
	RLCA				; $04E0
	RLCA				; $04E1
	LD	($D00B),A		; $04E2 Save palette composition
	CALL	Addr_04E9		; $04E5 Generate table of palettes
	RET				; $04E8


Addr_04E9:
	; Generate a modified copy of the index table according to the upper 3 bits of the palette rerefance, and use it to generate a table of raw palette data.
	LD	DE,$0791		; $04E9
	LD	HL,$D900		; $04EC
	LD	A,($D00B)		; $04EF
	LD	B,A			; $04F2
	LD	C,$1E			; $04F3
Addr_04F5:
	BIT	0,B			; $04F5
	JR	NZ,Addr_04FB		; $04F7 If bit0 = 0, make OBJ0 equal palette C instead of A.
	INC	DE			; $04F9
	INC	DE			; $04FA
Addr_04FB:
	LD	A,(DE)			; $04FB
	LD	(HL+),A			; $04FC
	JR	NZ,Addr_0501		; $04FD
	DEC	DE			; $04FF
	DEC	DE			; $0500
Addr_0501:
	BIT	1,B			; $0501
	JR	NZ,Addr_0507		; $0503 If bit1 = 0, make OBJ1 equal palette C instead of A
	INC	DE			; $0505
	INC	DE			; $0506
Addr_0507:
	LD	A,(DE)			; $0507
	LD	(HL+),A			; $0508
	INC	DE			; $0509
	INC	DE			; $050A
	JR	NZ,Addr_050F		; $050B
	DEC	DE			; $050D
	DEC	DE			; $050E
Addr_050F:
	BIT	2,B			; $050F
	JR	Z,Addr_0518		; $0511 If bit2 = 1, make OBJ1 equal palette B instead of A or C
	DEC	DE			; $0513
	DEC	HL			; $0514
	LD	A,(DE)			; $0515
	LD	(HL+),A			; $0516
	INC	DE			; $0517
Addr_0518:
	LD	A,(DE)			; $0518 Make BG equal palette C
	LD	(HL+),A			; $0519
	INC	DE			; $051A
	DEC	C			; $051B
	JR	NZ,Addr_04F5		; $051C Repeat for all indexes
	LD	HL,D900			; $051E
	LD	DE,DA00			; $0521
	CALL	Addr_0564		; $0524 Generate a table of palette raw-data based on the copy of the index table
	RET				; $0527


Addr_0528:
	; Get temporary custom palette to use on the welcome splash after a keypress when a non-GBC game is inserted.
	LD	HL,$0012		; $0528
	LD	A,($D005)		; $052B
	RLCA				; $052E
	RLCA				; $052F
	LD	B,$00			; $0530
	LD	C,A			; $0532
	ADD	HL,$BC			; $0533 Get offset into table of temporary palettes
	LD	DE,$D840		; $0534
	LD	B,$08			; $0537
Addr_0539:
	PUSH	HL			; $0539
	LD	C,$02			; $053A
	CALL	Addr_020A		; $053C copy the first two bytes to color 0 of buffer for all the BG palettes (general background)
	INC	DE			; $053F
	INC	DE			; $0540
	INC	DE			; $0541
	INC	DE			; $0542
	INC	DE			; $0543
	INC	DE			; $0544
	POP	HL			; $0545
	DEC	B			; $0546
	JR	NZ,$0539		; $0547
	LD	DE,$D842		; $0549
	LD	C,$02			; $054C
	CALL	Addr_020A		; $054E copy the first two bytes to color 1 of buffer for BG0 (to hide the parts of the "GAME BOY" logo not scrolled onto the screen yet)
	LD	DE,$D84A		; $0551
	LD	C,$02			; $0554
	CALL	Addr_020A		; $0556 copy the last two bytes to color 1 of buffer for BG1 (the parts of the "GAME BOY" logo done scrolling onto the screen)
	DEC	HL			; $0559
	DEC	HL			; $055A
	LD	DE,$D844		; $055B
	LD	C,$02			; $055E
	CALL	Addr_020A		; $0560 copy the last two bytes to color 2 of buffer for BG0 ("Nintendo(R)" logo)
	RET				; $0563


Addr_0564:
	; Generate a table of raw palette data from the palette index table 
	LD	C,$60			; $0564
	HL	A,(HL+)			; $0566 Get offset into palette dictionary from index table
	PUSH	HL			; $0567
	PUSH	BC			; $0568
	LD	HL,$07E8		; $0569 Point to palette dictionalry
	LD	B,$00			; $056C
	LD	C,A			; $056E
	ADD	HL,BC			; $056F add offset into dictionary
	LD	C,$08			; $0570
	CALL	Addr_020A		; $0572 Copy 8 words from the palette dictionary to table of raw palette data at $DA00+
	POP	BC			; $0575
	POP	HL			; $0576
	DEC	C			; $0577
	JR	NZ,Addr_0566		; $0578 Repeat for the whole index table
	RET				; $057A


Addr_057B:
	; Use palette index number to calculate correct address of correct items in the table of raw palette data; the offset is basically just the palette index number times 24.
	LD	A,($D008)		; $057B Get palette index number
	LD	DE,$0018		; $057E
	INC	A			; $0581
Addr_0582:
	DEC	A			; $0582
	JR	Z,Addr_0588		; $0583
	ADD	HL,DE			; $0585 Add 24 to the address a palette-index-number of times.
	JR	NZ,Addr_0582		; $0586
Addr_0588:
	RET				; $0588


Addr_0589:
	; Read keypad and change palettes if a valid keystroke has been made.
	CALL	Addr_021D		; $0589 Read keypad and get palette
	LD	A,B			; $058C
	AND	$FF			; $058D
	JR	Z,Addr_05A0		; $058F don't do anything if no keys has changed
	LD	HL,$08E4		; $0591
	LD	B,$00			; $0594
	LD	A,(HL+)			; $0596
	CP	C			; $0597 Look up the key-combination and determin if it is valid
	JR	Z,Addr_05A2		; $0598
	INC	B			; $059A
	LD	A,B			; $059B
	CP	$0C			; $059C
	JR	NZ,Addr_0596		; $059E
Addr_05A0:
	JR	Addr_05CF		; $05A0 Not a valid key-combination, don't do anything then
Addr_05A2:
	LD	A,B			; $05A2
	LD	($D005),A		; $05A3 Store the ID of the valid key-combination
	LD	A,$1E			; $05A6
	LD	($D002),A		; $05A8 Add some delay before allowing the welcome splash animation to end
	LD	DE,$000B		; $05AB
	ADD	HL,DE			; $05AE
	LD	D,(HL)			; $05AF Get palette referance according to the ID of the valid key-combination
	LD	A,D			; $05B0
	AND	$1F			; $05B1
	LD	E,A			; $05B3
	LD	HL,$D008		; $05B4
	LD	A,(HL-)			; $05B7
	LD	(HL+),A			; $05B8 Backup old palette index number
	LD	A,E			; $05B9
	LD	(HL),A			; $05BA Store new palette index number
	LD	A,D			; $05BB
	AND	$E0			; $05BC
	RLCA				; $05BE
	RLCA				; $05BF
	RLCA				; $05C0
	LD	E,A			; $05C1
	LD	HL,$D00B		; $05C2
	LD	A,(HL-)			; $05C5
	HL	(HL+),A			; $05C6 Backup old palette composition
	LD	A,E			; $05C7
	LD	(HL),A			; $05C8 Store new palette composition
	CALL	Addr_04E9		; $05C9 Generate new table of raw palette data
	CALL	Addr_0528		; $05CC Update the palette buffer used in the welcome splash, according to the new palette referance
Addr_05CF:
	RET				; $05CF


Addr_05D0:
	; Set system mode, GBC or DMG. If DMG, set palette too.
	CALL	Addr_0211		; $05D0 Wait for Vblank
	LD	A,($0143)		; $05D3
	BIT	7,A			; $05D6
	JR	Z,Addr_05DE		; $05D8
	LD	($FF00+$4C),A		; $05DA Problably Set speed for GBC-mode
	JR	Addr_0606		; $05DC
Addr_05DE:
	LD	A,$04			; $05DE
	LD	($FF00+$4C),A		; $05E0 Problably Set speed for DMG-mode
	LD	A,$01			; $05E2
	LD	($FF00+$6C),A		; $05E4 Problably Set hardware to DMG-mode
	LD	HL,$DA00		; $05E6
	CALL	Addr_057B		; $05E9 Get offset to the start of the 3 actual palettes in HL
	LD	B,$10			; $05EC
	LD	D,$00			; $05EE
	LD	E,$08			; $05F0
	CALL	Addr_024A		; $05F2  Store the 3 custom palettes
	LD	HL,$007A		; $05F5
	LD	A,($D000)		; $05F8
	LD	B,A			; $05FB
	LD	C,$02			; $05FC
Addr_05FE:
	LD	A,(HL+)			; $05FE Look up if the game requires the original DMG logo to be present in VRAM
	CP	B			; $05FF
	CALL	Z,Addr_03DA		; $0600 Map original DMG-style logo if so
	DEC	C			; $0603
	JR	NZ,Addr_05FE		; $0604
Addr_0606:
	RET				; $0606


Addr_0607:
	; "GAME BOY" logo, each 4 bytes represent an 8x4 bitmap scaled up to 8x8.
	.DB $01,$0F,$3F,$7E,$FF,$FF,$C0,$00,$C0,$F0,$F1,$03,$7C,$FC,$FE,$FE,$03,$07,$07,$0F,$E0,$E0,$F0,$F0,$1E,$3E,$7E,$FE,$0F,$0F,$1F,$1F,$FF,$FF,$00,$00,$01,$01,$01,$03,$FF,$FF,$E1,$E0,$C0,$F0,$F9,$FB,$1F,$7F,$F8,$E0,$F3,$FD,$3E,$1E,$E0,$F0,$F9,$7F,$3E,$7C,$F8,$E0
	.DB $F8,$F0,$F0,$F8,$00,$00,$7F,$7F,$07,$0F,$9F,$BF,$9E,$1F,$FF,$FF,$0F,$1E,$3E,$3C,$F1,$FB,$7F,$7F,$FE,$DE,$DF,$9F,$1F,$3F,$3E,$3C,$F8,$F8,$00,$00,$03,$03,$07,$07,$FF,$FF,$C1,$C0,$F3,$E7,$F7,$F3,$C0,$C0,$C0,$C0,$1F,$1F,$1E,$3E,$3F,$1F,$3E,$3E,$80,$00,$00,$00
	.DB $7C,$1F,$07,$00,$0F,$FF,$FE,$00,$7C,$F8,$F0,$00,$1F,$0F,$0F,$00,$7C,$F8,$F8,$00,$3F,$3E,$1C,$00,$0F,$0F,$0F,$00,$7C,$FF,$FF,$00,$00,$F8,$F8,$00,$07,$0F,$0F,$00,$81,$FF,$FF,$00,$F3,$E1,$80,$00,$E0,$FF,$7F,$00,$FC,$F0,$C0,$00,$3E,$7C,$7C,$00,$00,$00,$00,$00


Addr_06C7:
	; List of checksums of tiles, used to identify Nintendo-licensed games.
	.DB $00,$88,$16,$36,$D1,$DB,$F2,$3C,$8C,$92,$3D,$5C,$58,$C9,$3E,$70
	.DB $1D,$59,$69,$19,$35,$A8,$14,$AA,$75,$95,$99,$34,$6F,$15,$FF,$97
	.DB $4B,$90,$17,$10,$39,$F7,$F6,$A2,$49,$4E,$43,$68,$E0,$8B,$F0,$CE
	.DB $0C,$29,$E8,$B7,$86,$9A,$52,$01,$9D,$71,$9C,$BD,$5D,$6D,$67,$3F
	.DB $6B,$B3,$46,$28,$A5,$C6,$D3,$27,$61,$18,$66,$6A,$BF,$0D,$F4

Addr_0716:
	; List of characters to compare the 4th character in the title to, when one checksum can refer to more than one title.
	.DB $42,$45,$46,$41,$41,$52,$42,$45,$4B,$45,$4B,$20,$52,$2D
	.DB $55,$52,$41,$52,$20,$49,$4E,$41,$49,$4C,$49,$43,$45,$20
	.DB $52

Addr_0733:
	; List of palette referance based on game identification.
	.DB $7C,$08,$12,$A3,$A2,$07,$87,$4B,$20,$12,$65,$A8,$16,$A9,$86,$B1
	.DB $68,$A0,$87,$66,$12,$A1,$30,$3C,$12,$85,$12,$64,$1B,$07,$06,$6F
	.DB $6E,$6E,$AE,$AF,$6F,$B2,$AF,$B2,$A8,$AB,$6F,$AF,$86,$AE,$A2,$A2
	.DB $12,$AF,$13,$12,$A1,$6E,$AF,$AF,$AD,$06,$4C,$6E,$AF,$AF,$12,$7C
	.DB $AC,$A8,$6A,$6E,$13,$A0,$2D,$A8,$2B,$AC,$64,$AC,$6D,$87,$BC,$60
	.DB $B4,$13,$72,$7C,$B5,$AE,$AE,$7C,$7C,$65,$A2,$6C,$64,$85


Addr_0791:
	; List of palette indexes, the 5 lower bits of the palette referance refers to the row number. The upper 3 bits of palette referance determin how the columns will be organized.
	.DB $80,$B0,$40
	.DB $88,$20,$68
	.DB $DE,$00,$70
	.DB $DE,$20,$78
	.DB $20,$20,$38
	.DB $20,$B0,$90
	.DB $20,$B0,$A0
	.DB $E0,$B0,$C0
	.DB $98,$B6,$48
	.DB $80,$E0,$50
	.DB $1E,$1E,$58
	.DB $20,$B8,$E0
	.DB $88,$B0,$10
	.DB $20,$00,$10
	.DB $20,$E0,$18
	.DB $E0,$18,$00
	.DB $18,$E0,$20
	.DB $A8,$E0,$20
	.DB $18,$E0,$00
	.DB $20,$18,$D8
	.DB $C8,$18,$E0
	.DB $00,$E0,$40
	.DB $28,$28,$28
	.DB $18,$E0,$60
	.DB $20,$18,$E0
	.DB $00,$00,$08
	.DB $E0,$18,$30
	.DB $D0,$D0,$D0
	.DB $20,$E0,$E8

Addr_07E8:
	; Palette dictionary, contains raw data for preset palettes used to colorize GB games.
	.DB $FF,$7F,$BF,$32,$D0,$00,$00,$00
	.DB $9F,$63,$79,$42,$B0,$15,$CB,$04
	.DB $FF,$7F,$31,$6E,$4A,$45,$00,$00
	.DB $FF,$7F,$EF,$1B,$00,$02,$00,$00
	.DB $FF,$7F,$1F,$42,$F2,$1C,$00,$00
	.DB $FF,$7F,$94,$52,$4A,$29,$00,$00
	.DB $FF,$7F,$FF,$03,$2F,$01,$00,$00
	.DB $FF,$7F,$EF,$03,$D6,$01,$00,$00
	.DB $FF,$7F,$B5,$42,$C8,$3D,$00,$00
	.DB $74,$7E,$FF,$03,$80,$01,$00,$00
	.DB $FF,$67,$AC,$77,$13,$1A,$6B,$2D
	.DB $D6,$7E,$FF,$4B,$75,$21,$00,$00
	.DB $FF,$53,$5F,$4A,$52,$7E,$00,$00
	.DB $FF,$4F,$D2,$7E,$4C,$3A,$E0,$1C
	.DB $ED,$03,$FF,$7F,$5F,$25,$00,$00
	.DB $6A,$03,$1F,$02,$FF,$03,$FF,$7F
	.DB $FF,$7F,$DF,$01,$12,$01,$00,$00
	.DB $1F,$23,$5F,$03,$F2,$00,$09,$00
	.DB $FF,$7F,$EA,$03,$1F,$01,$00,$00
	.DB $9F,$29,$1A,$00,$0C,$00,$00,$00
	.DB $FF,$7F,$7F,$02,$1F,$00,$00,$00
	.DB $FF,$7F,$E0,$03,$06,$02,$20,$01
	.DB $FF,$7F,$EB,$7E,$1F,$00,$00,$7C
	.DB $FF,$7F,$FF,$3F,$00,$7E,$1F,$00
	.DB $FF,$7F,$FF,$03,$1F,$00,$00,$00
	.DB $FF,$03,$1F,$00,$0C,$00,$00,$00
	.DB $FF,$7F,$3F,$03,$93,$01,$00,$00
	.DB $00,$00,$00,$42,$7F,$03,$FF,$7F
	.DB $FF,$7F,$8C,$7E,$00,$7C,$00,$00
	.DB $FF,$7F,$EF,$1B,$80,$61,$00,$00


Addr_08D8:
	; Used as color 1 of palette BG 0-5 (in fact 6 and 7 too, but they are not used) durning the welcome splash.
	.DB $FF,$7F
	.DB $00,$7C
	.DB $E0,$03
	.DB $1F,$7C
	.DB $1F,$00
	.DB $FF,$03


Addr_08E4:
	; Values used when determing if a valid keystroke has been made, and what keystroke in that cause.
	.DB $40
	.DB $41
	.DB $42
	.DB $20
	.DB $21
	.DB $22
	.DB $80
	.DB $81
	.DB $82
	.DB $10
	.DB $11
	.DB $12

Addr_08F0:
	; Palette referances used for the valid keystrokes above
	.DB $12
	.DB $B0
	.DB $79
	.DB $B8
	.DB $AD
	.DB $16
	.DB $17
	.DB $07
	.DB $BA
	.DB $05
	.DB $7C
	.DB $13


Addr_08FC:
	; Unused space
	.DB $00,$00,$00,$00
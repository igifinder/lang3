.macro padded_string string, max
1:
    .ascii "\string"
2:
    .iflt \max - (2b - 1b)
    .error "String too long"
    .endif

    .ifgt \max - (2b - 1b)
    .zero \max - (2b - 1b)
    .endif

    .endm

num_files:                 .long 2 ! Number of files to patch

! File 1
filename1:                  padded_string "A0LANG.BIN", 260 ! File to patch
file1_num_functions:       .long 3 ! Number of patches
! Patch 1
file1_func1_offset:        .long 0x8D94 ! Offset in File to Patch
file1_func1_max_size:      .long 0x16C ! Function Size
file1_func1_patch_offset:  .long sub_6016D94 ! New Function code
file1_func1_patch_size:    .long off_6016EFC-sub_6016D94+4
! Patch 2
file1_func2_offset:        .long 0x8F00 ! Offset in File to Patch
file1_func2_max_size:      .long 0xCC ! Function Size
file1_func2_patch_offset:  .long sub_6016F00 ! New Function code
file1_func2_patch_size:    .long dword_6016FC8-sub_6016F00+4
! Patch 3
file1_func3_offset:        .long 0x9748 ! Offset in File to Patch
file1_func3_max_size:      .long 0x58 ! Function Size
file1_func3_patch_offset:  .long sub_6017748 ! New Function code
file1_func3_patch_size:    .long sub_6017748_end-sub_6017748

! File 2
filename2:                 padded_string "LANG\\PROG_3.BIN", 260 ! File to patch 
file2_num_functions:       .long 4 ! Number of patches
! Patch 1
file2_func1_offset:        .long 0x2A78C ! Offset in File to Patch
file2_func1_max_size:      .long 0x138 ! Function Size
file2_func1_patch_offset:  .long sub_607CF8C ! New Function code
file2_func1_patch_size:    .long off_607D0C0-sub_607CF8C+4
! Patch 2
file2_func2_offset:        .long 0x2A8C4 ! Offset in File to Patch
file2_func2_max_size:      .long 0xB0 ! Function Size
file2_func2_patch_offset:  .long sub_607D0C4 ! New Function code
file2_func2_patch_size:    .long dword_607D170-sub_607D0C4+4
! Patch 3
file2_func3_offset:        .long 0x2AA30 ! Offset in File to Patch
file2_func3_max_size:      .long 0x2C0 ! Function Size
file2_func3_patch_offset:  .long sub_607D230 ! New Function code
file2_func3_patch_size:    .long off_607D4E8-sub_607D230+4
! Patch 4
file2_func4_offset:        .long 0x2C710 ! Offset in File to Patch
file2_func4_max_size:      .long 0x430 ! Function Size
file2_func4_patch_offset:  .long sub_607EF10 ! New Function code
file2_func4_patch_size:    .long off_607F33C-sub_607EF10+4

.align 2
sub_6016D94:
		mov.l	r8, @-r15
		mov.l	r9, @-r15
		mov.l	r10, @-r15
		mov.l	r11, @-r15
		mov.l	r12, @-r15
		mov.l	r13, @-r15
		mov.l	r14, @-r15
		sts.l	pr, @-r15
		add	#-0x18,	r15
		mov	r15, r14
		mov.l	r4, @r14
		mov	r5, r9		! pointer to text to draw
		mov	#0x13, r11
		add	r14, r11
		mov	#6, r13
		mov.l	@(0x38,r14), r1
		add	r14, r13
		mov.b	r6, @r11
		mov.w	r7, @r13
		mov	#0xA, r11
		add	r14, r11
		mov.w	r1, @r11
		mov.l	off_6016EE8, r1	! off_604F8A0
		mov	#0xA, r13
		mov.l	@r1, r8
		add	r14, r13
		mov.w	@r13, r13
		extu.w	r13, r1
		shll2	r1
		add	r1, r1          ! remove this instruction to force 8x16
		shll2	r1
		add	r1, r8
		!mov.w	@r9, r1		! read a character from	menu text in fnt_sys.bin
		mov.b	@r9, r1		! read a character from	menu text in fnt_sys.bin
		mov.l	dword_6016EEC, r2 ! 0xFFFF ! if	value is 0xFFFF, terminate parsing
		!extu.w	r1, r1		! confine to unsigned short
		extu.b	r1, r1		! confine to unsigned char
		cmp/eq	r2, r1
		bt/s	loc_6016E30
		mov	#0, r10
		mov	#6, r11
		add	r14, r11
		mov.w	@r11, r11
		mov.w	word_6016EDE, r12 ! 0x300
		extu.w	r11, r11
		mov.l	r11, @(0x14,r14)
		mov.l	@(0x14,r14), r0

loc_6016DEE:
		mov.l	off_6016EF0, r1	! unk_600FFFF
		cmp/hi	r1, r8
		bt	loc_6016E30
		add	#4, r0
		cmp/hi	r12, r0
		bf/s	loc_6016E00
		add	#1, r10
		bra	loc_6016EC8
		mov.l	@(0x14,r14), r0

loc_6016E00:
		mov.l	off_6016EF4, r1	! unk_288000
		mov	#0x13, r13
		add	r14, r13
		mov	r8, r5
		!mov.w	@r9+, r4	! read a character from	menu text in fnt_sys.bin, post increment pointer
		mov.b	@r9+, r4	! read a character from	menu text in fnt_sys.bin, post increment pointer
		mov.l	off_6016EF8, r11 ! sub_6016F00
		mov.b	@r13, r13
		!extu.w	r4, r4		! confine to unsigned short
		extu.b	r4, r4		! confine to unsigned short
		shll2	r4
		!add	r4, r4 ! only have to multiply by 16
		shll2	r4
		add	r1, r4
		extu.b	r13, r6
		jsr	@r11 ! sub_6016F00
		mov.l	r0, @(0xC,r14)
		mov.w	word_6016EE0, r1 ! 0x80  ! for 8x16 this needs to be 0x40
		add	r1, r8
		mov	#0xFFFFFFFF, r13
		!mov.w	@r9, r1
		mov.b	@r9, r1
		!extu.w	r13, r13
		extu.b	r13, r13
		!extu.w	r1, r1
		extu.b	r1, r1
		cmp/eq	r13, r1
		bf/s	loc_6016DEE
		mov.l	@(0xC,r14), r0

loc_6016E30:
		mov.l	off_6016EFC, r1	! off_604EE94
		mov.w	word_6016EE2, r5 ! 0x5000
		mov.l	@r1, r7
		mov	#6, r13
		mov.l	@r14, r11
		add	r14, r13
		mov.l	@r14, r1
		mov.w	@r13, r4
		add	#1, r1
		mov.b	@r1, r1
		mov	r10, r6
		mov.b	@r11, r2
		shll2	r1
		shll2	r1
		shll2	r1
		add	r2, r1
		add	r1, r1
		add	r1, r7
		mov.w	word_6016EE4, r1 ! 0x100
		add	r1, r4
		mov	#0, r1
		!shll2	r6          ! shift only once for 8x16
		shll	r6          ! shift only once for 8x16
		cmp/hs	r6, r1
		bt/s	loc_6016E80
		mov	#0, r3

loc_6016E62:
		mov	r4, r2          ! Do tile map(first row)
		add	r3, r2
		mov	r5, r1
		add	r2, r1
		mov.w	r1, @r7
		add	#2, r7
		!add	#1, r2
		!mov	r5, r1
		!add	r2, r1
		!mov.w	r1, @r7         ! remove the second tile map write unless needed
		!add     #4, r3          ! 8x16 only needs to increment by 2
		add     #2, r3          ! 8x16 only needs to increment by 2
		extu.w	r3, r1
		cmp/hs	r6, r1
		bf/s	loc_6016E62
		!add	#2, r7
        nop

loc_6016E80:
		mov	r10, r2
		!add	r2, r2          ! nop this to fix the second row's start position
		mov	#0x40, r1
		sub	r2, r1
		add	r1, r1
		add	r1, r7
		!mov	#2, r2
		mov	#1, r2
		mov	r10, r1
		!shll2	r1          ! shift only once for 8x16
		shll	r1          ! shift only once for 8x16
		!add	#2, r1
		add	#1, r1
		cmp/hs	r1, r2
		bt/s	loc_6016EBA
		!mov	#2, r3
		mov	#1, r3
		mov	r1, r6

loc_6016E9C:
		mov	r4, r2          ! second row of tile map
		add	r3, r2
		mov	r5, r1
		add	r2, r1
		mov.w	r1, @r7
		add	#2, r7
		!add	#1, r2
		!mov	r5, r1
		!add	r2, r1
		!mov.w	r1, @r7         ! remove the second tile map write unless needed
		!add	#4, r3          ! 8x16 only needs to increment by 2
		add	#2, r3          ! 8x16 only needs to increment by 2
		extu.w	r3, r1
		cmp/hs	r6, r1
		bf/s	loc_6016E9C
		!add	#2, r7
        nop

loc_6016EBA:
		mov	r10, r1
		mov	#0xA, r11
		add	r14, r11
		mov.w	@r11, r11
		!shll2	r1          ! shift only once for 8x16
		shll	r1          ! shift only once for 8x16
		add	r11, r1
		extu.w	r1, r0

loc_6016EC8:
		add	#0x18, r14
		mov	r14, r15
		lds.l	@r15+, pr
		mov.l	@r15+, r14
		mov.l	@r15+, r13
		mov.l	@r15+, r12
		mov.l	@r15+, r11
		mov.l	@r15+, r10
		mov.l	@r15+, r9
		rts
		mov.l	@r15+, r8

word_6016EDE:	.word 0x300
!word_6016EE0:	.word 0x80
word_6016EE0:	.word 0x40
word_6016EE2:	.word 0x5000
word_6016EE4:	.word 0x100
.align 2
off_6016EE8:	.long 0x0604F8A0
!dword_6016EEC:	.long 0xFFFF
dword_6016EEC:	.long 0xFF
off_6016EF0:	.long 0x0600FFFF
off_6016EF4:	.long 0x00288000
off_6016EF8:	.long 0x06016F00
off_6016EFC:	.long 0x0604EE94

.align 2
sub_6016F00:
		mov.l	r8, @-r15
		mov.l	r9, @-r15
		mov.l	r10, @-r15
		mov.l	r11, @-r15
		mov.l	r14, @-r15
		sts.l	pr, @-r15
		add	#-0x54,	r15
		mov	r15, r14
		mov	r4, r8		! character pointer
		mov	r6, r10		! r6 = ???
		mov	r14, r2
		add	#0x44, r2
		mov.l	r5, @r2		! r5 = ???
		add	#0x20, r5
		!add	#0x40, r5
		mov.l	r5, @(4,r2)
		!mov	r14, r1
		!add	#0x48, r1
		mov	r14, r4
		!mov.l	@r1, r1
		add	#4, r4
		!add	#0x20, r1
		!mov.l	r1, @(8,r2)
		!mov	r14, r1
		!add	#0x4C, r1
		!mov.l	@r1, r1
		!add	#0x20, r1
		!mov.l	r1, @(0xC,r2)
		mov.l	off_6016FC4, r1	! sub_6017748
		jsr	@r1 ! sub_6017748 ! background text?
		mov	r8, r5
		mov	#0, r5
		mov	#0xF, r9	! height - 1?
		!mov	#0xF, r11	! width	
		mov	#7, r11	! width	
		mov	r14, r0

loc_6016F40:
		mov.l	dword_6016FC8, r7 ! 0x80
		mov	#0, r6
		mov	r0, r4
		add	#4, r4

loc_6016F48:
		mov	#0, r3
		mov	r14, r2

loc_6016F4C:
		!mov.w	@r8, r1		! This is where	it does	the foreground text for	menu
		mov.b	@r8, r1		! This is where	it does	the foreground text for	menu
		!extu.w	r1, r1		! basically the	mov.w and extu.w needs changing
		extu.b	r1, r1		! basically the	mov.w and extu.w needs changing
		and	r7, r1
		tst	r1, r1
		bt	loc_6016F5A
		bra	loc_6016F68
		mov.b	r10, @r2

loc_6016F5A:
		mov.l	@r4, r1
		and	r7, r1
		tst	r1, r1
		bf/s	loc_6016F66
		mov	#0xA, r1
		mov	#9, r1

loc_6016F66:
		mov.b	r1, @r2

loc_6016F68:
		shlr	r7
		add	#1, r3
		mov	#1, r1
		cmp/hi	r1, r3
		bf/s	loc_6016F4C	! This is where	it does	the foreground text for	menu
		add	#1, r2		! increment output buffer
		mov	#8, r1
		and	r5, r1
		shlr2	r1
		shlr	r1 ! added to downsize from 2x2 to 1x2 tiles
		!mov	#8, r2
		!and	r6, r2
		!shlr2	r2
		!shlr	r2
		!add	r2, r1
		shll2	r1
		add	r14, r1
		add	#0x44, r1
		mov.l	@r1, r3
		add	#2, r6
		mov	r3, r2
		add	#1, r2		! increment variable
		mov.l	r2, @r1
		mov	r14, r2
		mov.b	@r14, r1
		add	#1, r2
		mov.b	@r2, r2
		shll2	r1
		shll2	r1
		or	r2, r1
		!cmp/hi	r9, r6
		cmp/hi	r11, r6
		bf/s	loc_6016F48	! width	check?
		mov.b	r1, @r3
		!add	#2, r8		! for 8x16 this	will have to be	set to 1
		add	#1, r8		! for 8x16 this	will have to be	set to 1
		add	#1, r5
		cmp/hi	r9, r5		! height check?
		bf/s	loc_6016F40	! change this to 0x80
		add	#4, r0
		add	#0x54, r14
		mov	r14, r15
		lds.l	@r15+, pr
		mov.l	@r15+, r14
		mov.l	@r15+, r11
		mov.l	@r15+, r10
		mov.l	@r15+, r9
		rts
		mov.l	@r15+, r8
.align 2
off_6016FC4:	.long 0x06017748
!dword_6016FC8:	.long 0x8000
dword_6016FC8:	.long 0x0080

.align 2
sub_6017748:
		mov.l	r8, @-r15
		mov.l	r9, @-r15	! this is the background layer font rendering function
		mov.l	r14, @-r15
		mov	r15, r14	! r4 = output buffer, r5 = pointer to current character	to draw
		mov	r4, r8
		mov	#0, r4
		mov	#0, r7
		!mov.w	@r5+, r1	! read one line
		mov.b	@r5+, r1	! read one line(8 pixels)
		mov	#14, r9	! vertical
		!extu.w	r1, r3
		extu.b	r1, r3      ! 8 pixels
		!mov.w	@r5+, r1	! read another line
		mov.b	@r5+, r1	! read another line(8 pixels)
		mov	r8, r6
		!extu.w	r1, r0
		extu.b	r1, r0      ! 8 pixels

loc_6017762:
		mov	r3, r1
		add	r1, r1
		mov	r3, r2
		shlr	r2
		or	r2, r1
		or	r4, r1
		or	r0, r1
		mov.l	r1, @r6
		mov	r3, r4
		mov	r0, r3
		!mov.w	@r5+, r1
		mov.b	@r5+, r1   ! 8 pixels        
		add	#4, r6
		add	#1, r7
		cmp/hi	r9, r7
		bf/s	loc_6017762
		!extu.w	r1, r0
		extu.b	r1, r0     ! 8 pixels 
		mov	r7, r0
		shll2	r0
		mov	r3, r1
		add	r1, r1
		mov	r3, r2
		shlr	r2
		or	r2, r1
		or	r4, r1
		mov.l	r1, @(r0,r8) 
		mov	r14, r15
		mov.l	@r15+, r14
		mov.l	@r15+, r9
		rts
		mov.l	@r15+, r8
sub_6017748_end:

.align 2
sub_607CF8C:
		mov.l	r8, @-r15
		mov.l	r9, @-r15
		mov.l	r10, @-r15
		mov.l	r11, @-r15
		mov.l	r12, @-r15
		mov.l	r13, @-r15
		mov.l	r14, @-r15
		sts.l	pr, @-r15
		add	#-0xC, r15
		mov	r15, r14
		mov.l	r7, @r14
		mov.l	@r14, r3
		mov	#4, r1
		cmp/hi	r1, r3
		bf/s	loc_607CFB8
		extu.b	r4, r10
		add	#-5, r3

loc_607CFAE:
		cmp/hi	r1, r3
		bt/s	loc_607CFAE
		add	#-5, r3
		add	#5, r3
		extu.b	r4, r10

loc_607CFB8:
		mov	#0x55, r1
		mul.l	r1, r10
		sts	macl, r11
		mov.l	off_607D094, r1	! unk_6088528
		mov	r11, r2
		add	r1, r2
		mov	#0x11, r1
		mul.l	r1, r3
		mov	r10, r13
		shll2	r13
		sts	macl, r8
		add	r8, r2
		mov	#1, r1
		mov	r2, r0
		mov.b	r1, @(r0,r6)
		mov.l	off_607D098, r1	! off_604F8A0
		mov.l	@r1, r12
		mov	r13, r9
		mov.w	@r5, r4
		mov.l	off_607D09C, r1	! unk_60885F8
		add	r1, r9
		extu.w	r4, r4
		mov.l	@r9, r1
		mov.l	r6, @(8,r14)
		shll2	r1
		shll2	r1
		add	r1, r1
		shll2	r1
		add	r1, r12
		mov.l	off_607D0A0, r1	! sub_607D0C4
		jsr	@r1 ! sub_607D0C4
		mov	r12, r5
		mov.l	off_607D0A4, r5	! unk_25C60000
		mov.w	word_607D08E, r1 ! 0x2A80
		mov	r8, r2
		mov	r8, r7
		mov	r12, r4
		mov.l	@(8,r14), r6
		mul.l	r1, r10
		add	r6, r2
		shll2	r2
		shll2	r2
		add	r2, r2
		shll2	r2
		mov	r6, r3
		sts	macl, r1
		add	r1, r5
		mov.w	word_607D090, r10 ! 0x80
		add	r2, r5
		shlr2	r2
		shlr2	r2
		shlr	r2
		shlr2	r2
		mov.l	@r9, r1
		!add	r3, r3 ! disable this to force text sprite increments for 8x16 sprites instead of 16x16
		add	#1, r1
		mov.l	r1, @r9
		mov.l	off_607D0A8, r1	! unk_6088308
		add	r11, r1
		add	r8, r1
		mov	r1, r0
		mov.b	r2, @(r0,r6)
		mov.l	off_607D0AC, r1	! unk_60883B8
		add	r11, r1
		add	r1, r7
		mov.l	off_607D0B0, r1	! unk_604EDF8
		mov	r13, r2
		add	r1, r2
		mov.b	@r2+, r1
		mov	r7, r0
		add	r3, r1
		mov.b	r1, @(r0,r6)
		mov.l	off_607D0B4, r1	! unk_6088468
		add	r1, r11
		mov.b	@r2, r1
		mov	r13, r0
		mov.l	@r14, r3
		mov.l	off_607D0B8, r2	! unk_60885E0
		mov.l	@(r0,r2), r2
		add	r11, r8
		sub	r2, r3
		mov	#0x12, r2
		mul.l	r2, r3
		shll2	r1
		add	r1, r1
		mov	r8, r0
		sts	macl, r2
		add	r2, r1
		add	#2, r1
		mov.b	r1, @(r0,r6)
		mov.l	off_607D0BC, r1	! _slDMACopy
		jsr	@r1 ! _slDMACopy
		mov	r10, r6
		mov.l	off_607D0C0, r2	! unk_60370D7
		mov	#3, r1
		mov.b	r1, @r2
		add	#0xC, r14
		mov	r14, r15
		lds.l	@r15+, pr
		mov.l	@r15+, r14
		mov.l	@r15+, r13
		mov.l	@r15+, r12
		mov.l	@r15+, r11
		mov.l	@r15+, r10
		mov.l	@r15+, r9
		rts
		mov.l	@r15+, r8

word_607D08E:	.word 0x2A80
word_607D090:	.word 0x80
		.align 2
off_607D094:	.long 0x06088528
off_607D098:	.long 0x0604F8A0
off_607D09C:	.long 0x060885F8
off_607D0A0:	.long 0x0607D0C4
off_607D0A4:	.long 0x025C60000
off_607D0A8:	.long 0x06088308
off_607D0AC:	.long 0x060883B8
off_607D0B0:	.long 0x0604EDF8
off_607D0B4:	.long 0x06088468
off_607D0B8:	.long 0x060885E0
off_607D0BC:	.long 0x0602E14C
off_607D0C0:	.long 0x060370D7

.align 2
sub_607D0C4:
		mov.l	r8, @-r15
		mov.l	r9, @-r15
		mov.l	r10, @-r15
		mov.l	r11, @-r15
		mov.l	r12, @-r15
		mov.l	r14, @-r15
		sts.l	pr, @-r15
		add	#-0x48,	r15
		mov	r15, r14
		extu.w	r4, r4
		shll2	r4
		!add	r4, r4		! disable this to convert to 8x16
		shll2	r4
		mov.l	off_607D164, r1	! unk_288000
		mov	r4, r9
		add	r1, r9
		mov	r5, r8
		mov	r14, r4
		add	#4, r4
		mov.l	off_607D168, r1	! sub_6017748
		jsr	@r1 ! sub_6017748
		mov	r9, r5
		mov	#0, r10
		mov.l	off_607D16C, r12 ! unk_603E9F0
		mov	#0xF, r11
		mov	r14, r4

loc_607D0F8:
		!mov.l	dword_607D170, r7 ! 0x8000
		mov.l	dword_607D170, r7 ! 0x80
		mov	#0, r6
		mov	r4, r5
		add	#4, r5

loc_607D100:
		mov	#0, r3

loc_607D102:
		;mov.w	@r9, r1
		mov.b	@r9, r1
		;extu.w	r1, r1
		extu.b	r1, r1
		and	r7, r1
		tst	r1, r1
		bt/s	loc_607D112
		extu.b	r3, r0
		bra	loc_607D120
		mov.b	@r12, r1

loc_607D112:
		mov.l	@r5, r1
		and	r7, r1
		tst	r1, r1
		bf/s	loc_607D120
		mov	#0xA, r1
		extu.b	r3, r0
		mov	#0, r1

loc_607D120:
		mov.b	r1, @(r0,r14)
		shlr	r7
		add	#1, r3
		!extu.b	r3, r2          ! unnecessary
		mov	#1, r1
		!cmp/hi	r1, r2
		cmp/hi	r1, r3          ! this can be cmp/hi  r1, r3
		bf/s	loc_607D102
		mov	r14, r2
		add	#1, r2
		mov.b	@r14, r1
		!add	#2, r6
		add	#4, r6
		mov.b	@r2, r2
		shll2	r1
		shll2	r1
		or	r2, r1
		mov.b	r1, @r8
		cmp/hi	r11, r6
		bf/s	loc_607D100
		add	#1, r8
		!add	#2, r9
		add	#1, r9
		add	#1, r10
		cmp/hi	r11, r10
		bf/s	loc_607D0F8
		add	#4, r4
		add	#0x48, r14
		mov	r14, r15
		lds.l	@r15+, pr
		mov.l	@r15+, r14
		mov.l	@r15+, r12
		mov.l	@r15+, r11
		mov.l	@r15+, r10
		mov.l	@r15+, r9
		rts
		mov.l	@r15+, r8

.align 2
off_607D164:	.long 0x00288000
off_607D168:	.long 0x06017748
off_607D16C:	.long 0x0603E9F0
!dword_607D170:	.long 0x8000
dword_607D170:	.long 0x80

.align 2
sub_607D230:
		mov.l	r8, @-r15
		mov.l	r9, @-r15
		mov.l	r10, @-r15
		mov.l	r11, @-r15
		mov.l	r12, @-r15
		mov.l	r13, @-r15
		mov.l	r14, @-r15
		sts.l	pr, @-r15
		add	#-0x10,	r15
		mov	r15, r14
		mov	#3, r0
		mov.b	r4, @(r0,r14)
		mov	#0, r13
		mov.l	r13, @(4,r14)
		mov	#3, r0
		mov.b	@(r0,r14), r0
		extu.b	r0, r1
		mov	r1, r6
		shll2	r6
		mov.l	off_607D4A0, r1	! unk_60885F0
		mov	r6, r7
		add	r1, r7
		mov.l	@r7, r3
		tst	r3, r3
		bt/s	loc_607D300
		mov	r7, r2
		add	#3, r2
		mov.l	off_607D4A4, r4	! unk_60370C8
		mov	r4, r1
		mov.b	@r2, r2
		add	#3, r1
		mov.b	@r1, r5
		mov	r2, r1
		sub	r5, r1
		exts.b	r1, r1
		cmp/pl	r1
		bt/s	loc_607D2E6
		mov	r6, r0
		mov.l	r13, @r7
		mov.l	off_607D4A8, r1	! unk_60885E0
		mov.l	@(r0,r1), r6
		mov	#4, r1
		cmp/hi	r1, r6
		bf/s	loc_607D294
		mov	r2, r5
		add	#-5, r6

loc_607D28C:
		cmp/hi	r1, r6
		bt/s	loc_607D28C
		add	#-5, r6
		add	#5, r6

loc_607D294:
		mov	#3, r13
		add	r14, r13
		mov.b	@r13, r13
		mov.l	off_607D4AC, r2	! unk_6088518
		mov	#0, r7
		mov	#0x10, r11
		mov	#0x55, r10
		mov.l	off_607D4B0, r9	! unk_6088528
		mov	#0x11, r8
		mov	#0, r4
		extu.b	r13, r3
		mov	r3, r1
		shll2	r1
		add	r3, r1
		add	r2, r1
		mov	#0, r2
		mov	r1, r0
		mov.b	r2, @(r0,r6)

loc_607D2B8:
		mul.l	r10, r3
		extu.b	r7, r0
		sts	macl, r1
		mul.l	r8, r6
		add	#1, r7
		add	r9, r1
		sts	macl, r2
		add	r1, r2
		extu.b	r7, r1
		cmp/hi	r11, r1
		bf/s	loc_607D2B8
		mov.b	r4, @(r0,r2)
		mov	#3, r13
		add	r14, r13
		mov.b	@r13, r13
		extu.b	r13, r1
		shll2	r1
		mov.l	off_607D4A8, r2	! unk_60885E0
		add	r2, r1
		mov.l	@r1, r2
		add	#1, r2
		bra	loc_607D2EE
		mov.l	r2, @r1

loc_607D2E6:
		mov.l	@r4, r1
		sub	r1, r3
		mov	r3, r1
		mov.l	r1, @r7

loc_607D2EE:
		exts.b	r5, r5
		mov	#3, r0
		mov.b	@(r0,r14), r0
		mov.l	off_607D4B4, r1	! sub_607CF48
		jsr	@r1 ! sub_607CF48
		extu.b	r0, r4
		mov	#1, r13
		bra	loc_607D31E
		mov.l	r13, @(4,r14)

loc_607D300:
		extu.b	r5, r0
		cmp/eq	#1, r0
		bf/s	loc_607D320
		mov	#3, r13
		mov.l	off_607D4B8, r1	! unk_60885E8
		mov	r6, r0
		mov.l	@(r0,r1), r3
		mov.l	off_607D4A8, r2	! unk_60885E0
		mov.l	@(r0,r2), r1
		cmp/eq	r1, r3
		bt/s	loc_607D31E
		mov	#0x12, r13
		mov.l	r13, @r7
		mov	#1, r0
		mov.l	r0, @(4,r14)

loc_607D31E:
		mov	#3, r13

loc_607D320:
		add	r14, r13
		mov.b	@r13, r13
		mov.l	off_607D4A0, r1	! unk_60885F0
		extu.b	r13, r9
		mov	r9, r8
		shll2	r8
		mov	r8, r0
		mov.l	@(r0,r1), r1
		tst	r1, r1
		bt/s	loc_607D38C
		mov	r9, r12
		mov.l	off_607D4BC, r1	! _slCurWindow
		jsr	@r1 ! _slCurWindow
		mov	#1, r4
		mov.l	off_607D4C0, r1	! unk_604EDF8
		mov	r8, r3
		add	r1, r3
		mov	r3, r1
		add	#1, r1
		mov	r8, r2
		mov	#0, r13
		mov.b	@r1, r5
		mov	#0, r0
		mov.b	@r3, r4
		mov.l	off_607D4C4, r1	! unk_60352A8
		add	r1, r2
		mov	r2, r1
		add	#1, r1
		mov	r5, r7
		mov.b	@r1, r1
		mov	r4, r6
		add	r1, r7
		shll2	r7
		add	r7, r7
		add	#-1, r7
		mov.b	@r2, r1
		exts.w	r7, r7
		add	r1, r6
		shll2	r6
		add	r6, r6
		add	#-1, r6
		exts.w	r6, r6
		shll2	r5
		add	r5, r5
		shll2	r4
		mov.l	r13, @-r15
		mov.l	r0, @-r15
		mov	#0xFFFFFFC7, r13
		extu.b	r13, r13
		mov.l	r13, @-r15
		mov.l	off_607D4C8, r0	! _slWindow
		jsr	@r0 ! _slWindow
		add	r4, r4
		add	#0xC, r15

loc_607D38C:
		mov	#0, r13
		mov.l	r13, @(0xC,r14)
		mov	r8, r2
		add	r12, r2
		mov.l	off_607D4AC, r1	! unk_6088518
		mov	r2, r11
		add	r1, r11
		mov	#0, r10

loc_607D39C:
		mov.b	@r11, r1
		mov	#0, r8
		extu.b	r1, r1
		cmp/hs	r1, r8
		bt/s	loc_607D458
		mov	#0x55, r1
		mov.l	off_607D4CC, r9	! unk_60882E8
		mov	r9, r6
		add	#8, r6

loc_607D3AE:
		mul.l	r1, r12
		sts	macl, r7
		mov.l	off_607D4B0, r1	! unk_6088528
		add	r7, r1
		add	r10, r1
		mov	r1, r0
		mov.b	@(r0,r8), r1
		extu.b	r1, r1
		tst	r1, r1
		bt/s	loc_607D44C
		mov	r9, r1
		mov	#0, r13
		mov.w	r13, @r9
		add	#2, r1
		mov	#0, r0
		mov.w	r0, @r1
		mov	r9, r1
		add	#4, r1
		mov.w	word_607D49A, r13 ! 0x480
		mov.w	r13, @r1
		mov	r9, r1
		add	#6, r1
		mov	#0x70, r0
		mov.w	r0, @r1
		mov	r9, r1
		add	#0x1C, r1
		mov	#0, r13
		mov.w	r13, @r1
		mov.w	word_607D49C, r1 ! 0x2A80
		mov.l	dword_607D4D0, r3 ! 0x60000
		!mov.w	word_607D49E, r13 ! 0x210
		mov.w	word_607D49E, r13 ! 0x110
		mul.l	r1, r12
		mov.l	dword_607D4D4, r5 ! 0xC80000
		mov	r9, r4
		mov.l	off_607D4D8, r1	! unk_6088308
		add	r7, r1
		add	r10, r1
		mov	r1, r0
		mov.b	@(r0,r8), r1
		sts	macl, r2
		extu.b	r1, r1
		shll2	r1
		shll2	r1
		add	r1, r1
		shll2	r1
		add	r3, r1
		add	r1, r2
		shar	r2
		shar	r2
		shar	r2
		mov.w	r2, @r6
		mov	r9, r1
		add	#0xA, r1
		mov.w	r13, @r1
		mov	r9, r2
		add	#0xC, r2
		mov.l	off_607D4DC, r1	! unk_60883B8
		add	r7, r1
		add	r10, r1
		mov	r1, r0
		mov.b	@(r0,r8), r1
		mov.l	off_607D4E0, r13 ! _slSetSprite
		extu.b	r1, r1
		shll2	r1
		add	r1, r1 ! disabling this does fix the positioning, but the true fix is to modify the code that is fed in from @(r0,r8)
		add	#0xA, r1
		mov.w	r1, @r2 ! XA
		mov	r9, r2
		mov.l	off_607D4E4, r1	! unk_6088468
		add	r7, r1
		add	r10, r1
		mov	r1, r0
		mov.b	@(r0,r8), r1
		add	#0xE, r2
		extu.b	r1, r1
		mov.w	r1, @r2 ! YA
		jsr	@r13 ! _slSetSprite
		mov.l	r6, @(8,r14)
		mov.l	@(8,r14), r6

loc_607D44C:
		mov.b	@r11, r1
		add	#1, r8
		extu.b	r1, r1
		cmp/hs	r1, r8
		bf/s	loc_607D3AE
		mov	#0x55, r1

loc_607D458:
		add	#1, r11
		add	#0x11, r10
		mov.l	@(0xC,r14), r0
		mov	#4, r1
		add	#1, r0
		cmp/hi	r1, r0
		bf/s	loc_607D39C
		mov.l	r0, @(0xC,r14)
		mov	#3, r13
		add	r14, r13
		mov.b	@r13, r13
		extu.b	r13, r1
		mov	r1, r2
		shll2	r2
		mov.l	off_607D4E8, r1	! unk_60885F8
		mov	#0, r13
		mov	r2, r0
		mov.l	r13, @(r0,r1)
		mov.l	off_607D4BC, r1	! _slCurWindow
		jsr	@r1 ! _slCurWindow
		mov	#0, r4
		mov.l	@(4,r14), r0
		add	#0x10, r14
		mov	r14, r15
		lds.l	@r15+, pr
		mov.l	@r15+, r14
		mov.l	@r15+, r13
		mov.l	@r15+, r12
		mov.l	@r15+, r11
		mov.l	@r15+, r10
		mov.l	@r15+, r9
		rts
		mov.l	@r15+, r8

word_607D49A:	.word 0x480
word_607D49C:	.word 0x2A80
!word_607D49E:	.word 0x210
word_607D49E:	.word 0x110
.align 2
off_607D4A0:	.long 0x060885F0
off_607D4A4:	.long 0x060370C8
off_607D4A8:	.long 0x060885E0
off_607D4AC:	.long 0x06088518
off_607D4B0:	.long 0x06088528
off_607D4B4:	.long 0x0607CF48
off_607D4B8:	.long 0x060885E8
off_607D4BC:	.long 0x0602DD10
off_607D4C0:	.long 0x0604EDF8
off_607D4C4:	.long 0x060352A8
off_607D4C8:	.long 0x0602DC4C
off_607D4CC:	.long 0x060882E8
dword_607D4D0:	.long 0x60000
dword_607D4D4:	.long 0xC80000
off_607D4D8:	.long 0x06088308
off_607D4DC:	.long 0x060883B8
off_607D4E0:	.long 0x0602E034
off_607D4E4:	.long 0x06088468
off_607D4E8:	.long 0x060885F8

.align 2
sub_607EF10:
		mov.l	r8, @-r15
		mov.l	r9, @-r15
		mov.l	r10, @-r15
		mov.l	r11, @-r15
		mov.l	r14, @-r15
		sts.l	pr, @-r15
		extu.w	r5, r3
		mov	r3, r1
		add	r1, r1
		add	r3, r1
		shll2	r1
		mov.l	off_607F1B0, r2	! off_6088620
		mov	r1, r8
		add	r2, r8
		shll2	r3
		mov.l	off_607F1B4, r1	! unk_6088000
		mov	r3, r2
		add	r1, r2
		mov.l	@r2, r1
		mov	r15, r14
		mov	r1, r0
		shll2	r0
		mov.l	@(r0,r8), r1
		mov	r4, r9		! output buffer	for text
		!mov.w	@r1, r7		! read character(word size) of dialogue	text
		mov.b	@r1, r7		! read character(word size) of dialogue	text
		mov	r6, r4
		mov	r7, r6
		add	#1, r1
		mov.b	@r1, r10	! low byte of character(only used for 0xFDXX/0xFEXX)
		!extu.w	r7, r3
		extu.b	r7, r3
		#mov.l	dword_607F1B8, r1 ! 0xDFFF
		mov	#0xDF, r1
        extu.b r1, r1
		cmp/hi	r1, r3		! is character value > 0xDFFF
		!bt/s	loc_607EF58
		bt	loc_607EF58
		!shlr8	r6		! high byte of character
        !nop
		bra	loc_607F2EE	! store	character
		or	r0, r0

loc_607EF58:
        shll8 r3   ! added to fix earlier parsing changes
        extu.b r10, r10
        or r10, r3 !
		mov.l	dword_607F1BC, r2 ! 0xFFF9
		mov	#6, r1
		sub	r2, r3		! character - 0xFFF9
		mov	r3, r2
		cmp/hi	r1, r2
		bf/s	loc_607EF6A	! character == 0xFFF9 -	0xFFFF
		mov	r2, r1
		bra	loc_607F0B8	! character < 0xFFF9
		or	r0, r0

loc_607EF6A:
		add	r1, r1		! character == 0xFFF9 -	0xFFFF
		mova	off_607EF78, r0	! (loc_607F08A - off_607EF78)
		mov.w	@(r0,r1), r1
		add	r1, r0
		jmp	@r0		! 0xFFFF
		nop

.align 2
off_607EF78:	
		.word loc_607F08A - off_607EF78 ! 0xFFF9
		.word loc_607F05C - off_607EF78	! 0xFFFA
		.word loc_607EFF4 - off_607EF78	! 0xFFFB
		.word loc_607EFD4 - off_607EF78	! 0xFFFC
		.word loc_607F030 - off_607EF78	! 0xFFFD
		.word loc_607EFB6 - off_607EF78	! 0xFFFE
		.word loc_607EF86 - off_607EF78	! 0xFFFF

loc_607EF86:
		extu.w	r5, r3		! 0xFFFF
		mov	r3, r2
		shll2	r2
		mov.l	off_607F1B4, r1	! unk_6088000
		add	r2, r1
		mov.l	@r1, r2
		tst	r2, r2
		bt/s	loc_607EFB0
		add	#-1, r2
		mov.l	r2, @r1
		mov	r3, r1
		add	r1, r1
		add	r3, r1
		shll2	r1
		mov.l	off_607F1B0, r3	! off_6088620
		add	r3, r1
		shll2	r2
		add	r1, r2
		mov.l	@r2, r1
		bra	loc_607F2FA
		mov	#0xFFFFFFFF, r8

loc_607EFB0:
		mov	#0, r8
		bra	loc_607EFC8
		mov	r3, r2

loc_607EFB6:
		extu.w	r5, r1		! 0xFFFE
		mov	r1, r3
		shll2	r3
		mov.l	off_607F1B4, r2	! unk_6088000
		mov	#0, r11
		mov	r3, r0
		mov.l	r11, @(r0,r2)
		mov	#0, r8
		mov	r1, r2

loc_607EFC8:
		add	r2, r2
		mov.l	off_607F1C0, r1	! unk_6087FEC
		mov	#5, r11
		mov	r2, r0
		bra	loc_607F2FE
		mov.w	r11, @(r0,r1)

loc_607EFD4:
		mov	#0xFFFFFFFC, r0	! 0xFFFC
		mov.w	r0, @r9
		extu.w	r5, r3
		mov	r3, r1
		add	r1, r1
		add	r3, r1
		shll2	r1
		mov.l	off_607F1B0, r2	! off_6088620
		add	r2, r1
		shll2	r3
		mov.l	off_607F1B4, r2	! unk_6088000
		mov	r3, r0
		mov.l	@(r0,r2), r2
		shll2	r2
		bra	loc_607F2F6
		add	r1, r2

loc_607EFF4:
		extu.w	r5, r2		! 0xFFFB
		mov	r2, r7
		add	r7, r7
		mov	r7, r3
		add	r2, r3
		shll2	r3
		mov.l	off_607F1B0, r1	! off_6088620
		add	r1, r3
		shll2	r2
		mov.l	off_607F1B4, r1	! unk_6088000
		mov	r2, r0
		mov.l	@(r0,r1), r2
		shll2	r2
		add	r3, r2
		mov.l	@r2, r1
		mov	r7, r0
		add	#2, r1
		mov.l	r1, @r2
		mov.l	off_607F1C0, r1	! unk_6087FEC
		mov	#2, r11
		mov.w	r11, @(r0,r1)
		extu.b	r4, r1
		mov	r1, r0
		cmp/eq	#1, r0
		bt/s	loc_607F02C
		mov	#0, r8
		bra	loc_607F2FE
		or	r0, r0

loc_607F02C:
		bra	loc_607F2FE
		mov	#0xFFFFFFFF, r8

loc_607F030:
		extu.w	r5, r2		! 0xFFFD
		mov	r2, r3
		add	r3, r3
		mov.l	off_607F1C0, r1	! unk_6087FEC
		mov	#3, r11
		mov	r3, r0
		mov.w	r11, @(r0,r1)
		mov	#0xFFFFFFFD, r0
		mov.w	r0, @r9
		add	r2, r3
		shll2	r3
		mov.l	off_607F1B0, r1	! off_6088620
		add	r1, r3
		shll2	r2
		mov.l	off_607F1B4, r1	! unk_6088000
		mov	r2, r0
		mov.l	@(r0,r1), r2
		shll2	r2
		add	r3, r2
		mov.l	@r2, r1
		bra	loc_607F2FA
		mov	#0, r8

loc_607F05C:
		extu.w	r5, r3		! 0xFFFA
		mov	r3, r1
		add	r1, r1
		add	r3, r1
		shll2	r1
		mov.l	off_607F1B0, r2	! off_6088620
		add	r2, r1
		mov	r3, r7
		shll2	r7
		mov.l	off_607F1B4, r2	! unk_6088000
		mov	r7, r0
		mov.l	@(r0,r2), r2
		mov	#0xFFFFFFFF, r8
		shll2	r2
		add	r1, r2
		mov.l	@r2, r1
		mov	r3, r0
		add	#2, r1
		mov.l	r1, @r2
		mov.l	off_607F1C4, r2	! unk_6087CC8
		mov	#2, r1
		bra	loc_607F2FE
		mov.b	r1, @(r0,r2)

loc_607F08A:
		extu.w	r5, r3		! 0xFFF9
		mov	r3, r1
		add	r1, r1
		add	r3, r1
		shll2	r1
		mov.l	off_607F1B0, r2	! off_6088620
		add	r2, r1
		mov	r3, r7
		shll2	r7
		mov.l	off_607F1B4, r2	! unk_6088000
		mov	r7, r0
		mov.l	@(r0,r2), r2
		mov	#0xFFFFFFFF, r8
		shll2	r2
		add	r1, r2
		mov.l	@r2, r1
		mov	r3, r0
		add	#2, r1
		mov.l	r1, @r2
		mov.l	off_607F1C4, r2	! unk_6087CC8
		mov	#1, r1
		bra	loc_607F2FE
		mov.b	r1, @(r0,r2)

loc_607F0B8:
		extu.b	r6, r2
		mov.w	word_607F1AC, r3 ! 0xF6
		mov	#8, r1
		sub	r3, r2
		cmp/hi	r1, r2		! is high byte of character < 0xF6?
		bf/s	loc_607F0CA
		mov	r2, r1
		bra	loc_607F22C	! high byte of character < 0xF6
		or	r0, r0

loc_607F0CA:
		add	r1, r1
		mova	off_607F0D8, r0	! (loc_607F1CC - off_607F0D8)
		mov.w	@(r0,r1), r1
		add	r1, r0
		jmp	@r0		! 0xFBXX
		nop

.align 2
off_607F0D8:	
		.word loc_607F1CC - off_607F0D8 ! 0xF6XX
		.word loc_607F22C - off_607F0D8	! 0xF7XX-0xF9XX,0xFCXX
		.word loc_607F22C - off_607F0D8	! 0xF7XX-0xF9XX,0xFCXX
		.word loc_607F22C - off_607F0D8	! 0xF7XX-0xF9XX,0xFCXX
		.word loc_607F10A - off_607F0D8	! 0xFAXX
		.word loc_607F0EA - off_607F0D8	! 0xFBXX
		.word loc_607F22C - off_607F0D8	! 0xF7XX-0xF9XX,0xFCXX
		.word loc_607F164 - off_607F0D8	! 0xFDXX
		.word loc_607F12A - off_607F0D8	! 0xFEXX

loc_607F0EA:
		extu.w	r5, r3		! 0xFBXX
		mov	r3, r1
		add	r1, r1
		add	r3, r1
		shll2	r1
		mov.l	off_607F1B0, r2	! off_6088620
		add	r2, r1
		mov	r3, r0
		shll2	r0
		mov.l	off_607F1B4, r2	! unk_6088000
		mov.l	@(r0,r2), r2
		shll2	r2
		add	r1, r2
		mov.l	@r2, r1
		bra	loc_607F2FA
		mov	#0xFFFFFFFF, r8

loc_607F10A:
		extu.w	r5, r3		! 0xFAXX
		mov	r3, r1
		add	r1, r1
		add	r3, r1
		shll2	r1
		mov.l	off_607F1B0, r2	! off_6088620
		add	r2, r1
		mov	r3, r0
		shll2	r0
		mov.l	off_607F1B4, r2	! unk_6088000
		mov.l	@(r0,r2), r2
		shll2	r2
		add	r1, r2
		mov.l	@r2, r1
		bra	loc_607F2FA
		mov	#0xFFFFFFFF, r8

loc_607F12A:
		extu.w	r5, r2		! 0xFEXX
		mov	r2, r7
		add	r7, r7
		mov	r7, r3
		add	r2, r3
		shll2	r3
		mov.l	off_607F1B0, r1	! off_6088620
		add	r1, r3
		mov	r2, r0
		shll2	r0
		mov.l	off_607F1B4, r1	! unk_6088000
		mov.l	@(r0,r1), r2
		shll2	r2
		add	r3, r2
		extu.b	r4, r0
		mov.l	@r2, r1
		cmp/eq	#1, r0
		add	#2, r1
		bt/s	loc_607F228
		mov.l	r1, @r2
		mov.l	off_607F1C0, r1	! unk_6087FEC
		mov	#4, r11
		mov	r7, r0
		mov.w	r11, @(r0,r1)
		mov.l	off_607F1C8, r2	! unk_6087FF0
		extu.b	r10, r1
		mov.l	r1, @r2
		bra	loc_607F2FE
		mov	#0, r8

loc_607F164:
		extu.w	r5, r2		! 0xFDXX
		mov	r2, r7
		add	r7, r7
		mov	r7, r3
		add	r2, r3
		shll2	r3
		mov.l	off_607F1B0, r1	! off_6088620
		add	r1, r3
		shll2	r2
		mov.l	off_607F1B4, r1	! unk_6088000
		mov	r2, r0
		mov.l	@(r0,r1), r2
		mov	#0xFFFFFFFD, r11
		shll2	r2
		add	r3, r2
		mov.l	@r2, r1
		mov	#0, r8
		add	#2, r1
		mov.l	r1, @r2
		extu.b	r4, r1
		mov	r1, r0
		cmp/eq	#1, r0
		bf/s	loc_607F19E
		mov.w	r11, @r9
		mov.l	off_607F1C0, r1	! unk_6087FEC
		mov	#3, r11
		mov	r7, r0
		bra	loc_607F2FE
		mov.w	r11, @(r0,r1)

loc_607F19E:
		mov.l	off_607F1C0, r1	! unk_6087FEC
		mov	#4, r11
		mov	r7, r0
		mov.w	r11, @(r0,r1)
		mov.l	off_607F1C8, r2	! unk_6087FF0
		bra	loc_607F2FC
		extu.b	r10, r1

word_607F1AC:	.word 0xF6
.align 2
off_607F1B0:	.long 0x06088620
off_607F1B4:	.long 0x06088000
!dword_607F1B8:	.long 0xDFFF
!dword_607F1B8:	.long 0x00DF
dword_607F1BC:	.long 0xFFF9
off_607F1C0:	.long 0x06087FEC
off_607F1C4:	.long 0x06087CC8
off_607F1C8:	.long 0x06087FF0

loc_607F1CC:
		extu.w	r5, r3		! 0xF6XX
		mov	r3, r1
		add	r1, r1
		add	r3, r1
		shll2	r1
		mov.l	off_607F314, r2	! off_6088620
		mov	r1, r9
		add	r2, r9
		shll2	r3
		mov.l	off_607F318, r1	! unk_6088000
		mov	r3, r8
		add	r1, r8
		mov.l	@r8, r2
		shll2	r2
		add	r9, r2
		mov.l	@r2, r1
		add	#2, r1
		mov.l	r1, @r2
		mov.l	@r8, r3
		mov	r3, r0
		shll2	r0
		mov.l	@(r0,r9), r1
		mov.w	@r1, r4
		mov.l	dword_607F31C, r2 ! 0xFFFC
		extu.w	r4, r1
		cmp/eq	r2, r1
		bf/s	loc_607F214
		mov	r3, r1
		mov.l	off_607F320, r1	! unk_603A47E
		mov.w	@r1, r1
		mov.w	word_607F310, r2 ! 0xB8
		mulu	r2, r1
		sts	macl, r0
		mov.l	off_607F324, r1	! unk_6037184
		mov.w	@(r0,r1), r4
		mov	r3, r1

loc_607F214:
		add	#1, r1
		mov.l	r1, @r8
		mov.l	off_607F328, r0	! sub_607AB14
		jsr	@r0 ! sub_607AB14
		extu.w	r4, r4
		mov.l	@r8, r1
		mov	r0, r2
		mov	r1, r0
		shll2	r0
		mov.l	r2, @(r0,r9)

loc_607F228:
		bra	loc_607F2FE
		mov	#0xFFFFFFFF, r8

loc_607F22C:
		mov	r6, r3		! 0xF7XX-0xF9XX,0xFCXX
		add	#0x12, r3
		extu.b	r3, r2
		mov	#7, r1
		cmp/hi	r1, r2
		bt/s	loc_607F2CE
		extu.b	r3, r1
		add	#-7, r1
		neg	r1, r6
		extu.w	r5, r3
		mov	r3, r7
		add	r7, r7
		add	r3, r7
		shll2	r7
		mov.l	off_607F314, r1	! off_6088620
		add	r1, r7
		shll2	r3
		mov.l	off_607F318, r1	! unk_6088000
		add	r1, r3
		mov.l	@r3, r2
		shll2	r2
		add	r7, r2
		mov.l	@r2, r1
		add	#2, r1
		mov.l	r1, @r2
		mov.l	@r3, r1
		mov	r1, r0
		shll2	r0
		mov.l	@(r0,r7), r1
		mov.w	@r1, r4
		extu.w	r4, r1
		tst	r1, r1
		bt/s	loc_607F274
		mov	r1, r0
		cmp/eq	#0x27, r0
		bf	loc_607F296

loc_607F274:
		mov.l	off_607F32C, r1	! unk_603708E
		mov.b	@r1, r0
		cmp/eq	#1, r0
		bf/s	loc_607F296
		extu.w	r4, r1
		mov.l	off_607F330, r1	! unk_604E91C
		mov.b	@r1, r0
		cmp/eq	#1, r0
		bf/s	loc_607F296
		extu.w	r4, r1
		extu.b	r6, r1
		mov	r1, r0
		add	r0, r0
		mov.l	off_607F334, r1	! unk_6034D90
		mov.w	@(r0,r1), r0
		bra	loc_607F2B2
		mov.w	r0, @r9

loc_607F296:
		mov.l	off_607F338, r2	! off_604E9FC
		add	r1, r1
		mov.l	@r2, r2
		mov	r1, r0
		mov.w	@(r0,r2), r1
		extu.w	r1, r1
		extu.b	r6, r2
		add	r2, r1
		mov.l	off_607F33C, r2	! off_604EB68
		add	r1, r1
		mov.l	@r2, r2
		mov	r1, r0
		mov.w	@(r0,r2), r1
		mov.w	r1, @r9

loc_607F2B2:
		extu.w	r5, r3
		mov	r3, r1
		add	r1, r1
		add	r3, r1
		shll2	r1
		mov.l	off_607F314, r2	! off_6088620
		add	r2, r1
		mov	r3, r0
		shll2	r0
		mov.l	off_607F318, r2	! unk_6088000
		mov.l	@(r0,r2), r2
		shll2	r2
		bra	loc_607F2F6
		add	r1, r2

loc_607F2CE:
		extu.w	r5, r3
		mov	r3, r1
		add	r1, r1
		add	r3, r1
		shll2	r1
		mov.l	off_607F314, r2	! off_6088620
		add	r2, r1
		mov	r3, r0
		shll2	r0
		mov.l	off_607F318, r2	! unk_6088000
		mov.l	@(r0,r2), r2
		shll2	r2
		add	r1, r2
		mov.l	@r2, r1
		bra	loc_607F2FA
		mov	#0xFFFFFFFF, r8

loc_607F2EE:
		mov.w	r7, @r9		! store	character
		mov.l	@r2, r2
		shll2	r2
		add	r8, r2

loc_607F2F6:
		mov.l	@r2, r1
		mov	#1, r8

loc_607F2FA:
		!add	#2, r1 ! increment text pointer, should be variable
		add	#1, r1 ! increment text pointer, should be variable

loc_607F2FC:
		mov.l	r1, @r2

loc_607F2FE:
		mov	r14, r15
		lds.l	@r15+, pr
		mov.l	@r15+, r14
		mov.l	@r15+, r11
		mov.l	@r15+, r10
		mov.l	@r15+, r9
		exts.b	r8, r0
		rts
		mov.l	@r15+, r8

word_607F310:	.word 0xB8
.align 2
off_607F314:	.long 0x06088620
off_607F318:	.long 0x06088000
dword_607F31C:	.long 0xFFFC
off_607F320:	.long 0x0603A47E
off_607F324:	.long 0x06037184
off_607F328:	.long 0x0607AB14
off_607F32C:	.long 0x0603708E
off_607F330:	.long 0x0604E91C
off_607F334:	.long 0x06034D90
off_607F338:	.long 0x0604E9FC
off_607F33C:	.long 0x0604EB68


_main:
rts

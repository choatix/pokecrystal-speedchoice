PermaOptionsP5String::
	db "BIKE INDOORS<LF>"
	db "        :<LF>"
	db "FAST REPELS<LF>"
	db "        :<LF>"
	db "RANDOM WILDS<LF>"
	db "        :@"

PermaOptionsP5Pointers::
	dw Options_BikeIndoors
	dw Options_FastRepel
	dw Options_RandomWilds
	dw Options_PermaOptionsPage
PermaOptionsP5PointersEnd::

Options_BikeIndoors:
	ld hl, BIKE_INDOORS_ADDRESS
	lb bc, BIKE_INDOORS, 3
	jp Options_OnOff

Options_FastRepel:
	ld hl, FAST_REPEL_ADDRESS
	lb bc, FAST_REPEL, 5
	jp Options_OnOff

Options_RandomWilds:
	ld hl, RANDOM_WILDS_ADDRESS
	lb bc, RANDOM_WILDS, 7
	jp Options_OnOff
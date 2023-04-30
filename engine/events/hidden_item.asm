HiddenItemScript::
	opentext
	readmem wHiddenItemID
	getitemname STRING_BUFFER_3, USE_SCRIPT_VAR
	callasm .append_tmhm_move_name
	writetext .PlayerFoundItemText
	giveitem ITEM_FROM_MEM
	iffalse .bag_full
	increment2bytestat sStatsItemsPickedUp
	callasm SetMemEvent
	specialsound
	itemnotify
	sjump .finish

.bag_full
	promptbutton
	writetext .ButNoSpaceText
	waitbutton

.finish
	closetext
	end

.append_tmhm_move_name
        ld de, wStringBuffer3 + STRLEN("TM##")
        farcall AppendTMHMMoveName
        ret

.PlayerFoundItemText:
	text_far _PlayerFoundItemText
	text_end

.ButNoSpaceText:
	text_far _ButNoSpaceText
	text_end

SetMemEvent:
	ld hl, wHiddenItemEvent
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld b, SET_FLAG
	call EventFlagAction
	ret

HiddenProgressiveRodScript::
	checkitem OLD_ROD
	loadmem wHiddenItemID, OLD_ROD
	iffalse HiddenItemScript
	checkitem GOOD_ROD
	loadmem wHiddenItemID, GOOD_ROD
	iffalse HiddenItemScript
	loadmem wHiddenItemID, SUPER_ROD
	sjump HiddenItemScript


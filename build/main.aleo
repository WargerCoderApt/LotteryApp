program lottery.aleo;

record Ticket:
    owner as address.private;


mapping num_winners:
	key as u16.public;
	value as u16.public;

function play:
    input r0 as address.private;
    cast r0 into r1 as Ticket.record;
    async play into r2;
    output r1 as Ticket.record;
    output r2 as lottery.aleo/play.future;

finalize play:
    lte block.height 500u32 into r0;
    assert.eq r0 true;
    rand.chacha into r1 as boolean;
    assert.eq r1 true;
    get.or_use num_winners[0u16] 0u16 into r2;
    lt r2 12u16 into r3;
    assert.eq r3 true;
    add r2 1u16 into r4;
    set r4 into num_winners[0u16];

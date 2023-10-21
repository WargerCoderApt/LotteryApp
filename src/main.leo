// The 'lottery' program.
program lottery.aleo {

    mapping num_winners: u16 => u16;

    record Ticket {
        owner: address,
    }

    transition play(lotteryAddress: address) -> Ticket {
        let ticket: Ticket = Ticket {
            owner: lotteryAddress,
        };
        return ticket then finalize();
    }

    finalize play() {
        assert(block.height <= 500u32);

        assert(ChaCha::rand_bool());

        let winners: u16 = num_winners.get_or_use(0u16, 0u16);
        assert(winners < 12u16);
        num_winners.set(0u16, winners + 1u16);

    }
}

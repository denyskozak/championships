module championship::championship {
    use std::string::{String};
    use sui::balance;
    use sui::sui::SUI;

    public struct Championship has key {
        id: UID,
        title: String,
        description: String,
        entry_fee: u64,
        reward_pool: balance::Balance<SUI>,
        admin: address,
        participants: vector<address>,
        status: u8, // 0 - Open, 1 - Ongoing, 2 - Closed
    }

    public fun create_championship(
        title: String,
        description: String,
        entry_fee: u64,
        ctx: &mut TxContext,
    ): Championship {
        Championship {
            id: object::new(ctx),
            title,
            description,
            entry_fee,
            reward_pool: balance::zero<SUI>(),
            admin: ctx.sender(),
            participants: vector::empty<address>(),
            status: 0
        }
    }
}


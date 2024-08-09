module ScholarshipPlatform::Scholarship {

    use std::signer;
    use std::string;
    use std::vector;
    use std::option;

    const ECRITERIA_MISMATCH: u64 = 1;
    const ESCHOLARSHIP_INACTIVE: u64 = 2;
    const ENOT_RECIPIENT: u64 = 3;
    const EALREADY_WITHDRAWN: u64 = 4;

    /// Struct to represent a scholarship
    struct Scholarship has copy, drop, store {
        id: u64,
        donor: address,
        amount: u64,
        criteria: string::String,
        is_active: bool,
        recipient: option::Option<address>,
    }

    /// Storage for all scholarships
    struct ScholarshipList has key {
        scholarships: vector<Scholarship>,
    }

    /// Initializes the platform with an empty list of scholarships
    public fun initialize_platform(account: &signer) {
        move_to(account, ScholarshipList {
            scholarships: vector::empty<Scholarship>(),
        });
    }

    /// Function to create a scholarship
    public fun create_scholarship(
        account: &signer,
        amount: u64,
        criteria: string::String
    ) acquires ScholarshipList {
        let scholarship_list = borrow_global_mut<ScholarshipList>(signer::address_of(account));
        let new_scholarship = Scholarship {
            id: (vector::length(&scholarship_list.scholarships) as u64) + 1,
            donor: signer::address_of(account),
            amount,
            criteria,
            is_active: true,
            recipient: option::none<address>(),
        };
        vector::push_back(&mut scholarship_list.scholarships, new_scholarship);
    }

    /// Function to apply for a scholarship
    public fun apply_for_scholarship(
        account: &signer,
        scholarship_id: u64,
        application_criteria: string::String
    ) acquires ScholarshipList {
        let scholarship_list = borrow_global_mut<ScholarshipList>(signer::address_of(account));
        let scholarship = vector::borrow_mut(&mut scholarship_list.scholarships, scholarship_id - 1);

        // Check if the scholarship is active and if the criteria match
        if (scholarship.is_active && scholarship.criteria == application_criteria) {
            scholarship.recipient = option::some(signer::address_of(account));
            scholarship.is_active = false;
        } else {
            abort ECRITERIA_MISMATCH;
        }
    }

        // Function to withdraw scholarship funds by the recipient
    public fun withdraw_scholarship(
        account: &signer,
        scholarship_id: u64,
    ) acquires ScholarshipList {
        let scholarship_list = borrow_global_mut<ScholarshipList>(signer::address_of(account));
        let scholarship = vector::borrow_mut(&mut scholarship_list.scholarships, scholarship_id - 1);

        Check if the scholarship has a recipient
        if (!option::is_some(&scholarship.recipient)) {
            
        }

        Extracting the recipient address from the Option
        let recipient = option::borrow(&scholarship.recipient);

        if (*recipient != signer::address_of(account)) {
            The caller is not the recipient

        }

        Check if the scholarship funds have already been withdrawn
        if (!scholarship.is_active) {

        }

        Transfer funds to the recipient (this is a placeholder)
        scholarship.amount = 0; // assuming the funds are transferred out
        scholarship.is_active = false; // Mark scholarship as inactive after withdrawal

        Need to Implement actual fund transfer logic here
    }
}

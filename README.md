Here's the updated `README.md` file with the requested changes:

---

# Scholarship Smart Contract Platform

**Contract Details:** `0x7997fba47fd30483db0a6088c36d78b6f3f6f03d1136f36610666d8f7e86a805`

## Project Description

This project implements a decentralized scholarship platform using smart contracts on the Aptos blockchain. The platform enables donors to create scholarships with specific eligibility criteria and funding amounts. Eligible students can apply for these scholarships, and once the application matches the criteria, the scholarship is automatically awarded and distributed. This ensures a fair, transparent, and efficient process where the predefined conditions govern the entire scholarship lifecycle.

## Key Features

- **Decentralized Scholarship Management**: Donors can create and manage scholarships without relying on a central authority. The entire process is governed by smart contracts, ensuring fairness and transparency.
  
- **Automated Awarding and Distribution**: Scholarships are automatically awarded to students who meet the criteria. This eliminates manual processing and reduces the potential for bias or errors.

- **Secure and Immutable Records**: All scholarship transactions and records are securely stored on the blockchain, providing an immutable history of all actions.

- **Recipient Fund Withdrawal**: Once a scholarship is awarded, the recipient can easily withdraw the funds through the smart contract, ensuring that they receive the financial support they are entitled to.

- **Criteria-Based Applications**: Students can apply for scholarships by providing the necessary criteria, ensuring that only those who truly qualify are considered.

## Project Vision

The Scholarship Smart Contract Platform is designed to revolutionize the way educational scholarships are managed and distributed. By leveraging blockchain technology and the Move programming language on the Aptos blockchain, this platform aims to create a transparent, secure, and automated scholarship system. Our vision is to empower students and donors alike by providing a seamless, trustless process that eliminates the inefficiencies and biases inherent in traditional scholarship distribution methods.

## Prerequisites

- **Aptos CLI**: Required to deploy and interact with the smart contracts.
- **Move Language**: Basic understanding of Move is needed to work with the smart contracts.
- **Git**: Necessary for cloning the project repository.

## Installation

1. **Clone the Repository**:

   ```sh
   git clone https://github.com/Pabitra969/StduentScholarshipDistribution.git
   cd StduentScholarshipDistribution
   ```

2. **Set Up the Project**:

   Make sure your `Move.toml` is configured correctly:

   ```toml
   [package]
   name = "scholarship"
   version = "0.0.0"
   authors = ["Your Name <your.email@example.com>"]

   [dependencies]
   AptosFramework = { git = "https://github.com/aptos-labs/aptos-core.git", subdir = "aptos-move/framework/aptos-framework", rev = "main" }
   MoveStdlib = { git = "https://github.com/aptos-labs/aptos-core.git", subdir = "aptos-move/framework/move-stdlib", rev = "main" }

   [addresses]
    ScholarshipPlatform = "_"

   [dev-addresses]
   default = "0xA550C18"
   ```

3. **Build the Smart Contracts**:

   ```sh
   aptos move compile
   ```

4. **Deploy the Contracts**:

   Deploy the contracts to the Aptos blockchain:

   ```sh
   aptos move publish --package-dir path/to/your/package
   ```

## Usage

### Creating a Scholarship

Donors can create new scholarships by specifying eligibility criteria and the scholarship amount:

```move
public fun create_scholarship(
    account: &signer,
    criteria: string::String,
    amount: u64
) {
    // Implementation here
}
```

### Applying for a Scholarship

Students can apply for scholarships by submitting their application criteria:

```move
public fun apply_for_scholarship(
    account: &signer,
    scholarship_id: u64,
    application_criteria: string::String
) acquires ScholarshipList {
    // Implementation here
}
```

### Withdrawing Funds

Scholarship recipients can withdraw the funds awarded to them:

```move
public fun withdraw_scholarship(
    account: &signer,
    scholarship_id: u64
) acquires ScholarshipList {
    // Implementation here
}
```

### Viewing Scholarships

To view all available scholarships:

```move
public fun get_scholarships(): vector<Scholarship> {
    // Implementation here
}
```

## Errors and Handling

The smart contract includes robust error handling mechanisms:

- **E_CRITERIA_MISMATCH**: Triggered when the application criteria do not match the scholarship requirements.
- **E_NO_RECIPIENT**: Triggered when no recipient is assigned to a scholarship.
- **E_NOT_RECIPIENT**: Triggered when a non-recipient attempts to withdraw funds.


## Contact

For questions, support, or more information, contact Team - Pabitra14(mailto:pkg2000969@gmail.com).

---

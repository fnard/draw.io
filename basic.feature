Feature: Checking Account Creation and Transactions

  Scenario: Create a new checking account
    Given a customer wants to open a new checking account
    When the customer requests to open a new account through the system's user interface
    Then a new Account aggregate should be created
    And the new Account should be associated with the Customer entity
    And an AccountCreated event should be raised

  Scenario: Perform transactions on the account
    Given a customer has an existing checking account
    When the customer performs a deposit transaction
    Then the deposit transaction should be processed by the Account aggregate
    And the account balance should be updated accordingly
    And a TransactionProcessed event should be raised

    When the customer performs a withdrawal transaction
    Then the withdrawal transaction should be processed by the Account aggregate
    And the account balance should be updated accordingly
    And a TransactionProcessed event should be raised

  Scenario: Transfer funds between accounts
    Given a customer has two existing checking accounts
    When the customer requests a transfer of funds from one account to another
    Then the AccountTransferService should be invoked
    And the transfer request should be validated
    And the source and destination Account aggregates should be retrieved from the AccountRepository
    And the funds should be withdrawn from the source account
    And the funds should be deposited into the destination account
    And a FundsTransferred event should be raised
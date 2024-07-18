# Introduction
The purpose of this repository is to understand a little more about the technical/financial flow, as well as to develop a basic anti-fraud.

# Questions
I have three questions to anwser:

## 1 - Explain the money flow and the information flow in the acquirer market and the role of the main players.

The customer buy with card, from payment terminals. This, call to acquier send card and buy data.

The acquier, it take this data and call the bank sistem, send too balance, data filling, card expiration datas and frauds.

At the same time, the acquirer connects to the card network to verify if the transaction complies with the payment scheme standards.

After this process above, it done payment to merchant.

## 2 - Explain the difference between acquirer, sub-acquirer and payment gateway and how the flow explained in question 1 changes for these players.

### Acquier
They are responsible for intermediating between card networks and banks. They are represented by the card terminals provided to merchants.

### subacquier
They connect merchants and customers to acquirers in a more integrated manner. They link acquirers, gateways, anti-fraud systems, and handle the transfer to the customer, all in a more integrated way.

### Gateway
It also intermediates between acquirers and merchants. It is used in a "software format," where the "card terminal" is envisioned virtually.

It can also process various types of payment methods, such as bank slips, credit and debit cards, etc.

## 3 - Explain what chargebacks are, how they differ from cancellations and what is their connection with fraud in the acquiring world.

### What chargeback are?
It is a mechanism to revert Settled Transaction. 

Chargeback is a machanism to revert transactions that was liquided. Generaly be:
 - fraud
 - refound for same question of customer and merchat both.

Normally, this process starts with the cardholder's request to the card-issuing bank. The bank then investigates with the card network, the acquirer, and the merchant. In the end, if an error is found, the transaction is reversed, and the transfer is made to the origin of the request.

Chargebacks can also result in higher fees for the merchant, contract review with the acquirer, and a damaged reputation

## how they differ from cancellations

Chargeback the transaction was approved. It begin with with the request from customer or merchant. Cancellation the transaction no be approved yet, but wont finished for trobleshooting.


## what is their connection with fraud in the acquiring world

The `chargeback` and `anti-fraud` are executed in steps difer. The first is a reactive operation, when is identified the second.  

A `anti-fraud` process can be automated, verify the logs transactions, dimiss the `chargeback` number executions

# Análise
## Analyze the data provided and present your conclusions (consider that all transactions are made using a mobile device).

looking quickly to file, generaly de users don't buy in more one merchant by second. They use the same card to merchant differ.


## In addition to the spreadsheet data, what other data would you look at to try to find patterns of possible frauds?
I look for merchant, user and card number columns. I try see if same card is used to some merchants within range little time


# Run project
to run the project in development environment, just type within project directory:

```bash
$ docker-compose up -d && docker attach $(docker-compose ps -q web)
```

This statement permite that interaction with binding.pry gem debug
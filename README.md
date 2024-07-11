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
São as responsáveis por fazer a intermediação entre as bandeiras dos cartões e os bancos. Elas são representadas
pelas maquininhas que são disponibilizadas nos estabelecimentos. 

### subacquier
Conectam logistas e clientes às adquirentes de forma mais integrada. Eles conectam as adquirentes, gateways, anti-fraude
e fazem o repasse para o cliente, tudo de forma mais integrada.

### Gateway
Ele também faz a intermediação entre as adquirentes e os estabelecimentos comerciais. Ele é usado em "formato de software",
onde a "maquininha" é pensada de forma virtual. 

Ele também pode processar diversos tipos de meios de pagamento, como boleto, cartão de crédito e débito etc.


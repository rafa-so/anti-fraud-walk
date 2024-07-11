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

## 3 - Explain what chargebacks are, how they differ from cancellations and what is their connection with fraud in the acquiring world.

### What chargeback are?
It is a mechanism to revert Settled Transaction. 

O chargeback é um mecanismo para reversão de transações que já foram liquidadas. O motivo, gelramente, é: 
 - fraude
 - reenbolso do pagamento por algum motivo entre o comprador e o comerciante

Normalmente este processo começa com a requisição do comprado no banco emissor do cartão. Com isso, o banco vai 
investigar junto a bandeirae o comerciante. No final, se for justo, a transação é revertida, e a transferência
feita para a origem.

O chargeback também pode acarretar em taxas maiores para o comerciante, revisão de contrado com a adquirente, e 
reputação manchada.

## how they differ from cancellations

Inicialmente a diferença está na origem do pedido. `chargeback` tem como origem o próprio cliente/comprador. Já o 
`cancelamento`, tem como origem o próprio comerciante.

O `chargeback`, ele é uma espécie de cancelamento, de uma transação já liquidada. Além disso, envolve uma investigação
entre as partes do processo (banco emissor do cartão, bandeira, adquirente e comerciante). 

Já o `cancelamento` ele tem relação com uma transação que ainda não foi liquidada. Já é uma operação que vai acontecer
antes da transação ser de fato liquidada.

## what is their connection with fraud in the acquiring world

Fraude é um dos principais motivo para começo deste processo de `chargeback`, e é por ele também que o contrato entre
adquirente e comerciante pode ser revisto, pode ser também acrescentado taxas extras.
# Blockchain-Supply-Chain
Testing { Mocha, JS, Ganache}
App: { Solidity }
IDE: {Atom }

Supply Chain Problem
In today’s economy, nearly every product you use or service you consume comes from some other source. Although you might grow your own vegetables and herbs, you likely don’t raise livestock as a meat source as well. Everything that you buy comes from an original producer. In the case of food products, the original producer could be a grower, a rancher, a fisherman, or a producer of any other type of food.

As society has moved from being self-sufficient to relying on others to supply products services, consumers have become detached from producers. Geographic distances, regulations, and the suppliers’ desires for greater reach and higher profits have given rise to aggregators and middlemen to handle goods. These middlemen provide benefits to producers and consumers but also require fees for their services. These fees increase the consumer price, and the processing may slow down the time it takes for goods to arrive to the market or consumer.

Supply chain participants provide value to small and large producers. For the small producers, an aggregator can collect product from multiple producers and provide larger shipments to processors or warehouses. Large producers benefit from having local points of entry into the supply chain, without having to handle point-to-point shipments to all outlets for their products.
Consumers benefit as well because the supply chain makes available a wide variety of products from many producers.

SUPPLY CHAIN OBSTACLES

Lack of Transparency - Today’s supply chain participants often manage their own data systems and don’t publish their internal data. Separately managed data systems make it difficult to see how items are processed at each step in the chain.
Lack of Traceability - With limited transparency at each step, the data required for tracing products to their origin is often not available, making authenticity claims and recall notices for points of origin difficult or impossible
Transfer time lags - Transferring products from one participant to another requires synchronization between organizations and might not occur in real time. Many transfers occur in batches based on scheduled operations. This can cause delays at every stage, resulting in cumulative delays throughout the chain.
Translation Data loss - Each participant receives, manages, and passes along its own core set of data. Even with decades-old standards, such as Electronic Data Interchange (EDI), some data items might not be passed along from one participant to another, resulting in granular data loss along the supply chain. Also, any data that must be re-keyed because it isn’t passed along is subject to human error
Nonstandard/Unavailable status tracking - Because each participant generally manages its own data, status updates might not be available at each stage. Some participants might either decline to provide status updates or provide them in a manner that is incompatible with status updates from other participants. In the latter case, the status update requestor is required to assimilate status updates in various formats and harmonize them into meaningful output.


BLOCKCHAIN SOLUTION TO SUPPLY CHAIN OBSTACLES

Lack of Transparency – Blockchain technology does not have a central authority. All transactions are published to the shared blockchain. Any participating node can view transactions and verify their authenticity

Lack of Traceability – Because all nodes have access to all transactions on the blockchain, linking transactions is almost trivial. Any node can easily construct a complete chain of transactions between the original producer and the final consumer

Transfer time lags – Smart contracts provide the capability to assess the current blockchain state and make decisions on demand. Legacy solutions often require human interaction, which depends on set working hours. Blockchain introduces the opportunity for smart contracts, not
humans, to make certain decisions immediately. This benefit can remove the need for human intervention in some types of decisions

Translation data loss – Ethereum smart contracts define data needed for each transaction and ensure that all participants provide the same input. In short, every node uses the same rules — the rules don’t change from participant to participant as you move along the supply chain.

Nonstandard/Unavailable status tracking – Instead of each participant responding individually to status update requests, all necessary information is in blocks on the blockchain. Anyone who can access the blockchain can determine the current status of any digital asset


Dapp

» Creating a new supply chain participant: Validates a new participant and
authorizes the participant to become part of the supply chain process.
» Adding a new product to the supply chain: Puts a product into the supply
chain process.
» Transferring ownership of a product to another participant: Carries out
the main action of transferring a product from one supply chain participant to
another.
» Tracking a product: Provides status updates of a product and its history on
the supply chain.


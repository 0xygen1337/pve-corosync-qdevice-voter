In a **Proxmox 2-node cluster**, setting up a **QDevice voter** is particularly useful for homelab environments where running a full three-node cluster might be impractical due to resource constraints. Normally, a Proxmox cluster requires a majority of nodes to maintain quorum, which prevents split-brain scenarios and ensures data integrity. However, with only two nodes, you don’t have a majority if one node fails, which can cause the cluster to lose quorum.

### What the QDevice Voter Does in a 2-Node Proxmox Cluster:

- **Acts as a third vote**: The QDevice (running in your Docker container) acts as an external quorum device, simulating a third vote. This allows the cluster to maintain quorum even with just two physical nodes.

- **Prevents split-brain**: In a failure scenario where one node goes down, the QDevice will vote with the remaining node, allowing the cluster to continue operating without risking a split-brain condition (where two nodes try to run independently without knowledge of each other).

- **Cost-effective solution**: This approach is ideal for homelab setups where adding a third physical node isn't feasible. It provides the benefits of a three-node cluster without the need for extra hardware.

By deploying a **QNetd Docker container** to act as the quorum device, your 2-node Proxmox cluster can behave like a larger, more robust cluster, maintaining high availability and avoiding service interruptions with minimal infrastructure.

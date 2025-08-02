pragma solidity ^0.8.0;

/**
 * @title OWSB Prototype A - Scalable Data Pipeline Monitor
 * @author [Your Name]
 * @notice This contract prototypes a scalable data pipeline monitor
 *         for tracking and visualizing data pipeline performance.
 */

contract OWSBPrototypeA {
    // Mapping of pipeline IDs to their respective metadata
    mapping ( bytes32 => PipelineMetadata ) public pipelineMetadata;

    // Mapping of pipeline IDs to their respective metrics
    mapping ( bytes32 => PipelineMetrics ) public pipelineMetrics;

    // Event emitted when a new pipeline is registered
    event NewPipelineRegistered(bytes32 pipelineId, string pipelineName);

    // Event emitted when pipeline metrics are updated
    event PipelineMetricsUpdated(bytes32 pipelineId, uint256 throughput, uint256 latency);

    // Struct to represent pipeline metadata
    struct PipelineMetadata {
        string pipelineName;
        uint256 createdAt;
    }

    // Struct to represent pipeline metrics
    struct PipelineMetrics {
        uint256 throughput;
        uint256 latency;
    }

    // Function to register a new pipeline
    function registerPipeline(bytes32 pipelineId, string memory pipelineName) public {
        pipelineMetadata[pipelineId] = PipelineMetadata(pipelineName, block.timestamp);
        emit NewPipelineRegistered(pipelineId, pipelineName);
    }

    // Function to update pipeline metrics
    function updatePipelineMetrics(bytes32 pipelineId, uint256 throughput, uint256 latency) public {
        pipelineMetrics[pipelineId] = PipelineMetrics(throughput, latency);
        emit PipelineMetricsUpdated(pipelineId, throughput, latency);
    }

    // Function to get pipeline metadata
    function getPipelineMetadata(bytes32 pipelineId) public view returns (string memory, uint256) {
        return (pipelineMetadata[pipelineId].pipelineName, pipelineMetadata[pipelineId].createdAt);
    }

    // Function to get pipeline metrics
    function getPipelineMetrics(bytes32 pipelineId) public view returns (uint256, uint256) {
        return (pipelineMetrics[pipelineId].throughput, pipelineMetrics[pipelineId].latency);
    }
}
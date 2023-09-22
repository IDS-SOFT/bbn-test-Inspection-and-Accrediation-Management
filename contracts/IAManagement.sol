// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AccreditationManagement {
    // State variables
    address public inspector;
    address public institution;
    bool public isAccredited;
    string public report;

    // Constructor
    constructor(address _inspector, address _institution) {
        inspector = _inspector;
        institution = _institution;
        isAccredited = false;
    }

    // Functions
    function submitReport(string memory _report) public {
        require(msg.sender == inspector, "Only the inspector can submit the report");
        report = _report;
    }

    function approveAccreditation() public {
        require(msg.sender == institution, "Only the institution can approve accreditation");
        isAccredited = true;
    }

    function getInspector() public view returns (address) {
        return inspector;
    }

    function getInstitution() public view returns (address) {
        return institution;
    }

    function getReport() public view returns (string memory) {
        return report;
    }

    function getAccreditationStatus() public view returns (bool) {
        return isAccredited;
    }
}
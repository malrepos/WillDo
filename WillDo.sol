//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract WillDo {

    uint index;
    string[] public taskList;
    mapping(string => uint) indexByString;

    function addTask(string memory _task)external {
        taskList.push(_task);
        index++;
        indexByString[_task] = index;
    }

    function getTaskIndex(string memory _taskName)external view returns(uint){
        return indexByString[_taskName];
    }

    function removeTask(uint _index)external{
        for(uint i = _index; i < taskList.length; i++){
            taskList[i] = taskList[i +1];
            taskList.pop();
        }
    }

    function getTaslList()external view returns(string[] memory){
        return taskList;
    }
}
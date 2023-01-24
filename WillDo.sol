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
        return indexByString[_taskName] -1;
    }


    function removeTask(uint _index)external{
        for(uint i = _index; i < taskList.length -1; i++){
            taskList[i] = taskList[i + 1];
            taskList.pop();
        }
    }

    function getTasklList()external view returns(string[] memory){
        return taskList;
    }
}
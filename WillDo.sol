//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract WillDo {

    uint index;
    //an array of tasks
    string[] public taskList;

    // a mapping of strings to indexes
    mapping(string => uint) public indexByString;
    mapping(string => uint) public taskValueLocked;

// add a task
    function addTask(string memory _task)external payable {
        require(msg.value >= 1, "You need to add some skin to the game.");
        taskValueLocked[_task] = msg.value;
        taskList.push(_task);
        index++;
        indexByString[_task] = index;
    }

// get task index by task name
    function getTaskIndex(string memory _taskName)external view returns(uint){
        return indexByString[_taskName] -1;
    }

// remove a task by index and keep the task list in order
    function removeTask(uint _index)external{
        for(uint i = _index; i < taskList.length -1; i++){
            taskList[i] = taskList[i + 1];
            taskList.pop();
        }
    }

// return the full remaining list of tasks
    function getTasklList()external view returns(string[] memory){
        return taskList;
    }
}
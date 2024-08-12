// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract CrowdFunding{

    address public immutable beneficiary; //受益人
    uint256 public immutable fundingGoal; //筹资目标数量
    uint256 public fundingAmout;  //当前的金额
    mapping(address=>uint256) funders; 
    //可迭代的映射
    mapping(address=>bool) fundersInserted; 
    address [] public fundersKey; //length
    //  不用自销毁方法，使用变量来控制
    bool public AVAILABLE = true; //状态
    // 部署的时候写入受益人和筹资目标数量
    constructor(address beneficiary_,uint256 goal_){
        beneficiary = beneficiary_;
        fundingGoal = goal_;   
    }
    // 资助
    // 可用的时候才可以捐
    // 合约关闭之后 就不能再操作了
    function contribute() external  payable {
        require(AVAILABLE,"CrowdFunding is closed");

        //检查捐赠金额是否超过目标金额
        uint256 potentialFundingAmount = fundingAmout + msg.value;
        uint256 refundAmount = 0;

        if(potentialFundingAmount > fundingGoal)
        {
          refundAmount = potentialFundingAmount - fundingGoal;
          funders[msg.sender] += (msg.value - refundAmount);
        }else{
          funders[msg.sender] += msg.value;
          fundingAmout += msg.value;
        }

        //更新捐赠者信息
        if（!fundersInserted(msg.sender)){
           fundersInserted[msg.sender] = true;
           fundersKey.push(msg.sender);
        }
        
        //退还多余的金额
        if(refundAmount >0)
        {
            payable(msg.sender).transfer(refundAmount);
        }
    }

    //关闭
    function close() external  returns(bool){
        //1.检查
        if(fundingAmout < fundingGoal){
            return false;
        }

        uint256 amount = fundingAmout;

        //2.修改
        fundingAmount = 0;
        AVAILABLE = false;

        //3.操作
        payable(beneficiary).transfer(amount);
        return true;
    }
    function fundersLength() public view returns(uint256){
        return fundersKey.length;
    }
}
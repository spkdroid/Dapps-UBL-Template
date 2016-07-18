/**
 *  Author : Ramkumar Velmurugan
 * 
 *  Use Case: Billing
 *   
 *  This use case is used to generate bill. The current states in the enum funcaiton will include reqeust billing and generate billing.
 * 
 *  The product can be purchased using this contract. Once the order is successful a generate bill can be requested to use this contract.
 * 
 * 
 * 
**/
contract Bill
{

      enum Stages {
        RequestBill,
        GenerateBill
    }

    struct Bill
    {
        uint id;
        string productName;
        string productPrice;
        string BillDate;
    }
    
     Bill[1000] p;
     
      Stages public stage = Stages.RequestBill;

     function setInformation(uint _id,string _billdate,string _productName,string _productPrice,string _productDescription,uint id)
     {
     p[id].id = _id;    
     p[id].productName = _productName;
     p[id].productPrice = _productPrice;
     p[id].BillDate = _billdate;
     }
     
     function getId(uint _id) constant returns (uint)
     {
         return p[_id].id;
     }
     
     function getProductName(uint _id) constant returns (string)
     {
         return p[_id].productName;
     }
     
     function getProductPrice(uint _id) constant returns (string)
     {
         return p[_id].productPrice;
     }
     
          
        function nextStage() internal {
        stage = Stages(uint(stage) + 1);
    }
    
    // Perform timed transitions. Be sure to mention
    // this modifier first, otherwise the guards
    // will not take the new stage into account.
    modifier timedTransitions() {
             nextStage();
        // The other stages transition by transaction
    }

}

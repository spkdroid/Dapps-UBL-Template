/**
 * 
 *   Author: Ramkumar Velmurugan 
 * 
 * 
 * The Order Template is used to place an order. The information can be retrived form the 
 * 
 * Quotation contract and then placed in the order.
 * 
 * The Buyer will place an Order Request. The Request will be processed and the status of the
 * 
 * product will be updated in the orderStatus Variable
 * 
 * The Order Contract can be extended to the Billing contract to generate the billing information
 * 
 * 
 **/

contract Order
{
    

      enum Stages {
        RequestOrder,
        AcceptOrder,
        DenyOrder
    }
    
     Stages public stage = Stages.RequestOrder;
    
    struct Order
    {
        uint id;
        string productName;
        string productPrice;
        string purchaseDate;
        string orderStatus;
    }
    
     Order[1000] p;
     
     
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

     
     function setOrderInformation(uint _id,string _purchaseDate,string _productName,string _productPrice,uint id)
     {
     p[id].id = _id;    
     p[id].productName = _productName;
     p[id].productPrice = _productPrice;
     p[id].purchaseDate = _purchaseDate;
     }
     
     
     function SetOrderInfo(uint _id,string _orderStatus)  
     {
         p[_id].orderStatus=_orderStatus;
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
     
     function getStartDate(uint _id) constant returns (string)
     {
         return p[_id].purchaseDate;
     }
     
     function getLength() constant returns (uint)
     {
         return p.length;
     }
}

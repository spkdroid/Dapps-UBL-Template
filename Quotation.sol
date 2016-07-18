/**
 * 
 *    Author: Ramkumar Velmurugan
 * 
 *    Universal Business use case Quotation
 * 
 *    The Quotation functionality will include the infromation quoate that are set up.
 * 
 *    The function setInformtion() will consume the quotation information.
 * 
 *    Using the Get method implemented in the contract the corresponding information can be requested from the contract 
 * 
 *    A simple web3 API layer can be implemented to retrive the result from the contract
 * 
 **/
contract Quotation
{
 
      enum Stages {
        RequestQuotation,
        AcceptQuotation,
        DenyQuotation,
    }
    
    Stages public stage = Stages.RequestQuotation;
    
    // Based on the business logic the Product information can be extended
    // If you business has extra fields in it add the corresponding fileds inside the struct
    struct Product
    {
        uint id;
        string productName;
        string productPrice;
        string productDescription;
        string productRating;
        string startdate;
        string enddate;
    }
    
    // default value has been set to 1000 can be extended based on the requirements
    Product[1000] p;
 
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

 
     // Set information will store the product information inside the contract
     function setInformation(uint _id,string _startdate,string _enddate,string _productName,string _productPrice,string _productDescription,string _productRating,uint id)
     {
     p[id].id = _id;    
     p[id].productName = _productName;
     p[id].productPrice = _productPrice;
     p[id].productDescription = _productDescription;
     p[id].productRating = _productRating;     
     p[id].startdate = _startdate;
     p[id].enddate = _enddate;     
     }
     
     
     // get method to fetch the information from the each fields in the file.
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
     
     function getProdcutDescription(uint _id) constant returns (string)
     {
         return p[_id].productDescription;
     }
     
     function getProductRating(uint _id) constant returns (string)
     {
         return p[_id].productRating;
     }
     
      function getStartDate(uint _id) constant returns (string)
     {
         return p[_id].startdate;
     }
     
     function getEndDate(uint _id) constant returns (string)
     {
         return p[_id].enddate;
     }
     
     // this function will return the list of products that are available in the contract.
     function getLength() constant returns (uint)
     {
         return p.length;
     }
}

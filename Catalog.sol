/**
 *   
 *  Author: Ramkumar Velmurugan
 * 
 *  Use Case: Catalog
 * 
 *  The Catalog is used to hold information when needed. This contract can simply hold a string information and 
 * 
 *  can be used to retrive from the blockchain.
 * 
 * 
 *  The catalog contains only one stage which is encoded in the enum function
 * 
 * 
 * 
 * 
 **/


contract Catalog
{
    
      enum Stages {
        RequestCatalog
    }
    
    Stages public stage = Stages.RequestCatalog;
    
    struct Order
    {
        string CatalogInformation;
    }
    
     Order p;
     
        

     function setOrderInformation(string _CatalogInformation)
     {
     p.CatalogInformation = _CatalogInformation;
     }
     
   
     
     function getId() constant returns (string)
     {
         return p.CatalogInformation;
     }
     
    
}

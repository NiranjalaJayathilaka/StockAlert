import ballerina.data.sql;
import ballerina.lang.system;



function main(string[] args) {
    system:println("1");
    int limit = 20;

    //database connection

   map props = {"jdbcUrl":"jdbc:sqlserver://localhost:1433;databaseName=StockBal",
                  "username":"testuser", "password":"test@123"};

 //sql:ClientConnector(props);
            
 ////////////////////////////
 
sql:Parameter[] params = [];
//int ret = sql:ClientConnector.update(testDB,
             //       "create table Stock(primary key (Stockid int auto_increment),  " +
              //      "ProductName int, Quantity varchar(255),Price float)", params);
    //system:println("Table creation status:" + ret);            
                             
sql:ClientConnector StockDB = create sql:ClientConnector(props);                        
// sql:Parameter[] params = [];
// datatable dt = sql:ClientConnector.select(StockDB, "SELECT * from Stock", params);
                             
// dt = sql:ClientConnector.select(StockDB,"SELECT Stockid,ProductName from Stock", params);
                                    
//var jsonRes, _ = <json>dt;
//system:println(dt);                            
                             
                
 
   
//string[] keyColumns = [];
//string[] ids;
//ret, ids = sql:ClientConnector.updateWithGeneratedKeys
        //       (testDB, "Insert into Stock (ProductName,Quantity,Price) values (Biscuit, 98 , 120.12)",
       //         params, keyColumns);
    // system:println("Inserted row count:" + ret);
   // system:println("Generated key:" + ids[0]);
    
   string [] str = ["user1", "uesr2", "user3","user4"];
   system:println("1");
   //if(  ){}
  int  i=0;
   while(i<10){
       
    sql:Parameter para1 = {sqlType:"integer", value:"1"};
    sql:Parameter para2 = {sqlType:"varchar", value:"biscuit"};
    sql:Parameter para3 = {sqlType:"integer", value:"100"};
    sql:Parameter para4 = {sqlType:"float", value:"50"};
    params = [ para2,para3,para4];
       system:println("1");
      int ret = sql:ClientConnector.update(StockDB,"Insert into Stock (ProductName,Quantity,Price) values (?,?,?)", params); 
                      
      i= i+1;
       
   }
   
   
   
   
   
   
}
   
   
   
    

                                 
                                 
    

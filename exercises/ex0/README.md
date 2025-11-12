[Home - DT266](/README.md#exercises)

# Getting started and Overview of the Model and ABAP Code

### Introduction
In this section we provide information on how to conduct the exercises and provide an introduction to the model and ABAP code used.
We outline how to logon to the system and how to access your package for these exercises.  We briefly introduce the Fiori App to use in the exercises.  

- [0.1 - About the Session](#getting-started-01-about-the-session)
- [0.2 - Overview of the Model and ABAP Code](#getting-started-02-overview-of-the-model-and-abap-code)


### Summary:  
- [Summary & First Exercise](#summary--first-exercise)  




## Getting Started 0.1: About the Session 
[^Top of page](#)

### Logon Information
<table>
    <tr>
    <td>System</td>
    <td>APB (<i> System URL provided in the session </i> )</td>
  </tr>
  <tr>
    <td>User</td>
     <td>DT266-###@education.cloud.sap</td>
  </tr>
      <tr>
    <td>Password</td>
    <td><i>Password provided in the session</i></td>
  </tr>
  <tr>
    <td>Exercise Package</td>
    <td>ZDT266_### <br><i>Don't forget to replace all occurences of the placeholder ### with your assigned location and group number in the exercise steps below.</i></td>
  </tr>
</table>

> [!IMPORTANT]
> **Check the suffix `###` of your demo user (e.g. DT266-###@education.cloud.sap).**
> Only perform changes in your package `ZDT266_###`. 

> [!NOTE]    
> The screenshots in this document have been taken using the suffix or assigned suffix  **`000`** and the system **`APB`**.  
> We **do not recommend** using assigned suffix **`000`**.
> 
> Please note that ADT dialogs and views as well as SAP Fiori UIs may change in upcoming releases.



 -----
### Logon and Connect 
1. Start ABAP Development Tools
2. Create a new Cloud Project via `Create an ABAP cloud project`

   <img src="images/0_CreateProject.png" alt="Create ABAP Project" width="45%">

3. Enter the URL of system APB  and click next (<i> System URL provided in the session </i> )
   <img src="images/0_LogonBrowser.png" alt="Select System" width="50%">


4. Logon with your provided user ( ### group number )
- User: DT266-###@education.cloud.sap
- Password: Password provided in the session.

  <kbd><img src="images/0_LogonScreen.png" alt="Logon with User" width="50%"></kbd>


5. Finish the New Project Creation Wizard

   <img src="images/0_FinishProject.png" alt="FinishProject" width="50%">   

7. Add your exercise package to `Favorite Packages`

   <img src="images/0_AddPackageSelect.png" alt="Add package Nr" width="25%">   

8. Make sure to add the package matched to your group number ### and add it

   <img src="images/0_AddPackage.png" alt="Add package" width="50%">


9. Expand your favorite packages to access your package

   <img src="images/0_Expand_Favorite.png" alt="Expand Favorite" width="50%">   

 -----
### About the ABAP Material
All the ABAP code and database tables to change are in:
- one exercise package with your suffix `ZDT266_###` 
- in this package we have an extended RAP Model with several runtime and application errors and performance issues to analyze and to implement solutions. 
- changes to ABAP code are only necessary in the classes 
   - `ZCL_DT266_CARR_EXTENSION_###`, 
   - `ZBP_R_DT266_CARR_###`, 
   - `ZBP_R_DT266_CARR_###_E`. <br>  
   
   In addition changes for the table `ZDT266_SUP_I_###` in your package have to be executed.

> [!IMPORTANT]
> **Check the suffix `###` of your demo user (e.g. DT266-###@education.cloud.sap).**
> Only perform changes in your package `ZDT266_###`. 


## Getting Started 0.2: Overview of the Model and ABAP Code
[^Top of page](#)

> Todays scenario is based on a RAP application using the [``ABAP Flight Reference Scenario``](https://github.com/SAP-samples/abap-platform-refscen-flight).   For an overview of the available database tables, see ABAP Flight Reference Scenario. They are available in the package /DMO/FLIGHT_LEGACY. This package also includes a data generator with which you can fill the database tables.


In our example we want to provide a list of Airline IDs = Carrier_Id(s) for which we get in the result list additional column fields calculated by customer extension:
- the total of all corresponding flight prices 
- the total price of all corresponding supplements (like meal, beverage, luggage) 
- the percentages %Meals, %Beverages, %Luggage with which those supplement categories contribute to the total price of the supplements

> [!Caution]
> **Runtime error for specific Airlines:**    
> If you click on **`Go`** without specification of any Airline or e.g. choose Airline ID = 'AC' you get a runtime error: <br>
> <kbd><img src="images/runtime_error.png" alt="Add package" width="70%"></kbd> <br>
> **Currently it is only working without error for some specific airlines e.g. Airline ID = 'AA'.**
> This error is analyzed and fixed in [Exercise 1](../ex01/README.md).
---

<kbd><img src="images/Intro_App.png" alt="Open ABAP Trace Requests" width="100%"></kbd>

The calculation is performed in the ABAP class _`ZCL_DT266_CARR_EXTENSION_###`_ where we call in exercise 1 to 4 the method _`GET_PRICES_ABAP`_ and for exercise 5 the method _`GET_PRICES_CDS`_.

> 🟠 _**REMARK:**_ Prerequisite is that you have implemented and activated the [``ABAP Flight Reference Scenario``](https://github.com/SAP-samples/abap-platform-refscen-flight) and filled the demo database tables with sample business data: 
1. Expand the package structure in the Project Explorer `/DMO/FLIGHT_LEGACY` > `Source Code Library` > `Classes`.
2. Select the data generator class `/DMO/CL_FLIGHT_DATA_GENERATOR` and press `F9` (Run as Console Application). 

   When this is finished you can create in a similar way to [``Create Database Table and Generate UI Service``](https://developers.sap.com/tutorials/abap-environment-rap100-generate-ui-service.html) a copy of /DMO/CARRIER with the name `ZDT266_CARR_000` and generated a UI service:

 <details>
  <summary>🔵 Click to expand for Creation of UI Service</summary>

  1. Create  the database table ![ ](../images/adt_tabl.png)**`ZDT266_CARR_000`**: <br>
      Navigate in your package **`ZDT266_###`** to `Favorite Packages` >  `ZLOCAL` > `ZDT266` > `ZDT266_###` > `Dictionary` > `Database Tables` and right-click on `Database Tables` and select **`New Database Table`** <br>
      <kbd><img src="../images/Create_DB_Table.png" alt="generate UI service" width="65%"></kbd> <br>
      Or right-click on your ABAP package **`ZDT266_###`** and select `New` > `Other ABAP Repository Object` from the context menu. 
      <kbd><img src="../images/Create_DB_Table_1.png" alt="generate UI service" width="65%"></kbd> <br>
      Search for `database table`, select it, and click `Next >`. <br>
     <kbd><img src="../images/Create_DB_Table_2.png" alt="generate UI service" width="65%"></kbd> <br>      
      Maintain the required information (### is your group ID) and click `Next >`. <br>
      <br/><kbd><img src="images/Create_Carrier_Copy_1.png" alt="base BO view" width="60%"></kbd> <br>
      <br>Enter the following values
      
      - Name: **`ZDT266_CARR_000`** 
      - Description: **`Carrier Table`**
  
  
      
      Then delete the complete template in new table **`ZDT266_CARR_000`**, insert the code snippet provided below (🟡📄).
  
  
      <details>
       <summary>🟡📄Click to expand and replace the source code!</summary>
  
       > - 💡 Make use of the _Copy Raw Content_ (<img src="../images/copyrawfile.png" alt="" width="3%">) function to copy the provided code snippet.
  
  
  

               @EndUserText.label : 'Carrier in Fligth Model'
               @AbapCatalog.enhancement.category : #NOT_EXTENSIBLE
               @AbapCatalog.tableCategory : #TRANSPARENT
               @AbapCatalog.deliveryClass : #A
               @AbapCatalog.dataMaintenance : #RESTRICTED
               define table zdt266_carr_000 {

               key client            : abap.clnt not null;
               key carrier_id        : /dmo/carrier_id not null;
               name                  : /dmo/carrier_name;
               currency_code         : /dmo/currency_code;
               local_created_by      : abp_creation_user;
               local_created_at      : abp_creation_tstmpl;
               local_last_changed_by : abp_locinst_lastchange_user;
               local_last_changed_at : abp_locinst_lastchange_tstmpl;
               last_changed_at       : abp_lastchange_tstmpl;

               }
  

  
  
      </details>
  
      Activate the table by pressing **`Ctrl+F3`** or by clicking on the match icon <img src="images/Match.png" alt="Open ABAP Trace Requests" width="3%">
  
  
   2. Fill the table **`ZDT266_CARR_000`** by the class ![ ](../images/adt_class.png)**`zcl_dt266_gen_carr_000`**:
  
      Navigate in your package **`ZDT266_000`** to `Favorite Packages` >  `ZLOCAL` > `ZDT266` > `ZDT266_###` > `Source Code Library` > `Classes` and right-click on `Classes` and select **`New ABAP Class`**: <br>
      <kbd><img src="../images/Create_Class.png" alt="generate UI service" width="65%"></kbd>
      Or right-click on your ABAP package **`ZDT266_###`** and select `New` > `ABAP Class` from the context menu. 
      <br/><kbd><img src="images/Create_Carrier_Copy_2.png" alt="base BO view" width="60%"></kbd> <br>
      Search for `database table`, select it, and click `Next >`. <br>     
      And in the pop-up: <br/><kbd><img src="images/Create_Carrier_Copy_3.png" alt="base BO view" width="60%"></kbd> <br>

      <br>Enter the following values
      
      - Name: **`ZCL_DT266_GEN_CARR_000`** 
      - Description: **`Generate Carrier Table Content`**
  
      Delete the complete template in new class **`ZCL_DT266_GEN_CARR_000`**, insert the code snippet provided below (🟡📄).
      and replace all the source code there with:
  
      <details>
       <summary>🟡📄Click to expand and replace the source code!</summary>
  
        > - 💡 Make use of the _Copy Raw Content_ (<img src="../images/copyrawfile.png" alt="" width="3%">) function to copy the provided code snippet.
  

      
            CLASS zcl_dt266_gen_carr_000 DEFINITION
            PUBLIC
            FINAL
            CREATE PUBLIC .

            PUBLIC SECTION.

               INTERFACES if_oo_adt_classrun.
            PROTECTED SECTION.
            PRIVATE SECTION.
            ENDCLASS.



            CLASS ZCL_DT266_GEN_CARR_000 IMPLEMENTATION.


            METHOD if_oo_adt_classrun~main.
               DATA:
                  group_id   TYPE string VALUE '000',
                  table_name TYPE tabname,
                  i          TYPE i.


               i = 0.
               DO 1 TIMES.
               group_id = i.
            *   clear data
               table_name = |zdt266_carr_00{ group_id }|.

            *   clear data
            *    DELETE FROM zdt266_carr_000.
                  DELETE FROM (table_name).

                  "insert travel demo data
                  INSERT (table_name)  FROM (
                     SELECT
                        FROM /dmo/carrier AS carr
                        FIELDS
                        carr~carrier_id AS carrier_id,
                        carr~name AS name,
                        carr~currency_code AS currency_code,
                        carr~local_created_by  AS local_created_by,
                        carr~local_created_at        AS local_created_at,
                        carr~local_last_changed_by    AS local_last_changed_by,
                        carr~local_last_changed_at    AS local_last_changed_at,
                        carr~last_changed_at   AS last_changed_at
                  ).
                  COMMIT WORK.
                  out->write( |[DT266] Demo data generated for table ZDT266_CARR_00{ group_id }. | ).

                  i = i + 1.
               ENDDO.
            ENDMETHOD.
            ENDCLASS.



  
      </details>
  
      💡 Activate the class by pressing **`Ctrl+F3`** or by clicking on the match icon <img src="images/Match.png" alt="Open ABAP Trace Requests" width="3%">
      <br>
      Run the class once by pressing **`F9`** or click on 
        <kbd><img src="../images/Run_Generator.png" alt="generate UI service" width="65%"></kbd>



</details>   

   🟠 _**REMARK:**_ The following overviews are only optional information. This is **not required** to execute the exercises. We recommend to skip reading this additional information and directly continue with [Exercise 1](../ex01/README.md).

More details on the involved underlying Data Model:

<details>   
        <summary>Click here for an Overview of the tables involved</summary>  

<br>

We use in the Exercises the following tables:

| Table | Content | Number of Entries | Key Fields | Other Fields used in Model / Where used | 
|---|---|---|---|---|
|/DMO/CARRIER| Different Carriers, e.g. AA, AC,... | 17 Airline IDs = Carrier IDs | CLIENT, CARRIER_ID | | 
|  `ZDT266_CARR_000` | _Copy of /DMO/CARRIER_ |17 Airline IDs = Carrier IDs | CLIENT, CARRIER_ID | | 
|/DMO/CONNECTION| Connections of the Carriers | 20 rows: Combinations of Carrier & Connection | CLIENT, CARRIER_ID, CONNECTION_ID | |
|/DMO/BOOKING | Booking IDs and travel IDs for each combination of carrer and connection | 9161 rows | CLIENT, TRAVEL_ID, BOOKING_ID | CARRIER_ID, CONNECTION_ID, FLIGHT_PRICE |
|/DMO/BOOK_SUPPL | Supplements like meal, beverage, luggage | 16211 entries | CLIENT, TRAVEL_ID, BOOKING_ID, BOOKING_SUPPLEMENT_ID | SUPPLEMENT_ID|
| `ZDT266_BO_SU_000` | _Copy of 10.000 times /DMO/BOOK_SUPPL_ | 162,100,000 entries | CLIENT, TRAVEL_ID, BOOKING_ID, BOOKING_SUPPLEMENT_ID, **ID** (_10,000 different values_) | _used for CDS performance_|
| /DMO/SUPPLEMENT | Different kind of Supplements and their categories and prices | 48 entries | CLIENT, SUPPLEMENT_ID | SUPPLEMENT_CATEGORY, PRICE|
| `ZDT266_SUP_I_###` | _Copy of 500 times /DMO/SUPPLEMENT_ |24,000 entries |  CLIENT, SUPPLEMENT_ID, **ID** (_500 different values_) | _used for ABAP performance_ |
| `ZDT266_SUP_L_000` | _Copy of 200,000 times /DMO/SUPPLEMENT_ | 9,600,000 entries |  CLIENT, SUPPLEMENT_ID, **ID** (_200,000 different values_) | _used for CDS performance_ |


</details>   


<details>   
        <summary>Click here for an Overview of the ABAP Code</summary>  

 In a similar way to [``Create Database Table and Generate UI Service``](https://developers.sap.com/tutorials/abap-environment-rap100-generate-ui-service.html) 
 we have created a copy of /DMO/CARRIER with the name `ZDT266_CARR_000` and generated a UI service.

 Following [``Using Virtual Elements in CDS Projection Views``](https://help.sap.com/docs/ABAP_PLATFORM_NEW/fc4c71aa50014fd1b43721701471913d/319380e0cef94051ae9aa292ffadb59a.html?version=201909.latest&q=ObjectModel.filter.transformedBy) we created ``Virtual Elements`` declared in the CDS projection view ``ZC_DT266_CARR_###`` created in the previous step:
 
 <img src="images/Virtual_Element.png" alt="Open ABAP Trace Requests" width="80%">

 They shall be calulated in the custom extension class _`ZCL_DT266_CARR_EXTENSION_###`_.
 
 In this class _`ZCL_DT266_CARR_EXTENSION_###`_ two interface methods have to be created (refer to [``Implementing the Calculation of Virtual Elements``](https://help.sap.com/docs/ABAP_PLATFORM_NEW/fc4c71aa50014fd1b43721701471913d/c65942c284dd490a9c3791630d4d4e41.html?version=201909.latest&q=ObjectModel.filter.transformedBy)):

 - IF_SADL_EXIT_CALC_ELEMENT_READ~GET_CALCULATION_INFO
 - IF_SADL_EXIT_CALC_ELEMENT_READ~CALCULATE
 <img src="images/Interface_Methods.png" alt="Open ABAP Trace Requests" width="90%">

 The method ``Calculate`` calls then two alternative methods where we do the calculations:
 - ``GET_PRICES_ABAP`` where the calculations are performed in ABAP code (used in Exercises 1 to 4)
 - ``GET_PRICES_CDS`` where the calculations are performed in CDS views (used in Exercise 5)

 The method ``GET_PRICES_ABAP`` first determines for given ``AIRLINE = CARRIER_ID`` the corresponding connections (from table /DMO/CONNECTION) and for the connections the corresponding bookings (from table /DMO/BOOKING): <br>
 <img src="images/Select_Booking.png" alt="Open ABAP Trace Requests" width="55%">

 And then the supplements for the bookings: <br>
 <img src="images/Select_Supplement.png" alt="Open ABAP Trace Requests" width="55%">

 and their prices and categories: <br>
 <img src="images/Select_Category.png" alt="Open ABAP Trace Requests" width="55%">

 Then we just loop over the selected data to calculate the totals and percentages: <br>
 <img src="images/Calculate1.png" alt="Open ABAP Trace Requests" width="55%">
 <img src="images/Calculate2.png" alt="Open ABAP Trace Requests" width="55%">
 <img src="images/Calculate3.png" alt="Open ABAP Trace Requests" width="55%">

</details>   


 
## Summary & First Exercise

Now that you have made yourself familiar on how to logon and access your package you can continue to - [Exercise 1](../ex01/README.md)



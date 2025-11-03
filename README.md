

# Teched2025_DT266 - Troubleshoot and Optimize ABAP Cloud Extensions in Cloud ERP
Teched Session DT266

[![REUSE status](https://api.reuse.software/badge/github.com/SAP-samples/teched2025-DT266)](https://api.reuse.software/info/github.com/SAP-samples/teched2025-DT266)

Link to GitHub Code Sources:
https://github.com/SAP-samples/teched2025-DT266/tree/main



## Description

This repository contains the material for the SAP TechEd 2025 session called [DT266 | Troubleshoot and optimize extensions for ABAP Cloud in cloud ERP](https://www.sap.com/events/teched/berlin/flow/sap/te25/catalog-inperson/page/catalog/session/1749650347432001y6fi).


- [Overview](#overview)
- [Presentation](#presentation)
- [Exercises](#-exercises)
- [How to obtain support](#how-to-obtain-support) 

<!--- [Presentation & Replay](#presentation--replay)-->

## Overview
[^Top of page](#)

Ensuring optimal performance and stability of your ABAP Cloud-based extensions is crucial to long-term success. 
Learn techniques and best practices for troubleshooting and optimizing custom code in the Cloud ERP. 
Use powerful tools like the ABAP Cross Trace to get deep insights into execution flows and resource consumption.
This session introduces attendees how to analyze custom extensions in SAP Fiori Apps within ABAP Cloud  💎 using tools like ABAP Debugger, Feed Reader,  ABAP Cross Trace, ABAP Trace, SQL Trace, Memory Analyzer, Table Comparison Tool.

---
> ℹ️**DISCLAIMER**:  
> Please note that information about SAP‘s strategy and possible future developments is subject to change and may be changed by SAP at any time for any reason without prior notice. Check out the [SAP Road Map Explorer](https://roadmaps.sap.com/board?range=CURRENT-LAST&PRODUCT=73555000100800001164#Q4%202024) and the [ABAP Cloud Roadmap](https://help.sap.com/docs/abap-cross-product/roadmap-info/abap-cloud-roadmap-information) for more details. 
>> 
---





## Presentation

<!--* Watch the live jump-start session on 📅 Wednesday, Nov 5 | 🕐 3:30 PM - 5:30 PM CET.  
  [DT266 | Troubleshoot and optimize extensions for ABAP Cloud in cloud ERP](https://www.sap.com/events/teched/berlin/flow/sap/te25/catalog-inperson/page/catalog/session/1749650347432001y6fi)   -->   
* Access the presentation: 📄[DT266@SAPTechEd2025.pdf (extended version)](/exercises/images/DT266@SAPTechEd2025.pdf)

---

## 🛠 Exercises
[^Top of page](#)


| Exercise Block  | -- |
| ------------- |  -- |
| **Getting Started** | -- |
| [Getting Started](exercises/ex0/README.md) | -- |
| **Exercise Block for Functional Analysis** | -- |
| [Exercise 1: Analyze Errors with the Feed Reader](exercises/ex01/README.md) | -- |
| [Exercise 2: Usage of the Memory Inspector](exercises/ex02/README.md) | -- |
| [Exercise 3: Usage of the ABAP Cross Trace](exercises/ex03/README.md) | -- |
| **Exercise Block for Performance Analysis** | -- |
| [Exercise 4: Performance Analysis and Improvement using ABAP Trace and Table Comparison Tool](exercises/ex04/README.md) <ul><li> [Exercise 4.1 - Creation and Analysis of an ABAP Trace](exercises/ex04/README.md#exercise-41-creation-and-analysis-of-an-abap-trace) </li> <li> [Exercise 4.2 - Use Table Buffering to Improve the Performance](exercises/ex04/README.md#exercise-42-use-table-buffering-to-improve-the-performance) </li> <li> [Exercise 4.3 - Use Secondary Index & Key to Improve the Performance](exercises/ex04/README.md#exercise-43-use-secondary-index--key-to-improve-the-performance) </li> </ul> | -- |
| **Optional Exercises for Performance Analysis** | -- |
| [Exercise 4: Performance Analysis and Improvement using ABAP Trace and Table Comparison Tool](exercises/ex04/README.md) <ul><li> [Exercise 4.4 - Usage of the Table Comparison Tool](exercises/ex04/README.md#exercise-44-usage-of-the-table-comparison-tool) </li> <li> [Exercise 4.5 - Performance of Nested LOOPs](exercises/ex04/README.md#exercise-45-performance-of-nested-loops)</li> </ul> | -- |
| [Exercise 5: SQL Trace Analysis in SAP HANA SQL Analyzer](exercises/ex05/README.md) | -- |



<!-- 
- [4.3 - Use BINARY SEARCH for READ TABLE Performance](#exercise-43-use-binary-search-for-read-table-performance)

-->

In the [_Getting Started_](exercises/ex0/README.md)  section we outline how to logon to the system and to access your package for these exercises.  We shortly introduce the Fiori App to use in the exercises.  

In [_Exercise 1_](exercises/ex01/README.md) a runtime error occurs for specific input data. With the tool `Feed Reader` and the `ABAP Debugger` we examine the root cause. Here a specific case is not handled correctly in a single line of ABAP code. 


In [_Exercise 2_](exercises/ex02/README.md) after a change in the ABAP code an Out-Of-Memory error is thrown. This runtime error is usually  not related to the call of a single line of code. We analyze with the `Memory Inspector` the memory consumption and increase.

In [_Exercise 3_](exercises/ex03/README.md) you will then use the `ABAP Cross trace` for tracing and analysing ABAP Cloud applications across different runtime components. The tool is useful to track down errors or unexpected behavior even without runtime errors. 


The focus of [_Exercise 4_](exercises/ex04/README.md) is on performance analysis using the ``ABAP Trace``. There we learn different techniques to improve the runtime in ABAP code. In addition with help of the ``Table Comparison Tool`` we analye a functional error introduced with one of our optimizations. 

In [_Exercise 5_](exercises/ex05/README.md) we perform a code push down to the HANA Database using CDS views. Here we learn to create an `SQL trace` and analyze the `execution plan` in the `HANA SQL Analyzer in  Visual Studio Code`.

So let us start and have a look at the _Getting Started_ section.

- [Getting Started - Mandatory, please check](exercises/ex0/)

---

<!--
## 📋Requirements for attending this workshop
[^Top of page](#)

> To complete the practical exercises in this workshop, you need the latest version of the ABAP Development Tools for Eclipse (ADT) on your laptop or PC and the access to a suitable ABAP system* and [Visual Studio Code](https://code.visualstudio.com/) and [SAP HANA SQL Analyzer for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=SAPSE.vsc-extension-sa).
> 
> The appropriate flavor of the [ABAP Flight Reference Scenario](https://github.com/SAP-samples/abap-platform-refscen-flight) must be present in the relevant system.  
> 
> (*) SAP BTP ABAP environment and SAP S/4HANA Cloud Public Edition - as of release 2505 - are currently supported.
>
>> #### ⚠ Exception regarding SAP-led events, such as TechEd 2025   
>> → A dedicated ABAP system for the hands-on workshop participants will be provided.   
>> → Access to the system details for the workshop will be provided by the SAP instructors during the session.

<details>
  <summary>🔵 Click to expand!</summary>

  The requirements to follow the exercises in this repository are:
  1. [Install the latest Eclipse platform and the latest ABAP Development Tools (ADT) plugin](https://developers.sap.com/tutorials/abap-install-adt.html)
  2. [Install the latest Visual Studio Code](https://code.visualstudio.com/)
  3. [Install the latest SAP HANA SQL Analyzer for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=SAPSE.vsc-extension-sa)
  4. [Import the ABAP Flight Reference Scenario](https://github.com/SAP-samples/abap-platform-refscen-flight) 
  5. [Create an ABAP Cloud Project in your ADT installation](https://developers.sap.com/tutorials/abap-environment-create-abap-cloud-project.html)
  6. [Adapt the Web Browser settings in your ADT installation](https://github.com/SAP-samples/abap-platform-rap-workshops/blob/main/requirements_rap_workshops.md#4-adapt-the-web-browser-settings-in-your-adt-installation)   

</details>
---
-->


## Contributing
[^Top of page](#)

Please read the [CONTRIBUTING.md](./CONTRIBUTING.md) to understand the contribution guidelines.

## Code of Conduct
[^Top of page](#)

Please read the [SAP Open Source Code of Conduct](https://github.com/SAP-samples/.github/blob/main/CODE_OF_CONDUCT.md).

## How to obtain support 
[^Top of page](#)

Support for the content in this repository is available during the actual time of the online session for which this content has been designed. Otherwise, you may request support via the [Issues](../../issues) tab.

## License
[^Top of page](#)

Copyright (c) 2025 SAP SE or an SAP affiliate company. All rights reserved. This project is licensed under the Apache Software License, version 2.0 except as noted otherwise in the [LICENSE](LICENSES/Apache-2.0.txt) file.



<!--
## Known Issues
<!-- You may simply state "No known issues. -->
<!--
No known issues.
-->



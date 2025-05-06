# CSE_305_PA3
Team Members:
* Martin You - martin.you@stonybrook.edu 
* Aaron Purnawan - aaron.purnawan@stonybrook.edu 
* Lena Girdhar - lena.girdhar@stonybrook.edu

## Importing .sql file
1. Open MySQL Workbench
2. On Navigator Sidebar, under Management, click on "Data Import/Restore"
3. Select Import from Self-Contained File
4. Select the path to the downloaded .sql dump
6. In Default Target Schema, name the database (this will be of use later)
7. In the bottom, press Start Import

## Importing .war file
1. Open Eclipse, and open a new Workspace
2. Click on import existing projects
3. Select WAR under Web
4. Select the location of the .war file
5. Click on finish
6. Right click the CSE305 folder, Buildpath, Configure Buildpath
7. Go to Libraries, click on JRE, click on edit on the right side
8. Select Workspace default JRE (jre) option
9. Select Finish
10. Select Apply and Close
11. Go to Window > Show View > Servers
12. Create new server, install Tomcat v9.0
13. Go to the configure build path
14. In the libraries tab, click “add external jar"
15. Go to the location where tomcat was installed
16. Inside that folder, go to lib and select ‘servlet-api.jar’
17. Click on finish
18. Now you have set up the project

## Linking sql db
1. Download MySQL Java connector and set it up as mentioned in the README provided by the professor
2. In the /src/main/java/dao/DatabaseConnection.java lines 6, 7 and 8, replace with your login information + database name.
3. Go to src/main/webapp/index.jsp, right click and click on Run As -> Run on Server to start the project. 

## Changes outside of the dao:
* In /src/main/webapp/viewAddOrder.jsp, changed line 35 to name="orderPercentage"
* Added parameter private String date into the /src/main/java/model/Stock.java with getter and setter methods so that OrderPriceHistory can be properly displayed.
* In /src/main/java/resources/EditCustomerController.java changed customerID to customerId in line 39. This is because the customerId was incorrectly named and thus could not be retrieved properly.
* In /src/main/java/resources/DeleteCustomerController.java changed customerID to customerId in line 38. This is because the customerId was incorrectly named and thus could not be retrieved properly.
* Added setters and getters into /src/main/java/model/Account.java. This is because account did not have any ways to set and get the private variables.
* In /src/main/java/resources/GetCustomersController.java removed searchKeyword from method dao.getCustomers() in line 45. Since the keyword is null and thus makes the query retrieve no Customers.
* In /src/main/webapp/ShowStocks.jsp added a new line after line 17, inserting <th>Price</th>, and line 27 (previously line 26) inserted <td>${cd.price}</td>. Added prices to the show stock table.
* Added new variable 'private String priceDate' to /src/main/java/model/Stock.java with getter and setter methods so they can be modified.
* Changed values to begin 2000 end 2030 in /src/main/webapp/viewSalesReport.jsp to make it easier to select stock summary, as current dates set are from 2025.
* Changed doGet() from /src/main/java/resources/GetSalesReportController.java to properly gather data and pass it to the JSP, setting the header properly.

  		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		SalesDao dao = new SalesDao();
		List<RevenueItem> items = dao.getSalesReport(month, year);

		request.setAttribute("items", items);
		request.setAttribute("heading", "Sales Report for " + month + "/" + year);

		RequestDispatcher rd = request.getRequestDispatcher("showSalesReport.jsp");
		rd.forward(request, response);
		}

## Extra Credit
* Improved by adding prices for the Order screen, and in SHowStocks.jsp webpage, and everything that was changed apart from the /dao folder mentioned above was to make the website work properly.

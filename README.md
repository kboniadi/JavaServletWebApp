# JavaServletWebApp

Group Members:
Kord Boniadi,
Hannah Woodward,
Hyejeong Shin

The website will open up to our about/home page and can be navigated to different tabs in the top right.

(All Requirements fulfilled)
Requirements:
1. Overview of the business is in the home/about tab
2. All 10 Products are listed in the products tab
3. Image display of all products in products tab
4. All price and key information displayed under image of product]
5. Clicking on product will take you to order page with more information about the product and an order form
6. Order form is available to fill out and order on the order page of the product]]
7. Once the submit button is pressed the order page will send out an email to the proper email.
8. Alarm is raised if the form inputs are not filled out or not filled out correctly
9. CSS styling is used for all pages and are included in the source file
10. Website is responsive on all pages and can be shown by adjusting window size
11. The image of the product will become bigger if the mouse hover overs it and will decrease in size when 
    the mouse is moved off of it.

## Enable automated verification email request

To enable this feature, you need to create an `.env` file and place it in your `$HOME` directory.

The contents of this file should be as follows:
```bash
EMAIL=noreply@gmail.com
PASSWORD=password
```
**Note**: You must use a valid gmail account with an `App password`.
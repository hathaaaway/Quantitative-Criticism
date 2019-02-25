# Structured Data Modeling Project

In this project, I created a database for a imaginary yoga studio. The project includes project scenario and business rules.


## Description

Based in Boulder, Colorado Boulder Down Dog Yoga is a Yoga study that offers many types of classes.   Some of the classes we offer include Yoga Basic, Flow 1, Flow 2, Yoga Fit, Yoga Hot, Hot Power Fusion, YIN, and Yoga Beatz. These classes give our members an opportunity to gain strength and build muscle in many different ways. 

Along with gaining strength and getting a good workout in, our studio focuses on helping our clients become more mindful by focusing on the connection between breath and movement.  The maximum capacity per class at Boulder Down Dog Yoga is 40 attendees.  Boulder Down Dog Yoga has 5 different locations to help fulfill the yoga needs of the area and to fit all attendees schedule needs.

Down Dog Yoga has three different types of monthly memberships: Unlimited, 10-pack, and a 5-pack. In order to provide a flexible schedule for studio members, many classes will occur multiple times a day. Each class has one instructor. And each class lasts either one hour, one hour and 15 minutes, or 1 and a half hours. All memberships also come at a different cost-level in order to cater to all needs.


## Use Case Diagram

In the Down Dog Yoga system, it includes four actors which are staff, volunteers, members and receptionists. Receptionists take care of signing up and updates information of members, including track payments. And staff can teach classes also attend other yoga classes. And they also have the permission to access staff member info. Volunteers are here for cleaning the studio only. For the members, after they sign up and paid for a membership at reception desk, they can attend as many yoga classes as they want. 

![Use Case Diagram](https://github.com/hathaaaway/Structured-Data-Modeling-Project/blob/master/diagram.png)

## Internat ER Diagram

* Classes
	* Each class has its unique ID for connecting to class schedule
* Students
	* Each student has a unique student ID and can take
multiple classes
* Memberships 
	* In total Down Dog Yoga provides 3 different kind of
membership packages with different costs. 
* Class schedule 
	* Each class can have multiple schedules, and
different staff or volunteer can work for the same
class but for different time. 
* Staff
	* All staff has a unique staff ID to connect with class
Schedule
* Volunteers
	* Volunteers’ information includes hours they have
volunteered 
* Studios
	* Each studio has its unique ID to connect class schedule 

![ER Diagram](https://github.com/hathaaaway/Structured-Data-Modeling-Project/blob/master/ER.png)

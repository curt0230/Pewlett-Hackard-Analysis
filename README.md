# Pewlett-Hackard-Analysis
## Overview
HR has expressed concern that a large percentage Pewlett-Hackard staff is approaching retirement age and requires analysis into staffing requirements for talent acquisition and mentorship programs.  HR data from three categories (employees, salaries, and titles) was imported to a PostgreSQL 14 database and analysis was performed based on the following assumptions:

- Retiring staff was born between 1952-01-01 and 1955-12-31
- Potential mentors were born between 1965-01-01 and 1965-12-31

## Resources
PostgreSQL 14, pgAdmin 4 v6.7

## Results
![summary_data.png](/resources/summary_data.png)

72,457 of Pewlett Hackard's 240,124 staff members have reached retirement age.  By title, senior staff positions are most affected:
- Senior engineer:  25,916 employees (30%) retiring, 529 eligible for mentorship program
- Senior staff:  24,926 employees (30%) retiring, 569 eligible for mentorship program
- Engineer:  9,285 employees (30%) retiring, 190 eligible for mentorship program
- Staff:  7,636 employees (30%) retiring, 155 eligible for mentorship program
- Technique leader:  3,603 employees (30%) retiring, 77 eligible for mentorship program
- Assistant engineer:  1,090 employees (30%) retiring, 29 eligible for mentorship program
- Manager:  2 employees (22%) retiring, 0 eligible for mentorship program

## Summary
Overall, approximately 30% of the Pewlett Hackard staff is expected to retire in the near future.  HR must respond by developint aggressive talent acquisition plans and expanding the mentorship program.  The mentorship program should be promoted and utilized to identify candidates to be mentors and candidates seeking mentorship to develop their professional development plans.  However, given the volume of open positions HR must develop and implement an aggressive talent acquisition program that seeks candidates at all skill levels.

